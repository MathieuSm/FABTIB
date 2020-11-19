import numpy as np
import sympy as sp
import pandas as pd

from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection, Line3DCollection
from mpl_toolkits.mplot3d import Axes3D
from ipywidgets import interact
import ipywidgets as widgets

desired_width = 320
pd.set_option('display.width', desired_width)
np.set_printoptions(linewidth=desired_width)

# Define Levi-Civita 3rd order permutation tensor
Levi = np.zeros((3, 3, 3))
Levi[0, 1, 2] = 1
Levi[0, 2, 1] = -1
Levi[1, 2, 0] = 1
Levi[1, 0, 2] = -1
Levi[2, 0, 1] = 1
Levi[2, 1, 0] = -1

def CrossProduct(a,b):

    if isinstance(a[0], np.float):
        c = np.zeros(3)
    else:
        c = sp.Matrix([0,0,0])

    for i in range(3):
        for j in range(3):
            for k in range(3):
                c[i] += Levi[i,j,k] * a[j] * b[k]

    return c

def MixedProduct(a,b,c):

    if isinstance(a[0], np.float):
        d = np.zeros(3)
    else:
        d = sp.Matrix([0,0,0])

    e = 0

    for i in range(3):
        for j in range(3):
            for k in range(3):
                d[i] += Levi[i,j,k] * a[j] * b[k]

        e += d[i] * c[i]

    return e

def Composition(A,B):

    if A.size == 9 and B.size == 9:

        if isinstance(A[0,0], np.float):
            C = np.zeros((3, 3))
        else:
            C = sp.zeros(3)

        for i in range(3):
            for j in range(3):
                for k in range(3):
                    C[i, j] += A[i, k] * B[k, j]

        if not isinstance(A[0,0], np.float):
            C = np.array(C)

    elif A.size == 81 and B.size == 81:

        if isinstance(A[0,0,0,0], np.float):
            C = np.zeros((3,3,3,3))
        else:
            C = sp.zeros(9)

        for i in range(3):
            for j in range(3):
                for k in range(3):
                    for l in range(3):
                        for m in range(3):
                            for n in range(3):

                                if isinstance(A[0,0,0,0], np.float):
                                    C[i,j,k,l] += A[i,j,m,n] * B[m,n,k,l]
                                else:
                                    C[3*i+j,3*k+l] += A[i,j,m,n] * B[m,n,k,l]

        if not isinstance(A[0,0,0,0], np.float):
            C = np.array(C).reshape((3,3,3,3))

    else:
        print('Matrices sizes mismatch')

    return C

def Transform(A,B):

    if A.size == 9 and B.size == 3:

        if isinstance(A[0,0], np.float):
            c = np.zeros(3)
        else:
            c = sp.Matrix([0,0,0])

        for i in range(3):
            for j in range(3):
                c[i] += A[i,j] * B[j]

        if not isinstance(A[0,0], np.float):
            c = np.array(c)

        return c

    elif A.size == 27 and B.size == 9:

        if isinstance(A[0,0,0], np.float):
            c = np.zeros(3)
        else:
            c = sp.Matrix([0,0,0])

        for i in range(3):
            for j in range(3):
                for k in range(3):
                    c[i] += A[i,j,k] * B[j,k]

        if not isinstance(A[0,0,0], np.float):
            c = np.array(c)

        return c

    elif A.size == 81 and B.size == 9:

        if isinstance(A[0,0,0,0], np.float):
            C = np.zeros((3,3))
        else:
            C = sp.zeros(3)

        for i in range(3):
            for j in range(3):
                for k in range(3):
                    for l in range(3):
                        C[i,j] += A[i,j,k,l] * B[k,l]

        if not isinstance(A[0,0,0,0], np.float):
            C = np.array(C)

        return C

    else:
        print('Matrices sizes mismatch')

def FrobeniusProduct(A,B):

    s = 0

    if A.size == 9 and B.size == 9:
        for i in range(3):
            for j in range(3):
                s += A[i, j] * B[i, j]

    elif A.size == 36 and B.size == 36:
        for i in range(6):
            for j in range(6):
                s = s + A[i, j] * B[i, j]

    elif A.shape == (9,9) and B.shape == (9,9):
        for i in range(9):
            for j in range(9):
                s = s + A[i, j] * B[i, j]

    elif A.shape == (3,3,3,3) and B.shape == (3,3,3,3):
        for i in range(3):
            for j in range(3):
                for k in range(3):
                    for l in range(3):
                        s = s + A[i, j, k, l] * B[i, j, k, l]

    else:
        print('Matrices sizes mismatch')

    return s

def DyadicProduct(A,B):

    if A.size == 3:

        if isinstance(A[0], np.float):
            C = np.zeros((3,3))
        else:
            C = sp.zeros(3)

        for i in range(3):
            for j in range(3):
                C[i,j] = A[i]*B[j]

        if not isinstance(A[0], np.float):
            C = np.array(C)

    elif A.size == 9:

        if isinstance(A[0,0], np.float):
            C = np.zeros((3,3,3,3))
        else:
            C = sp.zeros(9)

        for i in range(3):
            for j in range(3):
                for k in range(3):
                    for l in range(3):
                        if isinstance(A[0, 0], np.float):
                            C[i,j,k,l] = A[i,j] * B[k,l]
                        else:
                            C[3*i+j,3*k+l] = A[i,j] * B[k,l]

        if not isinstance(A[0,0], np.float):
            C = IsoMorphism99_3333(C)

    else:
        print('Matrices sizes mismatch')

    return C

def TensorProduct(A,B):

    if isinstance(A[0, 0], np.float):
        C = np.zeros((3,3,3,3))
    else:
        C = sp.zeros(9)

    for i in range(3):
        for j in range(3):
            for k in range(3):
                for l in range(3):
                    if isinstance(A[0, 0], np.float):
                        C[i,j,k,l] = A[i,k] * B[j,l]
                    else:
                        C[3*i+j,3*k+l] = A[i,k] * B[j,l]

    if not isinstance(A[0,0], np.float):
        C = IsoMorphism99_3333(C)

    return C

def TransposedProduct(A,B):

    if isinstance(A[0, 0], np.float):
        C = np.zeros((3, 3, 3, 3))
    else:
        C = sp.zeros(9)

    for i in range(3):
        for j in range(3):
            for k in range(3):
                for l in range(3):
                    if isinstance(A[0,0], np.float):
                        C[i,j,k,l] = A[i,l] * B[j,k]
                    else:
                        C[3*i+j,3*k+l] = A[i,l] * B[j,k]

    if not isinstance(A[0,0], np.float):
        C = IsoMorphism99_3333(C)

    return C

def SymmetricProduct(A,B):

    if isinstance(A[0, 0], np.float):
        C = np.zeros((3, 3, 3, 3))
    else:
        C = sp.zeros(9)

    for i in range(3):
        for j in range(3):
            for k in range(3):
                for l in range(3):
                    if isinstance(A[0, 0], np.float):
                        C[i,j,k,l] = (1/2)*(A[i,k]*B[j,l]+A[i,l]*B[j,k])
                    else:
                        C[3*i+j,3*k+l] = (1/2)*(A[i,k]*B[j,l]+A[i,l]*B[j,k])

    if not isinstance(A[0,0], np.float):
        C = IsoMorphism99_3333(C)

    return C

def IsoMorphism3333_99(A):

    if isinstance(A[0,0,0,0], np.float):
        B = np.zeros((9,9))
    else:
        B = sp.zeros(9)

    for i in range(3):
        for j in range(3):
            for k in range(3):
                for l in range(3):
                    B[3*i+j, 3*k+l] = A[i,j,k,l]

    return B

def IsoMorphism99_3333(A):

    if isinstance(A[0, 0], np.float):
        B = np.zeros((3, 3, 3, 3))

    else:
        B = sp.zeros(9)
        B = np.array(B).reshape((3,3,3,3))

    for i in range(3):
        for j in range(3):
            for k in range(3):
                for l in range(3):
                    B[i,j,k,l] = A[3*i+j,3*k+l]

    return B

def IsoMorphism3333_66(A):

    if CheckMinorSymmetry(A) == False:
        print('Tensor does not present minor symmetry')
    else:

        if isinstance(A[0, 0, 0, 0], np.float):
            B = np.zeros((6,6))
        else:
            B = sp.zeros(6)

        B[0, 0] = A[0, 0, 0, 0]
        B[1, 0] = A[1, 1, 0, 0]
        B[2, 0] = A[2, 2, 0, 0]
        B[3, 0] = np.sqrt(2) * A[1, 2, 0, 0]
        B[4, 0] = np.sqrt(2) * A[2, 0, 0, 0]
        B[5, 0] = np.sqrt(2) * A[0, 1, 0, 0]

        B[0, 1] = A[0, 0, 1, 1]
        B[1, 1] = A[1, 1, 1, 1]
        B[2, 1] = A[2, 2, 1, 1]
        B[3, 1] = np.sqrt(2) * A[1, 2, 1, 1]
        B[4, 1] = np.sqrt(2) * A[2, 0, 1, 1]
        B[5, 1] = np.sqrt(2) * A[0, 1, 1, 1]

        B[0, 2] = A[0, 0, 2, 2]
        B[1, 2] = A[1, 1, 2, 2]
        B[2, 2] = A[2, 2, 2, 2]
        B[3, 2] = np.sqrt(2) * A[1, 2, 2, 2]
        B[4, 2] = np.sqrt(2) * A[2, 0, 2, 2]
        B[5, 2] = np.sqrt(2) * A[0, 1, 2, 2]

        B[0, 3] = np.sqrt(2) * A[0, 0, 1, 2]
        B[1, 3] = np.sqrt(2) * A[1, 1, 1, 2]
        B[2, 3] = np.sqrt(2) * A[2, 2, 1, 2]
        B[3, 3] = 2 * A[1, 2, 1, 2]
        B[4, 3] = 2 * A[2, 0, 1, 2]
        B[5, 3] = 2 * A[0, 1, 1, 2]

        B[0, 4] = np.sqrt(2) * A[0, 0, 2, 0]
        B[1, 4] = np.sqrt(2) * A[1, 1, 2, 0]
        B[2, 4] = np.sqrt(2) * A[2, 2, 2, 0]
        B[3, 4] = 2 * A[1, 2, 2, 0]
        B[4, 4] = 2 * A[2, 0, 2, 0]
        B[5, 4] = 2 * A[0, 1, 2, 0]

        B[0, 5] = np.sqrt(2) * A[0, 0, 0, 1]
        B[1, 5] = np.sqrt(2) * A[1, 1, 0, 1]
        B[2, 5] = np.sqrt(2) * A[2, 2, 0, 1]
        B[3, 5] = 2 * A[1, 2, 0, 1]
        B[4, 5] = 2 * A[2, 0, 0, 1]
        B[5, 5] = 2 * A[0, 1, 0, 1]

        return B

def IsoMorphism66_3333(A):

    # Check symmetry
    Symmetry = True
    for i in range(6):
        for j in range(6):
            if not A[i,j] == A[j,i]:
                Symmetry = False
                break
    if Symmetry == False:
        print('Matrix is not symmetric!')
        return



    if isinstance(A[0, 0], np.float):
        B = np.zeros((3,3,3,3))
    else:
        B = sp.zeros((3,3,3,3))

    # Build 4th tensor
    B[0, 0, 0, 0] = A[0, 0]
    B[1, 1, 0, 0] = A[1, 0]
    B[2, 2, 0, 0] = A[2, 0]
    B[1, 2, 0, 0] = A[3, 0] / np.sqrt(2)
    B[2, 0, 0, 0] = A[4, 0] / np.sqrt(2)
    B[0, 1, 0, 0] = A[5, 0] / np.sqrt(2)

    B[0, 0, 1, 1] = A[0, 1]
    B[1, 1, 1, 1] = A[1, 1]
    B[2, 2, 1, 1] = A[2, 1]
    B[1, 2, 1, 1] = A[3, 1] / np.sqrt(2)
    B[2, 0, 2, 1] = A[4, 1] / np.sqrt(2)
    B[0, 1, 2, 1] = A[5, 1] / np.sqrt(2)

    B[0, 0, 2, 2] = A[0, 2]
    B[1, 1, 2, 2] = A[1, 2]
    B[2, 2, 2, 2] = A[2, 2]
    B[1, 2, 2, 2] = A[3, 2] / np.sqrt(2)
    B[2, 0, 2, 2] = A[4, 2] / np.sqrt(2)
    B[0, 1, 2, 2] = A[5, 2] / np.sqrt(2)

    B[0, 0, 1, 2] = A[0, 3] / np.sqrt(2)
    B[1, 1, 1, 2] = A[1, 3] / np.sqrt(2)
    B[2, 2, 1, 2] = A[2, 3] / np.sqrt(2)
    B[1, 2, 1, 2] = A[3, 3] / 2
    B[2, 0, 1, 2] = A[4, 3] / 2
    B[0, 1, 1, 2] = A[5, 3] / 2

    B[0, 0, 2, 0] = A[0, 4] / np.sqrt(2)
    B[1, 1, 2, 0] = A[1, 4] / np.sqrt(2)
    B[2, 2, 2, 0] = A[2, 4] / np.sqrt(2)
    B[1, 2, 2, 0] = A[3, 4] / 2
    B[2, 0, 2, 0] = A[4, 4] / 2
    B[0, 1, 2, 0] = A[5, 4] / 2

    B[0, 0, 0, 1] = A[0, 5] / np.sqrt(2)
    B[1, 1, 0, 1] = A[1, 5] / np.sqrt(2)
    B[2, 2, 0, 1] = A[2, 5] / np.sqrt(2)
    B[1, 2, 0, 1] = A[3, 5] / 2
    B[2, 0, 0, 1] = A[4, 5] / 2
    B[0, 1, 0, 1] = A[5, 5] / 2



    # Add minor symmetries ijkl = ijlk and ijkl = jikl

    B[0, 0, 0, 0] = B[0, 0, 0, 0]
    B[0, 0, 0, 0] = B[0, 0, 0, 0]

    B[0, 0, 1, 0] = B[0, 0, 0, 1]
    B[0, 0, 0, 1] = B[0, 0, 0, 1]

    B[0, 0, 1, 1] = B[0, 0, 1, 1]
    B[0, 0, 1, 1] = B[0, 0, 1, 1]

    B[0, 0, 2, 1] = B[0, 0, 1, 2]
    B[0, 0, 1, 2] = B[0, 0, 1, 2]

    B[0, 0, 2, 2] = B[0, 0, 2, 2]
    B[0, 0, 2, 2] = B[0, 0, 2, 2]

    B[0, 0, 0, 2] = B[0, 0, 2, 0]
    B[0, 0, 2, 0] = B[0, 0, 2, 0]



    B[0, 1, 0, 0] = B[0, 1, 0, 0]
    B[1, 0, 0, 0] = B[0, 1, 0, 0]

    B[0, 1, 1, 0] = B[0, 1, 0, 1]
    B[1, 0, 0, 1] = B[0, 1, 0, 1]

    B[0, 1, 1, 1] = B[0, 1, 1, 1]
    B[1, 0, 1, 1] = B[0, 1, 1, 1]

    B[0, 1, 2, 1] = B[0, 1, 1, 2]
    B[1, 0, 1, 2] = B[0, 1, 1, 2]

    B[0, 1, 2, 2] = B[0, 1, 2, 2]
    B[1, 0, 2, 2] = B[0, 1, 2, 2]

    B[0, 1, 0, 2] = B[0, 1, 2, 0]
    B[1, 0, 2, 0] = B[0, 1, 2, 0]



    B[1, 1, 0, 0] = B[1, 1, 0, 0]
    B[1, 1, 0, 0] = B[1, 1, 0, 0]

    B[1, 1, 1, 0] = B[1, 1, 0, 1]
    B[1, 1, 0, 1] = B[1, 1, 0, 1]

    B[1, 1, 1, 1] = B[1, 1, 1, 1]
    B[1, 1, 1, 1] = B[1, 1, 1, 1]

    B[1, 1, 2, 1] = B[1, 1, 1, 2]
    B[1, 1, 1, 2] = B[1, 1, 1, 2]

    B[1, 1, 2, 2] = B[1, 1, 2, 2]
    B[1, 1, 2, 2] = B[1, 1, 2, 2]

    B[1, 1, 0, 2] = B[1, 1, 2, 0]
    B[1, 1, 2, 0] = B[1, 1, 2, 0]



    B[1, 2, 0, 0] = B[1, 2, 0, 0]
    B[2, 1, 0, 0] = B[1, 2, 0, 0]

    B[1, 2, 1, 0] = B[1, 2, 0, 1]
    B[2, 1, 0, 1] = B[1, 2, 0, 1]

    B[1, 2, 1, 1] = B[1, 2, 1, 1]
    B[2, 1, 1, 1] = B[1, 2, 1, 1]

    B[1, 2, 2, 1] = B[1, 2, 1, 2]
    B[2, 1, 1, 2] = B[1, 2, 1, 2]

    B[1, 2, 2, 2] = B[1, 2, 2, 2]
    B[2, 1, 2, 2] = B[1, 2, 2, 2]

    B[1, 2, 0, 2] = B[1, 2, 2, 0]
    B[2, 1, 2, 0] = B[1, 2, 2, 0]



    B[2, 2, 0, 0] = B[2, 2, 0, 0]
    B[2, 2, 0, 0] = B[2, 2, 0, 0]

    B[2, 2, 1, 0] = B[2, 2, 0, 1]
    B[2, 2, 0, 1] = B[2, 2, 0, 1]

    B[2, 2, 1, 1] = B[2, 2, 1, 1]
    B[2, 2, 1, 1] = B[2, 2, 1, 1]

    B[2, 2, 2, 1] = B[2, 2, 1, 2]
    B[2, 2, 1, 2] = B[2, 2, 1, 2]

    B[2, 2, 2, 2] = B[2, 2, 2, 2]
    B[2, 2, 2, 2] = B[2, 2, 2, 2]

    B[2, 2, 0, 2] = B[2, 2, 2, 0]
    B[2, 2, 2, 0] = B[2, 2, 2, 0]



    B[2, 0, 0, 0] = B[2, 0, 0, 0]
    B[0, 2, 0, 0] = B[2, 0, 0, 0]

    B[2, 0, 1, 0] = B[2, 0, 0, 1]
    B[0, 2, 0, 1] = B[2, 0, 0, 1]

    B[2, 0, 1, 1] = B[2, 0, 1, 1]
    B[0, 2, 1, 1] = B[2, 0, 1, 1]

    B[2, 0, 2, 1] = B[2, 0, 1, 2]
    B[0, 2, 1, 2] = B[2, 0, 1, 2]

    B[2, 0, 2, 2] = B[2, 0, 2, 2]
    B[0, 2, 2, 2] = B[2, 0, 2, 2]

    B[2, 0, 0, 2] = B[2, 0, 2, 0]
    B[0, 2, 2, 0] = B[2, 0, 2, 0]


    # Complete minor symmetries
    B[0, 2, 1, 0] = B[0, 2, 0, 1]
    B[0, 2, 0, 2] = B[0, 2, 2, 0]
    B[0, 2, 2, 1] = B[0, 2, 1, 2]

    B[1, 0, 1, 0] = B[1, 0, 0, 1]
    B[1, 0, 0, 2] = B[1, 0, 2, 0]
    B[1, 0, 2, 1] = B[1, 0, 1, 2]

    B[2, 1, 1, 0] = B[2, 1, 0, 1]
    B[2, 1, 0, 2] = B[2, 1, 2, 0]
    B[2, 1, 2, 1] = B[2, 1, 1, 2]


    # Add major symmetries ijkl = klij
    B[0, 1, 1, 1] = B[1, 1, 0, 1]
    B[1, 0, 1, 1] = B[1, 1, 1, 0]

    B[0, 2, 1, 1] = B[1, 1, 0, 2]
    B[2, 0, 1, 1] = B[1, 1, 2, 0]


    return B

def IsoMorphism99_66(A):

    if CheckMinorSymmetry == False:
        print('Tensor does not present minor symmetry')
    else:

        if isinstance(A[0, 0], np.float):
            B = np.zeros((6,6))
        else:
            B = sp.zeros(6)

        Sequence = [0,4,8,5,6,1]

        for i in range(6):
            for j in range(6):

                B[i,j] = A[Sequence[i],Sequence[j]]

                if i in [3,4,5] and j in [0,1,2]:
                    B[i, j] = B[i,j] * np.sqrt(2)

                if i in [0,1,2] and j in [3,4,5]:
                    B[i, j] = B[i,j] * np.sqrt(2)

                if i in [3,4,5] and j in [3,4,5]:
                    B[i, j] = B[i,j] * 2

        return B

def CheckMinorSymmetry(A):
    MinorSymmetry = True
    for i in range(3):
        for j in range(3):
            PartialTensor = A[:,:, i, j]
            if PartialTensor[1, 0] == PartialTensor[0, 1] and PartialTensor[2, 0] == PartialTensor[0, 2] and PartialTensor[1, 2] == PartialTensor[2, 1]:
                MinorSymmetry = True
            else:
                MinorSymmetry = False
                break

    if MinorSymmetry == True:
        for i in range(3):
            for j in range(3):
                PartialTensor = np.squeeze(A[i, j,:,:])
                if PartialTensor[1, 0] == PartialTensor[0, 1] and PartialTensor[2, 0] == PartialTensor[0, 2] and PartialTensor[1, 2] == PartialTensor[2, 1]:
                    MinorSymmetry = True
                else:
                    MinorSymmetry = False
                    break

def ComplianceTensor(EngineeringConstants, EigenValues=[1,1,1], Rho=0, EigenVectors=np.zeros(3)):

    if np.sum(EigenVectors).all() == 0:
        I = np.eye(3)
        EigenVectors = [I[:, 0], I[:, 1], I[:, 2]]

    ComplianceTensor = np.zeros((3, 3, 3, 3))

    if len(EngineeringConstants) == 12 or len(EngineeringConstants) == 9:

        if len(EngineeringConstants) == 12:

            E1, E2, E3 = EngineeringConstants[0:3]
            Mu23, Mu31, Mu12 = EngineeringConstants[3:6]
            Mu32, Mu13, Mu21 = Mu23, Mu31, Mu12
            Nu23, Nu31, Nu12 = EngineeringConstants[6:9]
            Nu32, Nu13, Nu21 = EngineeringConstants[9:]

        elif len(EngineeringConstants) == 9:
            E1, E2, E3 = EngineeringConstants[0:3]
            Mu23, Mu31, Mu12 = EngineeringConstants[3:6]
            Mu32, Mu13, Mu21 = Mu23, Mu31, Mu12
            Nu23, Nu31, Nu12 = EngineeringConstants[6:]
            Nu32 = Nu23 * E3 / E2
            Nu13 = Nu31 * E1 / E3
            Nu21 = Nu12 * E2 / E1

        E = E1, E2, E3
        Nu = np.array([[Nu13, Nu12], [Nu21, Nu23], [Nu32, Nu31]])
        Mu = np.array([[Mu13, Mu12], [Mu21, Mu23], [Mu32, Mu31]])

        for i in range(3):
            Mi = DyadicProduct(EigenVectors[i], EigenVectors[i])

            Part1 = 1 / E[i] * DyadicProduct(Mi, Mi)

            ComplianceTensor += Part1

            for ii in range(3 - 1):
                j = i - ii - 1
                Mj = DyadicProduct(EigenVectors[j], EigenVectors[j])
                Part2 = -Nu[i, ii] / E[i] * DyadicProduct(Mi, Mj)
                Part3 = 1 / (2 * Mu[i, ii]) * SymmetricProduct(Mi, Mj)

                ComplianceTensor += Part2 + Part3

    elif len(EngineeringConstants) == 5:

        if Rho == 0:
            print('BV/TV is missing!')

        else:

            E0, Nu0, Mu0, k, l = EngineeringConstants

            for i in range(3):
                Mi = DyadicProduct(EigenVectors[i], EigenVectors[i])

                Part1 = 1 / (E0 * Rho ** k * EigenValues[i] ** (2 * l)) * DyadicProduct(Mi, Mi)

                ComplianceTensor += Part1

                for ii in range(3 - 1):
                    j = i - ii - 1
                    Mj = DyadicProduct(EigenVectors[j], EigenVectors[j])
                    Part2 = -Nu0 / (E0 * Rho ** k * EigenValues[i] ** l * EigenValues[j] ** l) * DyadicProduct(Mi, Mj)
                    Part3 = 1 / (2 * Mu0 * Rho ** k * EigenValues[i] ** l * EigenValues[j] ** l) * SymmetricProduct(Mi,
                                                                                                                    Mj)

                    ComplianceTensor += Part2 + Part3

    ComplianceTensor = IsoMorphism3333_66(ComplianceTensor)

    return ComplianceTensor

def StiffnessTensor(LaméConstants, EigenValues, Rho, EigenVectors=0):

    if EigenVectors == 0:
        I = np.eye(3)
        EigenVectors = [I[:, 0], I[:, 1], I[:, 2]]

    StiffnessTensor = np.zeros((3, 3, 3, 3))

    if len(LaméConstants) == 5:

        if Rho == 0:
            print('BV/TV is missing!')

        else:

            Lambda0, Lambda0p, Mu0, k, l = LaméConstants

            for i in range(3):
                Mi = DyadicProduct(EigenVectors[i], EigenVectors[i])

                Part1 = (Lambda0 + 2 * Mu0) * Rho ** k * EigenValues[i] ** (2 * l) * DyadicProduct(Mi, Mi)

                StiffnessTensor += Part1

                for ii in range(3 - 1):
                    j = i - ii - 1
                    Mj = DyadicProduct(EigenVectors[j], EigenVectors[j])
                    Part2 = Lambda0p * Rho ** k * EigenValues[i] ** l * EigenValues[j] ** l * DyadicProduct(Mi, Mj)
                    Part3 = 2 * Mu0 * Rho ** k * EigenValues[i] ** l * EigenValues[j] ** l * SymmetricProduct(Mi, Mj)

                    StiffnessTensor += Part2 + Part3

    else:
        print('Wrong number of parameters: Lambda0, Lambdaop, Mu0, k, l')

    StiffnessTensor = IsoMorphism3333_66(StiffnessTensor)

    return StiffnessTensor

def TransformTensor(A,OriginalBasis,NewBasis):

    # Build change of coordinate matrix
    O = OriginalBasis
    N = NewBasis

    Q = np.zeros((3,3))
    for i in range(3):
        for j in range(3):
            Q[i,j] = np.dot(O[i,:],N[j,:])

    if A.size == 36:
        A4 = IsoMorphism66_3333(A)

    elif A.size == 81 and A.shape == (3,3,3,3):
        A4 = A

    TransformedA = np.zeros((3, 3, 3, 3))
    for i in range(3):
        for j in range(3):
            for k in range(3):
                for l in range(3):
                    for m in range(3):
                        for n in range(3):
                            for o in range(3):
                                for p in range(3):
                                    TransformedA[i, j, k, l] += Q[m,i]*Q[n,j]*Q[o,k]*Q[p,l] * A4[m, n, o, p]
    if A.size == 36:
        TransformedA = IsoMorphism3333_66(TransformedA)

    return TransformedA

def RotateTensor(A, RotationAxisOrder, RotationAngles):

    # Initialization
    Type = len(A.shape)
    C = np.array([])

    # Convert angles to radian
    Yaw   = RotationAngles[0] * np.pi / 180.0
    Pitch = RotationAngles[1] * np.pi / 180.0
    Roll  = RotationAngles[2] * np.pi / 180.0

    R = np.zeros((3, 3, 3))
    R[0] = np.array([[1, 0, 0],[0, np.cos(Yaw), np.sin(Yaw)],[0, -np.sin(Yaw), np.cos(Yaw)]])
    R[1] = np.array([[np.cos(Pitch), 0, -np.sin(Pitch)],[0, 1, 0],[np.sin(Pitch), 0, np.cos(Pitch)]])
    R[2] = np.array([[np.cos(Roll), np.sin(Roll), 0],[-np.sin(Roll), np.cos(Roll), 0],[0, 0, 1]])
    Rot = np.dot(R[(RotationAxisOrder[2] - 1)],
          np.dot(R[(RotationAxisOrder[1] - 1)],
                 R[(RotationAxisOrder[0] - 1)]))

    if Type == 1:
        C = np.zeros((3,))
        for i in range(3):
            for m in range(3):
                C[i] += Rot[i,m] * A[m]

    elif Type == 2:
        C = np.zeros((3, 3))
        for i in range(3):
            for j in range(3):
                for m in range(3):
                    for n in range(3):
                        C[i,j] += C[i,j] + Rot[i,m] * Rot[j,n] * A[m,n]

    elif Type == 3:
        C = np.zeros((3, 3, 3))
        for i in range(3):
            for j in range(3):
                for k in range(3):
                    for m in range(3):
                        for n in range(3):
                            for o in range(3):
                                C[i,j,k] += C[i,j,k] + Rot[i,m] * Rot[j,n] * Rot[k,o] * A[m,n,o]

    elif Type == 4:
        C = np.zeros((3, 3, 3, 3))
        for i in range(3):
            for j in range(3):
                for k in range(3):
                    for l in range(3):
                        for m in range(3):
                            for n in range(3):
                                for o in range(3):
                                    for p in range(3):
                                        C[i,j,k,l] += Rot[i,m] * Rot[j,n] * Rot[k,o] * Rot[l,p] * A[m,n,o,p]

    else:
        print('Tensor format not supported')
    return C

def TransposeTensor(A):

    if A.size == 9:

        if isinstance(A[0, 0], np.float):
            B = np.zeros((3, 3))
        else:
            B = sp.zeros(3)

        for i in range(3):
            for j in range(3):
                B[i, j] = A[j, i]

    elif A.size == 81:

        if isinstance(A[0, 0, 0, 0], np.float):
            B = np.zeros((3, 3, 3, 3))
        else:
            B = sp.zeros(9)

        for i in range(3):
            for j in range(3):
                for k in range(3):
                    for l in range(3):
                        if isinstance(A[0, 0, 0, 0], np.float):
                            B[i, j, k, l] = A[k, l, i, j]
                        else:
                            B[3*i+j,3*k+l] = A[k, l, i, j]

    return B

def Engineering2MandelNotation(A):

    if isinstance(A[0, 0], np.float):
        B = np.zeros((6,6))
    else:
        B = sp.zeros(6)


    for i in range(6):
        for j in range(6):

            if i < 3 and j >= 3:
                B[i,j] = A[i,j] * np.sqrt(2)

            elif i >= 3 and j < 3:
                B[i,j] = A[i,j] * np.sqrt(2)

            elif i >= 3 and j >= 3:
                B[i,j] = A[i,j] * 2

            else:
                B[i, j] = A[i, j]

    return B

def Mandel2EngineeringNotation(A):

    if isinstance(A[0, 0], np.float):
        B = np.zeros((6,6))
    else:
        B = sp.zeros(6)


    for i in range(6):
        for j in range(6):

            if i < 3 and j >= 3:
                B[i,j] = A[i,j] / np.sqrt(2)

            elif i >= 3 and j < 3:
                B[i,j] = A[i,j] / np.sqrt(2)

            elif i >= 3 and j >= 3:
                B[i,j] = A[i,j] / 2

            else:
                B[i, j] = A[i, j]

    return B

def CubicElasticityRelations(ConstantsType):

    # Define Symbols
    E0, Nu0, Mu0, Lambda0, Lambda0p = sp.symbols(r'\epsilon_{0} \nu_{0} \mu_{0} \lambda_{0} \lambda_{0}^{`}')
    Rho, m1, m2, m3, k, l = sp.symbols(r'\rho m_{1} m_{2} m_{3} k l')
    EigenValues = np.array([m1, m2, m3])

    # Define Eigenvectors
    I = sp.eye(3)
    vm1, vm2, vm3 = I[:, 0], I[:, 1], I[:, 2]
    EigenVectors = np.array([vm1, vm2, vm3])

    # Build Orthotropic Compliance Tensor
    ComplianceTensor = sp.zeros(9)

    for i in range(3):
        Mi = DyadicProduct(EigenVectors[i], EigenVectors[i])
        Part1 = 1 / (E0 * Rho ** k * EigenValues[i] ** (2 * l)) * DyadicProduct(Mi, Mi)

        ComplianceTensor += IsoMorphism3333_99(Part1)

        for ii in range(3 - 1):
            j = i - ii - 1
            Mj = DyadicProduct(EigenVectors[j], EigenVectors[j])
            Part2 = -Nu0 / (E0 * Rho ** k * EigenValues[i] ** l * EigenValues[j] ** l) * DyadicProduct(Mi, Mj)
            Part3 = 1 / (2 * Mu0 * Rho ** k * EigenValues[i] ** l * EigenValues[j] ** l) * SymmetricProduct(Mi, Mj)

            ComplianceTensor += IsoMorphism3333_99(Part2 + Part3)

    ComplianceTensor = IsoMorphism99_66(ComplianceTensor)

    # Compute Inverse Compliance Matrix (= Stiffness Matrix)
    ComplianceTensorInv = sp.Matrix(ComplianceTensor).inv()

    # Build Orthotropic Stiffness Matrix
    StiffnessTensor = sp.zeros(9)

    for i in range(3):
        Mi = DyadicProduct(EigenVectors[i], EigenVectors[i])
        Part1 = (Lambda0 + 2 * Mu0) * Rho ** k * EigenValues[i] ** (2 * l) * DyadicProduct(Mi, Mi)

        StiffnessTensor += IsoMorphism3333_99(Part1)

        for ii in range(3 - 1):
            j = i - ii - 1
            Mj = DyadicProduct(EigenVectors[j], EigenVectors[j])
            Part2 = Lambda0p * Rho ** k * EigenValues[i] ** l * EigenValues[j] ** l * DyadicProduct(Mi, Mj)
            Part3 = 2 * Mu0 * Rho ** k * EigenValues[i] ** l * EigenValues[j] ** l * SymmetricProduct(Mi, Mj)

            StiffnessTensor += IsoMorphism3333_99(Part2 + Part3)

    StiffnessTensor = IsoMorphism99_66(StiffnessTensor)

    # Express Relation
    Equation = StiffnessTensor - ComplianceTensorInv

    if ConstantsType == 'Engineering Constants':
        Solution = sp.solve(Equation, Lambda0, Lambda0p)
        Relation1 = Solution[Lambda0]
        Relation2 = Solution[Lambda0p]

    elif ConstantsType == 'Lamé Constants':
        Solution = sp.solve(Equation, E0, Mu0)
        Relation1 = Solution[E0]
        Relation2 = Solution[Mu0]

    return Relation1, Relation2

def PlotTetra(P1,P2,P3,P4):
    
    P1 = np.array([P1[0][0],P1[1][0],P1[2][0]])
    P2 = np.array([P2[0][0],P2[1][0],P2[2][0]])
    P3 = np.array([P3[0][0],P3[1][0],P3[2][0]])
    P4 = np.array([P4[0][0],P4[1][0],P4[2][0]])
    
    Figure = plt.figure()
    Axis   = Figure.add_subplot(111, projection='3d')

    # vertices of a pyramid
    Vertices = np.array([P1,P2,P3,P4])
    Center   = Vertices.sum(axis=0)/4
    Vectors  = Vertices-Center
    Max = np.abs(Vectors).max()
    Axis.scatter3D(Vertices[:, 0], Vertices[:, 1], Vertices[:, 2],facecolor="red")

    # generate list of sides' polygons of our pyramid
    Faces = [[Vertices[0],Vertices[1],Vertices[2]], 
             [Vertices[0],Vertices[1],Vertices[3]],
             [Vertices[0],Vertices[2],Vertices[3]],
             [Vertices[1],Vertices[2],Vertices[3]]]

    # plot sides
    Axis.add_collection3d(Poly3DCollection(Faces, 
     facecolors='black', linewidths=1, edgecolors='black', alpha=.25))

    # make the panes transparent
    Axis.xaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
    Axis.yaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
    Axis.zaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
    # make the grid lines transparent
    Axis.xaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
    Axis.yaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
    Axis.zaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
    # modify ticks
    # Axis.set_xticks([-1, 0, 1])
    # Axis.set_yticks([-1, 0, 1])
    # Axis.set_zticks([-1, 0, 1])
    # set limits
    Axis.set_xlim(Center[0]-Max,Center[0]+Max)
    Axis.set_ylim(Center[1]-Max,Center[1]+Max)
    Axis.set_zlim(Center[2]-Max,Center[2]+Max)
    # set axes labels
    Axis.set_xlabel('e$_1$')
    Axis.set_ylabel('e$_2$')
    Axis.set_zlabel('e$_3$')

    plt.show()
    
    return

def Plot2Tetra(X1,X2,X3,X4,Y1,Y2,Y3,Y4):
    
    Figure = plt.figure()
    Axis   = Figure.add_subplot(111, projection='3d')

    P1 = np.array([X1[0][0],X1[1][0],X1[2][0]])
    P2 = np.array([X2[0][0],X2[1][0],X2[2][0]])
    P3 = np.array([X3[0][0],X3[1][0],X3[2][0]])
    P4 = np.array([X4[0][0],X4[1][0],X4[2][0]])

    # vertices of a pyramid
    Vertices = np.array([P1,P2,P3,P4])
    Center1  = Vertices.sum(axis=0)/4
    Vectors1 = Vertices-Center1


    Axis.scatter3D(Vertices[:, 0], Vertices[:, 1], Vertices[:, 2],facecolor="blue")

    # generate list of sides' polygons of our pyramid
    Faces = [[Vertices[0],Vertices[1],Vertices[2]], 
             [Vertices[0],Vertices[1],Vertices[3]],
             [Vertices[0],Vertices[2],Vertices[3]],
             [Vertices[1],Vertices[2],Vertices[3]]]

    # plot sides
    Axis.add_collection3d(Poly3DCollection(Faces, 
     facecolors='blue', linewidths=1, edgecolors='blue', alpha=.25))

    P1 = np.array([Y1[0][0],Y1[1][0],Y1[2][0]])
    P2 = np.array([Y2[0][0],Y2[1][0],Y2[2][0]])
    P3 = np.array([Y3[0][0],Y3[1][0],Y3[2][0]])
    P4 = np.array([Y4[0][0],Y4[1][0],Y4[2][0]])

    # vertices of a pyramid
    Vertices = np.array([P1,P2,P3,P4])
    Center2  = Vertices.sum(axis=0)/4
    Vectors2 = Vertices-Center2


    Axis.scatter3D(Vertices[:, 0], Vertices[:, 1], Vertices[:, 2],facecolor="red")

    # generate list of sides' polygons of our pyramid
    Faces = [[Vertices[0],Vertices[1],Vertices[2]], 
             [Vertices[0],Vertices[1],Vertices[3]],
             [Vertices[0],Vertices[2],Vertices[3]],
             [Vertices[1],Vertices[2],Vertices[3]]]

    # plot sides
    Axis.add_collection3d(Poly3DCollection(Faces, facecolors='red', linewidths=1, edgecolors='red', alpha=.25))

    # add displacement arrows
    Axis.quiver(X1[0][0],X1[1][0],X1[2][0],
                Y1[0][0]-X1[0][0],Y1[1][0]-X1[1][0],Y1[2][0]-X1[2][0],
                color=(0,0,0),linewidth=2)
    Axis.quiver(X2[0][0],X2[1][0],X2[2][0],
                Y2[0][0]-X2[0][0],Y2[1][0]-X2[1][0],Y2[2][0]-X2[2][0],
                color=(0,0,0),linewidth=2)
    Axis.quiver(X3[0][0],X3[1][0],X3[2][0],
                Y3[0][0]-X3[0][0],Y3[1][0]-X3[1][0],Y3[2][0]-X3[2][0],
                color=(0,0,0),linewidth=2)
    Axis.quiver(X4[0][0],X4[1][0],X4[2][0],
                Y4[0][0]-X4[0][0],Y4[1][0]-X4[1][0],Y4[2][0]-X4[2][0],
                color=(0,0,0),linewidth=2)

    # make the panes transparent
    Axis.xaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
    Axis.yaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
    Axis.zaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
    # make the grid lines transparent
    Axis.xaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
    Axis.yaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
    Axis.zaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
    # modify ticks
    # Axis.set_xticks([-1, 0, 1])
    # Axis.set_yticks([-1, 0, 1])
    # Axis.set_zticks([-1, 0, 1])
    # set limits
    Center    = (Center1 + Center2) / 2
    Vertices1 = Vectors1 + Center1
    Vertices2 = Vectors2 + Center2
    Vectors1  = Vertices1-Center
    Vectors2  = Vertices2-Center
    Max = max(np.abs(Vectors1).max(),np.abs(Vectors2).max())
    Axis.set_xlim(Center[0]-Max,Center[0]+Max)
    Axis.set_ylim(Center[1]-Max,Center[1]+Max)
    Axis.set_zlim(Center[2]-Max,Center[2]+Max)
    # set axes labels
    Axis.xaxis.set_rotate_label(False)  # disable automatic rotation
    Axis.yaxis.set_rotate_label(False)  # disable automatic rotation
    Axis.zaxis.set_rotate_label(False)  # disable automatic rotation
    Axis.set_xlabel('e$_1$', rotation=0)
    Axis.set_ylabel('e$_2$', rotation=0)
    Axis.set_zlabel('e$_3$', rotation=0)

    plt.show()

    return

def TetraRigidMotion(X1,X2,X3,X4,Displacements=[0,0,0],Angles=[0,0,0]):
    
    Figure = plt.figure()
    Axis   = Figure.add_subplot(111, projection='3d')

    def ShowRigidMotion(t=0):

        Alpha, Beta, Gamma = Angles[0]*t,Angles[1]*t,Angles[2]*t

        R1 = np.array([[1,0,0],
                       [0,np.cos(Alpha),-np.sin(Alpha)],
                       [0,np.sin(Alpha),np.cos(Alpha)]])

        R2 = np.array([[np.cos(Beta),0,np.sin(Beta)],
                       [0,1,0],
                       [-np.sin(Beta),0,np.cos(Beta)]])

        R3 = np.array([[np.cos(Gamma),-np.sin(Gamma),0],
                       [np.sin(Gamma),np.cos(Gamma),0],
                       [0,0,1]])

        R = R3.dot(R2.dot(R1))
        b = np.array([[Displacements[0]],[Displacements[1]],[Displacements[2]]])*t

        Y1 = R.dot(X1) + b
        Y2 = R.dot(X2) + b
        Y3 = R.dot(X3) + b
        Y4 = R.dot(X4) + b

        P1 = np.array([X1[0][0],X1[1][0],X1[2][0]])
        P2 = np.array([X2[0][0],X2[1][0],X2[2][0]])
        P3 = np.array([X3[0][0],X3[1][0],X3[2][0]])
        P4 = np.array([X4[0][0],X4[1][0],X4[2][0]])

        # vertices of a pyramid
        Vertices = np.array([P1,P2,P3,P4])
        Center1  = Vertices.sum(axis=0)/4
        Vectors1 = Vertices-Center1

        plt.cla()
        Axis.scatter3D(Vertices[:, 0], Vertices[:, 1], Vertices[:, 2],facecolor="blue")

        # generate list of sides' polygons of our pyramid
        Faces = [[Vertices[0],Vertices[1],Vertices[2]], 
                 [Vertices[0],Vertices[1],Vertices[3]],
                 [Vertices[0],Vertices[2],Vertices[3]],
                 [Vertices[1],Vertices[2],Vertices[3]]]

        # plot sides
        Axis.add_collection3d(Poly3DCollection(Faces, 
         facecolors='blue', linewidths=1, edgecolors='blue', alpha=.25))

        P1 = np.array([Y1[0][0],Y1[1][0],Y1[2][0]])
        P2 = np.array([Y2[0][0],Y2[1][0],Y2[2][0]])
        P3 = np.array([Y3[0][0],Y3[1][0],Y3[2][0]])
        P4 = np.array([Y4[0][0],Y4[1][0],Y4[2][0]])

        # vertices of a pyramid
        Vertices = np.array([P1,P2,P3,P4])
        Center2  = Vertices.sum(axis=0)/4
        Vectors2 = Vertices-Center2

        Axis.scatter3D(Vertices[:, 0], Vertices[:, 1], Vertices[:, 2],facecolor="red")

        # generate list of sides' polygons of our pyramid
        Faces = [[Vertices[0],Vertices[1],Vertices[2]], 
                 [Vertices[0],Vertices[1],Vertices[3]],
                 [Vertices[0],Vertices[2],Vertices[3]],
                 [Vertices[1],Vertices[2],Vertices[3]]]

        # plot sides
        Axis.add_collection3d(Poly3DCollection(Faces, facecolors='red', linewidths=1, edgecolors='red', alpha=.25))

        # add displacement arrows
        Axis.quiver(X1[0][0],X1[1][0],X1[2][0],
                    Y1[0][0]-X1[0][0],Y1[1][0]-X1[1][0],Y1[2][0]-X1[2][0],
                    color=(0,0,0),linewidth=2)
        Axis.quiver(X2[0][0],X2[1][0],X2[2][0],
                    Y2[0][0]-X2[0][0],Y2[1][0]-X2[1][0],Y2[2][0]-X2[2][0],
                    color=(0,0,0),linewidth=2)
        Axis.quiver(X3[0][0],X3[1][0],X3[2][0],
                    Y3[0][0]-X3[0][0],Y3[1][0]-X3[1][0],Y3[2][0]-X3[2][0],
                    color=(0,0,0),linewidth=2)
        Axis.quiver(X4[0][0],X4[1][0],X4[2][0],
                    Y4[0][0]-X4[0][0],Y4[1][0]-X4[1][0],Y4[2][0]-X4[2][0],
                    color=(0,0,0),linewidth=2)

        # make the panes transparent
        Axis.xaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
        Axis.yaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
        Axis.zaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
        # make the grid lines transparent
        Axis.xaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
        Axis.yaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
        Axis.zaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
        # modify ticks
        # Axis.set_xticks([-1, 0, 1])
        # Axis.set_yticks([-1, 0, 1])
        # Axis.set_zticks([-1, 0, 1])
        # set limits
        Center    = (Center1 + Center2) / 2
        Vertices1 = Vectors1 + Center1
        Vertices2 = Vectors2 + Center2
        Vectors1  = Vertices1-Center
        Vectors2  = Vertices2-Center
        Max = max(np.abs(Vectors1).max(),np.abs(Vectors2).max())
        Axis.set_xlim(Center[0]-Max,Center[0]+Max)
        Axis.set_ylim(Center[1]-Max,Center[1]+Max)
        Axis.set_zlim(Center[2]-Max,Center[2]+Max)
        # set axes labels
        Axis.xaxis.set_rotate_label(False)  # disable automatic rotation
        Axis.yaxis.set_rotate_label(False)  # disable automatic rotation
        Axis.zaxis.set_rotate_label(False)  # disable automatic rotation
        Axis.set_xlabel('e$_1$', rotation=0)
        Axis.set_ylabel('e$_2$', rotation=0)
        Axis.set_zlabel('e$_3$', rotation=0)

        plt.show()

        return
    
    interact(ShowRigidMotion, t=(0.0,1.0,0.1));

    return

def TetraDeformation(X1,X2,X3,X4,DeformationGradient=np.eye(3)):
    
    Figure = plt.figure()
    Axis   = Figure.add_subplot(111, projection='3d')

    def ShowDeformation(t=0):
        
        I = np.eye(3)
        
        F = I + (DeformationGradient-I) * t

        Y1 = F.dot(X1)
        Y2 = F.dot(X2)
        Y3 = F.dot(X3)
        Y4 = F.dot(X4)

        P1 = np.array([X1[0][0],X1[1][0],X1[2][0]])
        P2 = np.array([X2[0][0],X2[1][0],X2[2][0]])
        P3 = np.array([X3[0][0],X3[1][0],X3[2][0]])
        P4 = np.array([X4[0][0],X4[1][0],X4[2][0]])

        # vertices of a pyramid
        Vertices = np.array([P1,P2,P3,P4])
        Center1  = Vertices.sum(axis=0)/4
        Vectors1 = Vertices-Center1

        plt.cla()
        Axis.scatter3D(Vertices[:, 0], Vertices[:, 1], Vertices[:, 2],facecolor="blue")

        # generate list of sides' polygons of our pyramid
        Faces = [[Vertices[0],Vertices[1],Vertices[2]], 
                 [Vertices[0],Vertices[1],Vertices[3]],
                 [Vertices[0],Vertices[2],Vertices[3]],
                 [Vertices[1],Vertices[2],Vertices[3]]]

        # plot sides
        Axis.add_collection3d(Poly3DCollection(Faces, 
         facecolors='blue', linewidths=1, edgecolors='blue', alpha=.25))

        P1 = np.array([Y1[0][0],Y1[1][0],Y1[2][0]])
        P2 = np.array([Y2[0][0],Y2[1][0],Y2[2][0]])
        P3 = np.array([Y3[0][0],Y3[1][0],Y3[2][0]])
        P4 = np.array([Y4[0][0],Y4[1][0],Y4[2][0]])

        # vertices of a pyramid
        Vertices = np.array([P1,P2,P3,P4])
        Center2  = Vertices.sum(axis=0)/4
        Vectors2 = Vertices-Center2

        Axis.scatter3D(Vertices[:, 0], Vertices[:, 1], Vertices[:, 2],facecolor="red")

        # generate list of sides' polygons of our pyramid
        Faces = [[Vertices[0],Vertices[1],Vertices[2]], 
                 [Vertices[0],Vertices[1],Vertices[3]],
                 [Vertices[0],Vertices[2],Vertices[3]],
                 [Vertices[1],Vertices[2],Vertices[3]]]

        # plot sides
        Axis.add_collection3d(Poly3DCollection(Faces, facecolors='red', linewidths=1, edgecolors='red', alpha=.25))

        # add displacement arrows
        Axis.quiver(X1[0][0],X1[1][0],X1[2][0],
                    Y1[0][0]-X1[0][0],Y1[1][0]-X1[1][0],Y1[2][0]-X1[2][0],
                    color=(0,0,0),linewidth=2)
        Axis.quiver(X2[0][0],X2[1][0],X2[2][0],
                    Y2[0][0]-X2[0][0],Y2[1][0]-X2[1][0],Y2[2][0]-X2[2][0],
                    color=(0,0,0),linewidth=2)
        Axis.quiver(X3[0][0],X3[1][0],X3[2][0],
                    Y3[0][0]-X3[0][0],Y3[1][0]-X3[1][0],Y3[2][0]-X3[2][0],
                    color=(0,0,0),linewidth=2)
        Axis.quiver(X4[0][0],X4[1][0],X4[2][0],
                    Y4[0][0]-X4[0][0],Y4[1][0]-X4[1][0],Y4[2][0]-X4[2][0],
                    color=(0,0,0),linewidth=2)

        # make the panes transparent
        Axis.xaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
        Axis.yaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
        Axis.zaxis.set_pane_color((1.0, 1.0, 1.0, 0.0))
        # make the grid lines transparent
        Axis.xaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
        Axis.yaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
        Axis.zaxis._axinfo["grid"]['color'] = (1, 1, 1, 0)
        # modify ticks
        # Axis.set_xticks([-1, 0, 1])
        # Axis.set_yticks([-1, 0, 1])
        # Axis.set_zticks([-1, 0, 1])
        # set limits
        Center    = (Center1 + Center2) / 2
        Vertices1 = Vectors1 + Center1
        Vertices2 = Vectors2 + Center2
        Vectors1  = Vertices1-Center
        Vectors2  = Vertices2-Center
        Max = max(np.abs(Vectors1).max(),np.abs(Vectors2).max())
        Axis.set_xlim(Center[0]-Max,Center[0]+Max)
        Axis.set_ylim(Center[1]-Max,Center[1]+Max)
        Axis.set_zlim(Center[2]-Max,Center[2]+Max)
        # set axes labels
        Axis.xaxis.set_rotate_label(False)  # disable automatic rotation
        Axis.yaxis.set_rotate_label(False)  # disable automatic rotation
        Axis.zaxis.set_rotate_label(False)  # disable automatic rotation
        Axis.set_xlabel('e$_1$', rotation=0)
        Axis.set_ylabel('e$_2$', rotation=0)
        Axis.set_zlabel('e$_3$', rotation=0)

        plt.show()

        return
    
    interact(ShowDeformation, t=(0.0,1.0,0.1));

    return