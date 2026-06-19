' Configuracion de BlueStacks
Set shell = CreateObject("WScript.Shell")
respuesta = shell.Popup("Selecciona el modo:" & vbCrLf & _
            "SI: Bypass (60 FPS)" & vbCrLf & _
            "NO: Panel (240 FPS)" & vbCrLf & _
            "CANCELAR: Legal (240 FPS)", 0, "Selector de FPS", 3 + 32)

If respuesta = 6 Then fps = "60" ElseIf respuesta = 7 Then fps = "240" Else WScript.Quit

' Cerrar el emulador si esta abierto
shell.Run "taskkill /F /IM HD-Player.exe", 0, True

' Modificar el archivo de configuracion
psCommand = "powershell -Command ""$path = 'C:\ProgramData\BlueStacks_nxt\bluestacks.conf'; " & _
            "$content = Get-Content $path; " & _
            "$newContent = $content -replace 'bst.instance.Pie64.max_fps=.*', 'bst.instance.Pie64.max_fps=""' + '" & fps & "' + '""'; " & _
            "Set-Content $path $newContent"""
shell.Run psCommand, 0, True

' Abrir el emulador
shell.Run """C:\Program Files\BlueStacks_nxt\HD-Player.exe"""