Attribute VB_Name = "mdl_BAC_AddInSupport"
'---------------------------------------------------------------------------------------
'<codelib>
'  <file>%AppFolder%/source/mdl_BAC_AddInSupport.bas</file>
'</codelib>
'---------------------------------------------------------------------------------------
Option Compare Database
Option Explicit

Public Const MSGBOXTITLE As String = "BetterAccessCharts-Loader"
Public Const BAC_LoaderModuleName As String = "BetterAccessChartsLoader"
Public Const BAC_FactoryModuleName As String = "BetterAccessChartsFactory"
Public Const BAC_AddInFileName As String = "BetterAccessCharts"

Public Const BetterAccessChartAddInVersion As String = "0.1.0"

Public CallAsAccessAddIn As Boolean

#If VBA7 Then

Private Declare PtrSafe Function WNetGetConnection Lib "mpr.dll" Alias "WNetGetConnectionA" ( _
            ByVal lpszLocalName As String, _
            ByVal lpszRemoteName As String, _
            cbRemoteName As Long) As Long
#Else
Private Declare Function WNetGetConnection Lib "mpr.dll" Alias "WNetGetConnectionA" ( _
            ByVal lpszLocalName As String, _
            ByVal lpszRemoteName As String, _
            cbRemoteName As Long) As Long
#End If

Public Function AddInStartUp()
   CallAsAccessAddIn = True
   DoCmd.OpenForm "frm_Startup"
End Function

Public Function NewTransferModule() As TransferCodeModule
    
    Set NewTransferModule = New TransferCodeModule
    
End Function

Public Function UncPath( _
                ByVal Path As String, _
                Optional ByVal IgnoreErrors As Boolean = True) As String
   
   Dim UNC As String * 512
   
   If Len(Path) = 1 Then Path = Path & ":"
   
   If WNetGetConnection(Left$(Path, 2), UNC, Len(UNC)) Then
   
      ' API-Routine gibt Fehler zur�ck:
      If IgnoreErrors Then
         UncPath = Path
      Else
         Err.Raise 5 ' Invalid procedure call or argument
      End If
   Else
      ' Ergebnis zur�ckgeben:
      UncPath = Left$(UNC, InStr(UNC, vbNullChar) - 1) & Mid$(Path, 3)
   End If
   
End Function