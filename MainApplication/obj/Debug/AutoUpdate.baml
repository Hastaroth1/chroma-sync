   M S B A M L   `   `   `  ����M  IChroma Sync, Version=1.1.5864.40345, Culture=neutral, PublicKeyToken=null9!clr-namespace:Ultrabox.ChromaSyncUltrabox.ChromaSync  5   	   $    Ultrabox.ChromaSync.AutoUpdate   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:Ultrabox.ChromaSync     5   	     � Title$  
AutoUpdate��5   	    � WindowStartupLocation$ CenterScreen=�6   $��0,0,0,10q�6A   
����������	#FF141414 � SizeToContent$ WidthAndHeight=�6�   $��20q�6�    � Icon$* $Resources/android-chrome-192x192.png��6�    � 
ResizeMode$ NoResize=�6�    � AllowsTransparency .  � WindowStyle$
 None=�6'  $��Center=�6:  $��Center=�6W  $��Center=�6r  $��Center=�6�   � Topmost . ��5	      �� 5
   
      ChromaSyncPink �� Color# �   6   .��5      � $��100,20q�6   $��Disabled=�6   .+�5   
   �� -   5        	 ��Name$	 
updateText��5      $��Center=�6(   $��	0,154,0,0q�6E   $
��Wrap=�6X   $	��Top=�6l   ���	#FFC8C8C8
 �� TextAlignment$
 Center=�6�    �� Padding$ 10q�6�   $
��Bold"�6�   $��13.333(�6�   �� 6�   $�Checking for updates...��6�   6
  �� 5   
   -   5         ��Name$ image��5      $��Center=�6   $	��100��6<   $��0,10,0,0q�6I   $	��Top=�6[   $	��100��6s   $*��$Resources/android-chrome-192x192.png��6   �� 5   
   -   5         ��Name$ label��5      $��Welcome to Chroma Sync��6   $��Center=�6@   $��	0,115,0,0q�6]   $	��Top=�6p   $��21.333(�6�   ��5      �� 5      # �   6"   5      � 5   
   -   5         �Name$ buttons��5      $
��Left=�6    $��10,190,10,10q�6;   $	��Top=�6Q   $y�Visible=�6i    � RowDefinitions 5      �� 5      $	��50* �6    �� 5      $	��50* �6     � ColumnDefinitions 5      �� 5      $	��50* �6#   �� 5      $	��50* �6#   .+�5      �� -   5         ��Name$ 
skipButton��5      $��Remind Later��6)   $��Center=�6@   $	��Top=�6]   
����������	#3F3C3C3C$��5,0,0,0q�6�   $��30,10q�6�   $	��160��6�   $
��5,10q�6�   $��1��6�   $��36��6  $��1��6  $
��Bold"�6%  ��5      �� 5       # �   6&   5"      �� 5#      -   5        $ releaseButton��5#      $��Release Notes��6,   $��Center=�6D   $	��Top=�6a   
����������	#FF3C3C3C$��5,0,0,0q�6�   $��30,10q�6�   $	��160��6�   $
��5,10q�6�   $��1��6�   $��36��6  $��1��6  $
��Bold"�6-  $��1��6?  ��5$      �� 5%      # �   6&   5'      �� 5(      -   5        $ updateButton��5(      $��Install Update��6+   $��Center=�6D   $��Center=�6a   
�������$��0q�6�   $��30,10q�6�   $	��330��6�   $��0q�6�   $��2��6�   $
��Bold"�6�   ��5)      �� 5*      # �   6&   ��5,      �� 5-      # �   6&   5/      50      51      52      