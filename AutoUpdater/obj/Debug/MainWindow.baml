   M S B A M L   `   `   `  ����F  BAutoUpdater, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:AutoUpdaterAutoUpdater  5   	       AutoUpdater.MainWindow   5   	   \ XPresentationFramework, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   8x,http://schemas.microsoft.com/winfx/2006/xaml    5   	   >d2http://schemas.microsoft.com/expression/blend/2008    5   	   Hmc;http://schemas.openxmlformats.org/markup-compatibility/2006    5   	   )localclr-namespace:AutoUpdater    5   	     � Title$  
AutoUpdate��5   	    � WindowStartupLocation$ CenterScreen=�6   $��0q�6A   ���	#FFFF3366 � WindowStyle$
 None=�6m   
����������	#FF141414 � SizeToContent$ WidthAndHeight=�6�   $��20q�6�   $
��Auto��6�    � Icon$* $Resources/android-chrome-192x192.png��6�    � 
ResizeMode$ NoResize=�6)   � Topmost .  � 	Resources 5	         ChromaSyncPink��%+   &	        ��5
   
   	#FFFF3366��62   5      .��5      � $��50,20q�6   $��Disabled=�6   .+�5   
   �� -   5         ��Name$ 
updateText��5      $��Center=�6(   $��	0,154,0,0q�6E   $
��Wrap=�6X   $	��Top=�6l   ���	#FFC8C8C8	 �� TextAlignment$	 Center=�6�   
 �� Padding$
 10q�6�   $��35��6�   �� 6�   $
��Bold"�6�   $�Checking for updates...��6�   6  �� 5   
   -   5         ��Name$ image��5      $��Center=�6   $	��100��6<   $��0,10,0,0q�6I   $	��Top=�6[   $	��100��6s   $*��$Resources/android-chrome-192x192.png��6   �� 5   
   -   5         ��Name$ label��5      $��Welcome to Chroma Sync��6   $��Center=�6@   $��	0,115,0,0q�6]   $	��Top=�6p   $��21.333(�6�   ��5      �� 5       �� Color# �   6"   5      �� 5   
   -   5         ��Name$ button��5      $��Checking...��6!   $��Center=�67   $	��Top=�6T   
����������	#FF3C3C3C$��5,0,0,0q�6�   $��30,10q�6�   $	��160��6�   $
��Bold"�6�   $��	0,194,0,0q�6�   {�.  ��5      �� 5      # �   6"   5      5      5      