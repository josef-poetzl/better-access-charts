VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "BAC_StringBuilder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
'###########################################################################################
'# Copyright (c) 2020 - 2022 Thomas Moeller, supported by K.D.Gundermann                   #
'# MIT License  => https://github.com/team-moeller/better-access-charts/blob/main/LICENSE  #
'# Version 2.08.04  published: 19.01.2022                                                  #
'###########################################################################################

Option Compare Database
Option Explicit


'### Members

Private m_String As String


'### Public Methods

Public Sub Add(ByVal TheString As String)
    m_String = m_String & TheString
End Sub

Public Sub AddLine(ByVal TheString As String)
    m_String = m_String & TheString & vbCrLf
End Sub

Public Sub CutTrailingComma()
    m_String = BAC.Helper.CutTrailingComma(m_String)
End Sub

Public Function ToString() As String
    ToString = m_String
End Function