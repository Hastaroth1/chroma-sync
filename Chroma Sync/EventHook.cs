﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ChromaSync
{
    class EventHook
    {

        public static class MouseHook
        {
            private static readonly object _syncObject = new object();
            public static event EventHandler MouseAction = delegate { };

            public static void Start()
            {
                _hookID = SetHook(_proc);
            }
            public static void stop()
            {
                UnhookWindowsHookEx(_hookID);
            }

            private static LowLevelMouseProc _proc = HookCallback;
            private static IntPtr _hookID = IntPtr.Zero;

            private static IntPtr SetHook(LowLevelMouseProc proc)
            {
                using (Process curProcess = Process.GetCurrentProcess())
                using (ProcessModule curModule = curProcess.MainModule)
                {
                    return SetWindowsHookEx(WH_MOUSE_LL, proc,
                      GetModuleHandle(curModule.ModuleName), 0);
                }
            }

            private delegate IntPtr LowLevelMouseProc(int nCode, IntPtr wParam, IntPtr lParam);
            private static DateTime ld;
            private static IntPtr HookCallback(
              int nCode, IntPtr wParam, IntPtr lParam)
            {
                lock (_syncObject)
                {
                    var ticks = Math.Abs(ld.Ticks - DateTime.Now.Ticks);

                    if (nCode >= 0)
                    {
                        if (!(((MouseMessages)wParam == MouseMessages.WM_MOUSEMOVE || (MouseMessages)wParam == MouseMessages.WM_MOUSEWHEEL) && ticks < 1000000f))
                   
                        {
                            ld = DateTime.Now;
                            MSLLHOOKSTRUCT hookStruct = (MSLLHOOKSTRUCT)Marshal.PtrToStructure(lParam, typeof(MSLLHOOKSTRUCT));
                            var m = new MouseData { e = (MouseMessages)wParam, pt = hookStruct.pt };

                            MouseAction(m, new EventArgs());
                        }
                    }
                }
                return CallNextHookEx(_hookID, nCode, wParam, lParam);
            }

            private const int WH_MOUSE_LL = 14;

            public enum MouseMessages
            {
                WM_LBUTTONDOWN = 0x0201,
                WM_LBUTTONUP = 0x0202,
                WM_MOUSEMOVE = 0x0200,
                WM_MOUSEWHEEL = 0x020A,
                WM_RBUTTONDOWN = 0x0204,
                WM_RBUTTONUP = 0x0205
            }

            public struct MouseData
            {
                public MouseMessages e;
                public POINT pt;
            }

            [StructLayout(LayoutKind.Sequential)]
            public struct POINT
            {
                public int x;
                public int y;
            }

            [StructLayout(LayoutKind.Sequential)]
            public struct MSLLHOOKSTRUCT
            {
                public POINT pt;
                public uint mouseData;
                public uint flags;
                public uint time;
                public IntPtr dwExtraInfo;
            }

            [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
            private static extern IntPtr SetWindowsHookEx(int idHook,
              LowLevelMouseProc lpfn, IntPtr hMod, uint dwThreadId);

            [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
            [return: MarshalAs(UnmanagedType.Bool)]
            private static extern bool UnhookWindowsHookEx(IntPtr hhk);

            [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
            private static extern IntPtr CallNextHookEx(IntPtr hhk, int nCode,
              IntPtr wParam, IntPtr lParam);

            [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
            private static extern IntPtr GetModuleHandle(string lpModuleName);


        }


    }
}
