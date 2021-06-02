from sys import argv, exit, stdout
from time import *
from string import *
import struct, os
import pandas as pd
import struct
import re

def AIM2mhd(fileInName):
    fileOutName = fileInName.replace('.AIM', '')

    data = open(fileInName, 'rb').read(60)

    # Identify AIM version
    start = 20
    stop = start + struct.calcsize('i')
    aimVer_20 = struct.unpack('i', data[start:stop])[0]
    start = 0
    stop = 16
    string = struct.unpack('16s', data[start:stop])[0]
    start = 56
    stop = start + 4
    aimVer_30 = struct.unpack('i', data[start:stop])[0]

    ## Find header int
    binints = open(fileInName, 'rb').read(32 * 4)
    header_int = struct.unpack('=32i', binints)
    if string.count(b'AIMDATA_V030') != 1 and aimVer_20 == 16:
        version = 20
        header = open(fileInName, 'rb').read(header_int[2])
    elif string.count(b'AIMDATA_V030') == 1 and aimVer_30 == 24:
        version = 30
        header = open(fileInName, 'rb').read(header_int[8])

    ## Read AIM header
    header = re.sub(b'(?i) +', b' ', header)
    header = header.split(b'\n')
    header.pop(0); header.pop(0); header.pop(0); header.pop(0)
    Scaling = None; Slope = None; Intercept = None
    for line in header:
        if line.find(b'Orig-ISQ-Dim-p') > -1:
            OrigDimp = (float(line.split(b' ')[1]),
                        float(line.split(b' ')[2]),
                        float(line.split(b' ')[3]))
        if line.find(b'Orig-ISQ-Dim-um') > -1:
            OrigDimum = (float(line.split(b' ')[1]),
                         float(line.split(b' ')[2]),
                         float(line.split(b' ')[3]))
        if line.find(b'Orig-GOBJ-Dim-p') > -1:
            OrigDimp = (float(line.split(b' ')[1]),
                        float(line.split(b' ')[2]),
                        float(line.split(b' ')[3]))
        if line.find(b'Orig-GOBJ-Dim-um') > -1:
            OrigDimum = (float(line.split(b' ')[1]),
                         float(line.split(b' ')[2]),
                         float(line.split(b' ')[3]))
        if line.find(b'Scaled by factor') > -1:
            Scaling = float(line.split(b' ')[-1])
        if line.find(b'Density: intercept') > -1:
            Intercept = float(line.split(b' ')[-1])
        if line.find(b'Density: slope') > -1:
            Slope = float(line.split(b' ')[-1])
        if line.find(b'scale (el_size factor)') > -1:
            Factor = (float(line.split(b' ')[-3]),
                      float(line.split(b' ')[-2]),
                      float(line.split(b' ')[-1]))
    try:
        Spacing = np.around(np.asarray(OrigDimum) / np.asarray(OrigDimp) / 1000, 5)
    except:
        pass
    try:
        Factor = np.around(Factor, 5)
    except:
        Factor = [0, 0, 0]


    if version == 20:
        data = open(fileInName, 'rb').read(160)
        start = 0
        stop = struct.calcsize('5i')
        (sizePreHeader, sizeImStruct, sizeProcLog, sizeImData, sizeImAssocData) = struct.unpack('5i',
                                                                                                data[start:stop])
        start = stop
        stop = start + struct.calcsize('i')
        aimVer = struct.unpack('i', data[start:stop])[0]
        start = stop
        stop = start + struct.calcsize('4i')
        start = stop
        stop = start + struct.calcsize('i')
        aimTypeNum = struct.unpack('i', data[start:stop])[0]
        if aimTypeNum == 131074:
            aimType = 'short'
        elif aimTypeNum == 65537:
            aimType = 'char'
        elif aimTypeNum == 1376257:
            aimType = 'bin compressed'
        else:
            aimType = 'unknown'
        stdout.write('Data type: ' + aimType + '\n')
        stdout.flush()
        start = stop
        stop = start + struct.calcsize('3i')
        (px, py, pz) = struct.unpack('3i', data[start:stop])
        start = stop
        stop = start + struct.calcsize('3i')
        (nx, ny, nz) = struct.unpack('3i', data[start:stop])
        stdout.write('Data dimensions (nx, ny, nz): ' + str(nx) + ' ' + str(ny) + ' ' + str(nz) + '\n')
        stdout.flush()
        start = stop
        stop = start + struct.calcsize('3i')
        (ox, oy, oz) = struct.unpack('3i', data[start:stop])
        start = stop
        stop = start + struct.calcsize('12i')
        start = stop
        stop1 = start + struct.calcsize('B')
        stop2 = start + struct.calcsize('2B')
        stop3 = start + struct.calcsize('3B')
        stop4 = start + struct.calcsize('4B')
        stop = stop4
        bin_swap = struct.pack('cccc', data[stop2:stop3], data[stop3:stop4], data[start:stop1], data[stop1:stop2])
        lx = struct.unpack('f', bin_swap)[0] / 4.0
        start = stop
        stop1 = start + struct.calcsize('B')
        stop2 = start + struct.calcsize('2B')
        stop3 = start + struct.calcsize('3B')
        stop4 = start + struct.calcsize('4B')
        stop = stop4
        bin_swap = struct.pack('cccc', data[stop2:stop3], data[stop3:stop4], data[start:stop1], data[stop1:stop2])
        ly = struct.unpack('f', bin_swap)[0] / 4.0
        start = stop
        stop1 = start + struct.calcsize('B')
        stop2 = start + struct.calcsize('2B')
        stop3 = start + struct.calcsize('3B')
        stop4 = start + struct.calcsize('4B')
        stop = stop4
        bin_swap = struct.pack('cccc', data[stop2:stop3], data[stop3:stop4], data[start:stop1], data[stop1:stop2])
        lz = struct.unpack('f', bin_swap)[0] / 4.0
        stdout.write(
            'Data element sizes (lx,ly,lz) in nanometers: ' + str(lx) + ' ' + str(ly) + ' ' + str(lz) + '\n')
        stdout.flush()
        start = stop
        stop = start + struct.calcsize('4i')

    elif version == 30:
        data = open(fileInName, 'rb').read(280)
        start = 0
        stop = 16
        string = struct.unpack('16s', data[start:stop])[0]
        start = stop
        stop = start + struct.calcsize('5q')
        (sizePreHeader, sizeImStruct, sizeProcLog, sizeImData, sizeImAssocData) = struct.unpack('5q',
                                                                                                data[start:stop])
        start = stop
        stop = start + 4
        aimVer = struct.unpack('i', data[start:stop])[0]
        start = stop
        stop = start + struct.calcsize('3i')
        (ID, Ref, aimTypeNum) = struct.unpack('3i', data[start:stop])
        if aimTypeNum == 131074:
            aimType = 'short'
        elif aimTypeNum == 65537:
            aimType = 'char'
        elif aimTypeNum == 1376257:
            aimType = 'bin compressed'
        else:
            aimType = 'unknown'
        stdout.write('Data type: ' + aimType + '\n')
        stdout.flush()
        start = stop
        stop = start + struct.calcsize('3q')
        (px, py, pz) = struct.unpack('3q', data[start:stop])
        start = stop
        stop = start + struct.calcsize('3q')
        (nx, ny, nz) = struct.unpack('3q', data[start:stop])
        stdout.write('Data dimensions (nx, ny, nz): ' + str(nx) + ' ' + str(ny) + ' ' + str(nz) + '\n')
        stdout.flush()
        start = stop
        stop = start + struct.calcsize('3q')
        (ox, oy, oz) = struct.unpack('3q', data[start:stop])
        start = stop
        stop = start + struct.calcsize('3q')
        (a, b, c) = struct.unpack('3q', data[start:stop])
        start = stop
        stop = start + struct.calcsize('3q')
        (d, e, f) = struct.unpack('3q', data[start:stop])
        start = stop
        stop = start + struct.calcsize('3q')
        (g, h, i) = struct.unpack('3q', data[start:stop])
        start = stop
        stop = start + struct.calcsize('3q')
        (j, k, l) = struct.unpack('3q', data[start:stop])
        start = stop
        stop = start + struct.calcsize('3q')
        (lx, ly, lz) = struct.unpack('3q', data[start:stop])
        stdout.write(
            'Data element sizes (lx,ly,lz) in nanometers: ' + str(lx) + ' ' + str(ly) + ' ' + str(lz) + '\n')
        stdout.flush()
        start = stop
        stop = start + struct.calcsize('4i')
        (a, b, c, d) = struct.unpack('4i', data[start:stop])

        header = f.read(AIM_ints[8])
        header_len = len(header) + 280


    time1 = clock()
    stdout.write('Writing the .mhd and the .raw files...\n')
    stdout.flush()
    fileSize = os.path.getsize(fileInName)
    headerSize = sizePreHeader + sizeImStruct + sizeProcLog
    arraySize = sizeImData
    dummyFileName = 'dummy.raw'
    firstSize = fileSize - headerSize
    cmd_1 = 'tail -c ' + str(firstSize) + ' ' + fileInName + ' > ' + dummyFileName
    print(cmd_1)
    os.system(cmd_1)
    cmd_2 = 'head -c ' + str(arraySize) + ' ' + dummyFileName + ' > ' + fileOutName + '.raw'
    print(cmd_2)
    os.system(cmd_2)
    cmd_3 = 'rm ' + dummyFileName
    print(cmd_3)
    os.system(cmd_3)
    time2 = clock()
    print('CPU time   :', time2 - time1, 'sec\n')

    if aimType == 'char':
        format = 'MET_UCHAR'
    elif aimType == 'short':
        format = 'MET_SHORT'
    else:
        format = 'MET_FLOAT'
    outs = open(fileOutName + '.mhd', 'w')
    outs.write('ObjectType = Image\n')
    outs.write('NDims = 3\n')
    outs.write('BinaryData = True\n')
    outs.write('BinaryDataByteOrderMSB = False\n')
    outs.write('CompressedData = False\n')
    outs.write('TransformMatrix = 1.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 1.0\n')
    if version == 20:
        outs.write('Offset = %g %g %g\n' % (float(px) * lx, float(py) * ly, float(pz) * lz))
    elif version == 30:
        outs.write('Offset = %g %g %g\n' % (
        float(px) * float(lx) / 1000000, float(py) * float(ly) / 1000000, float(pz) * float(lz) / 1000000))
    outs.write('CenterOfRotation = 0.0 0.0 0.0\n')
    outs.write('AnatomicalOrientation = RAI\n')
    if version == 20:
        outs.write('ElementSpacing = %g %g %g\n' % (lx, ly, lz))
    elif version == 30:
        outs.write('ElementSpacing = %g %g %g\n' % (float(lx) / 1000000, float(ly) / 1000000, float(lz) / 1000000))
    outs.write('DimSize = %i %i %i\n' % (nx, ny, nz))
    outs.write('ElementType = %s\n' % format)
    (path, rawFile) = os.path.split(fileOutName)
    outs.write('ElementDataFile = %s\n' % (rawFile + '.raw'))

    ## Add BMD scaling parameters (if found)
    if Scaling:
        outs.write('\n# Scaling = %f\n' % Scaling)
    if Slope:
        outs.write('\n# Slope = %f\n' % Slope)
    if Intercept:
        outs.write('\n# Intercept = %f\n' % Intercept)

    outs.close()

    return

DataPath = '/home/mathieu/Documents/Post-Msc/10_Additionnal/01_Healthy_BMD/01_Scans/'

Samples = pd.DataFrame(os.listdir(DataPath))
Samples = Samples.sort_values(by=0,ignore_index=True)

for Sample in Samples[0].values:

    Files = [File for File in os.listdir(DataPath+Sample[:-4]) if File.endswith('.AIM')]

    for File in Files:
        AIMFile = os.path.join(DataPath, Sample, File)
        AIM2mhd(AIMFile)
