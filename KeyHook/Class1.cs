﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace KeyHook
{
    public class Hooker
    {

        private static List<Callback> callbacks = new List<Callback>();

        ///////////////////////////////////////////////////////////
        //A bunch of DLL Imports to set a low level keyboard hook
        ///////////////////////////////////////////////////////////
        [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        private static extern IntPtr SetWindowsHookEx(int idHook,
            LowLevelKeyboardProc lpfn, IntPtr hMod, uint dwThreadId);

        [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        [return: MarshalAs(UnmanagedType.Bool)]
        private static extern bool UnhookWindowsHookEx(IntPtr hhk);

        [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        private static extern IntPtr CallNextHookEx(IntPtr hhk, int nCode,
            IntPtr wParam, IntPtr lParam);

        [DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        private static extern IntPtr GetModuleHandle(string lpModuleName);

        ////////////////////////////////////////////////////////////////
        //Some constants to make handling our hook code easier to read
        ////////////////////////////////////////////////////////////////
        private const int WH_KEYBOARD_LL = 13;                    //Type of Hook - Low Level Keyboard
        private const int WM_KEYDOWN = 0x0100;                    //Value passed on KeyDown
        private const int WM_KEYUP = 0x0101;                      //Value passed on KeyUp
        private static LowLevelKeyboardProc _proc = HookCallback; //The function called when a key is pressed
        private static IntPtr _hookID = IntPtr.Zero;
        private static bool CONTROL_DOWN = false;                 //Bool to use as a flag for control key

        public static void Start()
        {
            callbacks = new List<Callback>();
            _hookID = SetHook(_proc);  //Set our hook
            Debug.WriteLine("Starting KeyHook");
            Debug.WriteLine(_hookID);
        }

        public static void AutoStart()
        {
            Start();
        }

        private static IntPtr SetHook(LowLevelKeyboardProc proc)
        {

            Debug.WriteLine("Setting Hook");
            try
            {
                using (Process curProcess = Process.GetCurrentProcess())
                {
                    Debug.WriteLine(curProcess.ProcessName);
                    using (ProcessModule curModule = curProcess.MainModule)
                    {

                        return SetWindowsHookEx(WH_KEYBOARD_LL, proc,
                            GetModuleHandle(curModule.ModuleName), 0);
                    }

                }

            }
            catch (Exception e)
            {
                Debug.WriteLine(e.Message);
            }
            return IntPtr.Zero;
        }

        private delegate IntPtr LowLevelKeyboardProc(int nCode, IntPtr wParam, IntPtr lParam);

        private static IntPtr HookCallback(int nCode, IntPtr wParam, IntPtr lParam)
        {

            try
            {
                if (nCode >= 0 && wParam == (IntPtr)WM_KEYDOWN) //A Key was pressed down
                {
                    Debug.WriteLine("Hook callback");
                    int vkCode = Marshal.ReadInt32(lParam);           //Get the keycode
                    string theKey = ((Keys)vkCode).ToString();        //Name of the key



                    foreach (Callback action in callbacks)
                    {

                        try
                        {
                            action.callback(theKey);

                        }
                        catch (Exception e)
                        {
                            Debug.WriteLine("Exception: " + e.StackTrace);
                        }

                    }


                    Debug.WriteLine(theKey);                            //Display the name of the key
                    if (theKey.Contains("ControlKey"))                //If they pressed control
                    {
                        CONTROL_DOWN = true;                          //Flag control as down
                    }
                    else if (CONTROL_DOWN && theKey == "B")           //If they held CTRL and pressed B
                    {
                        Debug.WriteLine("\n***HOTKEY PRESSED***");  //Our hotkey was pressed
                    }
                    else if (theKey == "Escape")                      //If they press escape
                    {
                        UnhookWindowsHookEx(_hookID);                 //Release our hook
                        Environment.Exit(0);                          //Exit our program
                    }
                }
                else if (nCode >= 0 && wParam == (IntPtr)WM_KEYUP) //KeyUP
                {
                    int vkCode = Marshal.ReadInt32(lParam);        //Get Keycode
                    string theKey = ((Keys)vkCode).ToString();     //Get Key name
                    if (theKey.Contains("ControlKey"))             //If they let go of control
                    {
                        CONTROL_DOWN = false;                      //Unflag control
                    }
                }
            }
            catch (Exception e)
            {
                Debug.WriteLine(e.Message);
            }
            return CallNextHookEx(_hookID, nCode, wParam, lParam); //Call the next hook
        }

        public class Callback
        {
            public string name { get; set; }
            public Func<object, object> callback { get; set; }
        }

        public static bool registerEvents(string n, object c)
        {
            Debug.WriteLine("Registered Callback: " + n);
            callbacks.Add(new Callback { name = n, callback = (Func<object, object>)c });
            return true;
        }


    }
}
