##
## A grid control that allows data to be displayed and edited.
## *Needs* **ZeeGrid.dll** *or* **ZeeGridx64.dll** *in the same directory as your executable.*
##
#
## :Appearance:
##    .. image:: ./wZeeGrid.png
##
#
## :Licence:
##  ZeeGrid is made available free-of-charge for any application development. You are free to redistribute the binary file ZeeGrid.DLL and/or ZeeGridx64.DLLwith your application, and use the message header file ZeeGrid.h or any derivative thereof, provided all copyright information remains unaltered.
##  You may not publish, in any form, instructions, manuals, or tutorials on ZeeGrid usage. This only relates to ZeeGrid instructions, manuals, or tutorials in a development sense. ZeeGrid usage may be included in your own application instructions as it pertains to the user's view and interaction with ZeeGrid. Just to clarify; Discussion, code snippets, examples of ZeeGrid usage on user groups is fine. Writing and publishing an article or book such as "Using ZeeGrid in Win32 Applications" is not.
##
##  I do request that if ZeeGrid is used in a commercial or publicly distributed application, a mention of ZeeGrid and my name (David Hillard) be put in your Help/About dialog.
##  I would appreciate you letting me know what type of application ZeeGrid is being used in, and what language/platform was used in its development. It would also be interesting if you'd let me know what part of the world you're in. It would be cool to make a map graphic and put it on this site showing world-wide usage of ZeeGrid.
##
#
## :Copyright:
##  | ZeeGrid Copyright(C) 2002-2015 
##  | by David Hillard 
##  | `http://www.kycsepp.com/ <http://www.kycsepp.com/>`_
##  | email: david@kycsepp.com
##                                         
#
## :Superclass:
##    `wControl <https://khchen.github.io/wNim/wControl.html>`_
##
#
## :Events:
##   `wCommandEvent <https://khchen.github.io/wNim/wCommandEvent.html>`_
##   =====================================                 =============================================================
##   wCommandEvent                                          Description
##   =====================================                  =============================================================
##   wEvent_ZeeGridButtonPressed	                          When the user clicks on a cell having a button data type.
##   wEvent_ZeeGridCellClicked	                            When the mouse is left clicked on any data cell.
##   wEvent_ZeeGridColumnMoved	                            When the column display order is changed by the user.
##   wEvent_ZeeGridCursorCellChanged	                      When the cursor cell is changed.
##   wEvent_ZeeGridDelete	                                  When the delete key is pressed inside the wZeeGrid control that has keyboard input.
##   wEvent_ZeeGridDoubleClickFixedColumn	                  When the user double clicks a fixed column cell.
##   wEvent_ZeeGridDoubleClickReadOnly	                    When the user double clicks on a read only column cell.
##   wEvent_ZeeGridEditComplete	                            When the user finishes editing a cell, after ZeeGrid writies to the cell.
##   wEvent_ZeeGridEditEnd	                                When the user finishes editing a cell, before ZeeGrid writes to the cell.
##   wEvent_ZeeGridF1	                                      When the F1 key is pressed while wZeeGrid has focus.
##   wEvent_ZeeGridF2	                                      When the F2 key is pressed while wZeeGrid has focus.
##   wEvent_ZeeGridF3	                                      When the F3 key is pressed while wZeeGrid has focus.
##   wEvent_ZeeGridF4	                                      When the F4 key is pressed while wZeeGrid has focus.
##   wEvent_ZeeGridF5	                                      When the F5 key is pressed while wZeeGrid has focus.
##   wEvent_ZeeGridF6	                                      When the F6 key is pressed while wZeeGrid has focus.
##   wEvent_ZeeGridF7	                                      When the F7 key is pressed while wZeeGrid has focus.
##   wEvent_ZeeGridF8	                                      When the F8 key is pressed while wZeeGrid has focus. *only if self.enableToolBarToggle(false)*
##   wEvent_ZeeGridGotFocus	                                When the wZeeGrid recieves keyboard input focus.
##   wEvent_ZeeGridInsert	                                  When the insert key is pressed while wZeeGrid has focus.
##   wEvent_ZeeGridLoadCombo	                              When the user begins editing a cell that has edit attribute 2.
##   wEvent_ZeeGridLostFocus	                              When the wZeeGrid loses keyboard focus.
##   wEvent_ZeeGridMouseMove	                              When the mouse is moved over the wZeeGrid.
##   wEvent_ZeeGridPasteComplete	                          When paste from the clipboard is complete.
##   wEvent_ZeeGridRightClick	                              When the user has right clicked on the wZeeGrid data area.
##   wEvent_ZeeGridRowSelected	                            When the user selects a row by clicking in the row numbers column.
##   wEvent_ZeeGridSort	                                    When the user has double clicked on a column header before the sort operation takes place.
##   wEvent_ZeeGridSortComplete	                            When the sort operation has completed taking place.
##   =====================================                  =============================================================
##
#
## Cell COLOR Attribute
## ======
## Every ZeeGrid cell as a foreground (FCOLOR) and background (BCOLOR) color attribute. The ZeeGrid title (cell index 0) and the column headers can only make use of the foreground color attribute.
##
## Every ZeeGrid control holds a 128 color palette that contains the RGB values of 128 color entries. Colors 0..19 are predefined by ZeeGrid and are always available for use, but cannot changed. Palette colors 20..127 can be defined and changed by the programmer using the self.setColor() function.
##
## The ZeeGrid message functions to set cell background or foreground colors, use color parameters that are indexes into the ZeeGrid color palette. This way, a sufficient number of colors can be used in the grid cells, and only require 2 bytes of memory storage to define both the foreground (text) color, and the background color of the cell.
##
## The color palette entries are defined as follows:
## ============ ==============================================================  ==============================================================
## Color Index  Color	                                                          Description
## ============ ==============================================================  ==============================================================
## 0	          RGB(0, 0, 0)                                                    Black
## 1	          RGB(0, 0, 255)                                                  Blue
## 2	          RGB(0, 255, 0)                                                  Green
## 3	          RGB(0, 255, 255)        	                                      Auqua
## 4	          RGB(255, 0, 0)      	                                          Red
## 5	          RGB(255, 0, 255)          	                                    Magenta
## 6	          RGB(255, 255, 0)          	                                    Yellow
## 7	          RGB(255, 255, 255)        	                                    White
## 8	          GetSysColor(COLOR_BTNFACE)                                      Color of system button face
## 9	          GetSystColor(COLOR_BTNSHADOW)                                   Color of system button shadow
## 10           GetSysColor(COLOR_HIGHLIGHT)                                    Color of system button highlight
## 11	          GetSysColor(COLOR_HIGHLIGHTTEXT)                                Color of system text highlight
## 12           GetSysColor(COLOR_INFOBK)                                       Color of system tooltip background
## 13	          GetSysColor(COLOR_INFOTEXT);                                    Color of system tooltip text
## 14	          RGB(0, 255, 255)                                                Used for mark text - normal columns
## 15	          RGB(0, 196, 196)                                                Used for mark text - fixed columns
## 16	          RGB(0, 0, 0)                                                    Used for mark text foreground
## 17	          0 (NULL_BRUSH)                                                  For using with bitmap background
## 18	          0	                                                              Reserved for future use
## 19	          0	                                                              Reserved for future use
## 20 > 127	                                                                    User Defined Colors
## ============ ==============================================================  ==============================================================
##
## By default, every cell has a foreground color of black and a background color of white.
##
## It is possible to animate ZeeGrid colors by manipulating the ZeeGrid color palette entries in response to a WM_TIMER message.
##
## **ZeeGrid procs that relate to colors**:
## - `alternateRowColors<#alternateRowColors%2CwZeeGrid%2Cbool%2Cint>`_
## - `setGridLineColor<#setGridLineColor%2CwZeeGrid%2Cint>`_
## - `setGridBGColor<#setGridBGColor%2CwZeeGrid%2Cint>`_
## - `setDefaultBColor<#setDefaultBColor%2CwZeeGrid%2Cint>`_
## - `setDefaultFColor<#setDefaultFColor%2CwZeeGrid%2Cint>`_
## - `getCellBColor<#getCellBColor%2CwZeeGrid%2Cint>`_
## - `getCellFColor<#getCellFColor%2CwZeeGrid%2Cint>`_
## - `setCellBColor<#setCellBColor%2CwZeeGrid%2Cint%2Cint>`_
## - `setCellFColor<#setCellFColor%2CwZeeGrid%2Cint%2Cint>`_
## - `setColBColor<#setColBColor%2CwZeeGrid%2Cint%2Cint>`_
## - `setColFColor<#setColFColor%2CwZeeGrid%2Cint%2Cint>`_
## - `setRowBColor<#setRowBColor%2CwZeeGrid%2Cint%2Cint>`_
## - `setRowFColor<#setRowFColor%2CwZeeGrid%2Cint%2Cint>`_
## - `getColor<#getColor%2CwZeeGrid%2Cint>`_
## - `setColor<#setColor%2CwZeeGrid%2Cint%2CDWORD>`_
##
#
## Cell Edit Attribute
## ===================
## Every ZeeGrid cell has an edit attribute. The cell edit is a numeric value that signifies the the cell's editing mode and are defined as follows:
##
## =====  ===================================================
## Value	
## =====  ===================================================
## 0      ReadOnly - Cannot be edited                     
## 1      Editable with an edit control                   
## 2      Editable with a droplist combobox               
## 3      BOOLEAN editable by double-clicking             
## 4      Date edit with date picker common control
## =====  ===================================================
##
## The only valid values are 0..4.
## The ZeeGrid title (cell index 0) and the column header cells are never editable. These cells can only be changed programmatically.
## 
## Unless you change the default edit (`setDefaultEdit<#setDefaultEdit%2CwZeeGrid%2Cint>`_) cells are created with an edit value of 0, or ReadOnly.
## 
## Cells with an edit value of 1 or 2 can be edited by double-clicking the cell, or beginning typing when the ZeeGrid cursor is over the cell.
## 
## Cells with an edit value of 3 are edited by double-clicking the cell. This will toggle the cell type from 0 to 1 (FALSE to TRUE), or 1 to 0 (TRUE to FALSE) depending on its value before double-clicking. Editing a cell of this type can also be done with the keyboard by pressing the [Spacebar] key to toggle the cell between TRUE and FALSE.
##
## **ZeeGrid procs that relate to the edit attribute**:
## - `setDefaultEdit<#setDefaultEdit%2CwZeeGrid%2Cint>`_
## - `getCellEdit<#getCellEdit%2CwZeeGrid%2Cint>`_
## - `setCellEdit<#setCellEdit%2CwZeeGrid%2Cint%2Cint>`_
## - `setColEdit<#setColEdit%2CwZeeGrid%2Cint%2Cint>`_
## - `setRowEdit<#setRowEdit%2CwZeeGrid%2Cint%2Cint>`_
##
#
## Cell FONT Attribute
## ===================
## Every ZeeGrid cell has a FONT attribute that can be set to 1 of a possible 128 fonts that are defined in the font palette.
## 
## The font palette is unique to each ZeeGrid control and holds the font handles (HFONT) of the palette entries. Fonts 0..19 are predefined by ZeeGrid and are always available for use, but cannot changed. Palette fonts 20..127 can be defined by the programmer and set using the `setFont<#setFont%2CwZeeGrid%2Cint%2Cint>`_ function.
## 
## The ZeeGrid message functions to set cell fonts, use font parameters that are indexes into the ZeeGrid font palette. This allows every cell to have a font from a selection of 128 possible fonts and only require 1 byte of memory for the storage of the cell font attribute.
## 
## The predefined fonts are as follows:
## ===========    ==============================================
## Font Number	  Description
## ===========    ==============================================
## 0	            Small variable pitch normal
## 1	            Small variable pitch bold
## 2	            Medium variable pitch normal (*default*)
## 3	            Medium variable pitch bold
## 4	            Large variable pitch normal
## 5	            Large variable pitch bold
## 6	            Small fixed pitch normal
## 7	            Small fixed pitch bold
## 8	            Medium fixed pitch normal
## 9	            Medium fixed pitch bold
## 10	            Large fixed pitch normal
## 11	            Large fixed pitch bold
## 12	            Undefined; reserved for future use
## 13	            Undefined; reserved for future use
## 14	            Undefined; reserved for future use
## 15	            Undefined; reserved for future use
## 16	            Undefined; reserved for future use
## 17	            Undefined; reserved for future use
## 18	            Undefined; reserved for future use
## 19	            Undefined; reserved for future use
## 20 > 127	      User defined
## ===========    ==============================================
##
## If a font is set with the `setFont<#setFont%2CwZeeGrid%2Cint%2Cint>`_ function, it is the application's responsibility to keep the handle to the font valid throughout the life of the ZeeGrid.
## The predefined fonts are available for use in your application by using the `getFont<#getFont%2CwZeeGrid%2Cint>`_ function. If your application uses a ZeeGrid font in this manner, you must keep the ZeeGrid control in existance for the entire time your application depends on the availability of the font.
## 
## **ZeeGrid procs that relate to the font attribute**:
## - `getFont<#getFont%2CwZeeGrid%2Cint>`_
## - `setFont<#setFont%2CwZeeGrid%2Cint%2Cint>`_
## - `getCellFont<#getCellFont%2CwZeeGrid%2Cint>`_
## - `setColFont<#setColFont%2CwZeeGrid%2Cint%2Cint>`_
## - `setDefaultFont<#setDefaultFont%2CwZeeGrid%2Cint>`_
##
#
## Cell FORMAT Attribute
## =====================
## Every ZeeGrid cell has a FORMAT attribute. The format attribute determines the display format of numeric and date data.
## 
## There are two valid values for the FORMAT attribute for numeric data:
##
## =====  ===================================================
## Value	
## =====  ===================================================
## 0      Normal numeric fashion (*Default*)                  
## 1      Percentage, 0.1567 will display 15.67%         
## =====  ===================================================
##
## 
## The number of decimal places displayed is determined by the PRECISION (`setCellNumPrecision<#setCellNumPrecision%2CwZeeGrid%2Cint%2Cint>`_) attribute of the ZeeGrid cell. 
## Cells with numeric data that have a precision attribute value of 0 will display as integer values.
## 
## There are five valid values for the FORMAT attribute for date data:
##
## =====  ===================================================
## Value	
## =====  ===================================================
## 0      YYYY/MM/DD                     
## 1      DD/MM/YYYY             
## 2      D/M/YYYY           
## 3      MON D, YYYY            
## 4      MONTH D, YYYY
## =====  ===================================================
##
## A related attribute is the NUMWIDTH (`setCellNumWidth<#setCellNumWidth%2CwZeeGrid%2Cint%2Cint>`_) attribute. This value defaults to 0 and there is really no need that comes to mind where this attribute value would need to be changed. 
## It was initially used in the ZeeGrid to left pad numeric values with spaces so that the sorting function would operate correctly. An earlier implementation of the sort function sorted by the text value of the cell. 
## The sort operation was rewritten to sort based on type, then value, so the original purpose of the NUMWIDTH attribute is defunct now, but is still implemented in case the programmer finds the need for it.
##
## **ZeeGrid procs that relate to the format attribute**:
## - `getCellFormat<#getCellFormat%2CwZeeGrid%2Cint>`_
## - `setCellFormat<#setCellFormat%2CwZeeGrid%2Cint%2Cint>`_
## - `setColFormat<#setColFormat%2CwZeeGrid%2Cint%2Cint>`_
##
#
## Cell ICON Attribute
## ===================
## Every ZeeGrid cell has an ICON attribute. The column header cells are the only cells that cannot display an icon.
## 
## Every ZeeGrid control maintains an icon palette of 128 icon handles (HICON). **There are no predefined icons**.
## 
## The only special case for the ICON cell attribute is the icon attribute value of 0. An icon attribute value of 0 means that the cell does not have, and will not display, an icon. Unless the ZeeGrid default is changed (`setDefaultIcon<#setDefaultIcon%2CwZeeGrid%2Cint>`_), the icon attribute of all new cells is 0, meaning no icon is displayed with the cell.
## 
## When an icon is displayed in a cell, it will be left justified against the left cell border.
## 
## The ZeeGrid message functions to set cell icons, use icon parameters that are indexes into the ZeeGrid icon palette. This allows every cell to have an icon from a selection of 127 possible icons and only require 1 byte of memory for the storage of the cell icon attribute.
## 
## Note: The built-in print function does not print icons.
## 
## **ZeeGrid procs that are related to the icon attribute**:
## - `setDefaultIcon<#setDefaultIcon%2CwZeeGrid%2Cint>`_
## - `loadIcon<#loadIcon%2CwZeeGrid%2Cint%2Cint>`_
## - `enableIconIndent<#enableIconIndent%2CwZeeGrid%2Cint%2Cbool>`_
## - `getCellIcon<#getCellIcon%2CwZeeGrid%2Cint>`_
## - `setCellIcon<#setCellIcon%2CwZeeGrid%2Cint%2Cint>`_
## - `setColIcon<#setColIcon%2CwZeeGrid%2Cint%2Cint>`_
## - `setRowIcon<#setRowIcon%2CwZeeGrid%2Cint%2Cint>`_
##
#
## Cell JUSTIFY Attribute
## ======================
## Every ZeeGrid cell has a justify attribute. It is this attribute that defines the positioning of text and numberic data when it is displayed in the cell. Refer to the diagram of a cell below for justification values and their positioning.
## ::
##  ---------------------------------------------------------       
##  |0                         3                           6|       
##  |                                                       |       
##  |1                         4                           7|       
##  |                                                       |       
##  |2 & 9                   5 & 10                   8 & 11|       
##  --------------------------------------------------------- 
## 
## Justification values 0..8 are for single line data. These would be used in the data rows 1 and higher in the ZeeGrid. Values 9..11 are for multiple line data. Only the ZeeGrid title (cell index 0) and column header cells can use multiline text. (JUSTIFY values 9..11)
##
## Justification values 0, 3, 6, 2, 5, and 8 can be used, but are not considered the norm. The ZeeGrid header file defines the most common justifications as follows:
##
## =====  ===================================================
## Value	Constant
## =====  ===================================================
## 1      `LEFT_SINGLE<#LEFT_SINGLE>`_
## 4      `CENTER_SINGLE<#CENTER_SINGLE>`_
## 7      `RIGHT_SINGLE<#RIGHT_SINGLE>`_
## 9      `LEFT_MULTI<#LEFT_MULTI>`_
## 10     `CENTER_MULTI<#CENTER_MULTI>`_
## 11	    `RIGHT_MULTI<#RIGHT_MULTI>`_
## =====  ===================================================
##
## **ZeeGrid procs that are related to the justify attribute**:
## - `getCellJustify<#getCellJustify%2CwZeeGrid%2Cint>`_
## - `setCellJustify<#setCellJustify%2CwZeeGrid%2Cint%2Cint>`_
## - `setColJustify<#setColJustify%2CwZeeGrid%2Cint%2Cint>`_
## - `setDefaultJustify<#setDefaultJustify%2CwZeeGrid%2Cint>`_
## - `setRowJustify<#setRowJustify%2CwZeeGrid%2Cint%2Cint>`_
##
#
## Cell NUMERIC Register
## =====================
## Every ZeeGrid cell has a NUMERIC register.
## 
## The NUMERIC register is an internal variable of type double. When a cell's numeric value is set, the value is cast to a double type and stored in this register. The text representation of this value is determined by other cell attributes and is displayed in the grid cell.
## 
## Programmatically, there are three ways to load a cell with a numeric value. The numeric value can be loaded as a text string, such as "3.14159" with `setCellText<#setCellText%2CwZeeGrid%2Cint%2Cstring>`_. A program integer variable can be loaded with `setCellInt<#setCellInt%2CwZeeGrid%2Cint%2Cint>`_ by referencing the integer program variable with a pointer to that variable, and a program double variable can be loaded with `setCellDouble<#setCellDouble%2CwZeeGrid%2Cint%2Cfloat>`_ by referencing the double program variable with a pointer to that variable.
## 
## Also, if the cell is editable (EDIT attribute 1), the user can enter the numeric value from the keyboard.
##
## **ZeeGrid procs that are related to the numeric register**:
## - `getCellInt<#getCellInt%2CwZeeGrid%2Cint>`_
## - `getCellDouble<#getCellDouble%2CwZeeGrid%2Cint>`_
## - `setCellInt<#setCellInt%2CwZeeGrid%2Cint%2Cint>`_
## - `setCellDouble<#setCellDouble%2CwZeeGrid%2Cint%2Cfloat>`_
##
#
## Cell PRECISION Attribute
## ========================
## Every ZeeGrid cell has a PRECISION attribute. The cell precision is a numeric value that signifies the number of decimal digits to display when that cell holds numeric data.
## 
## By default, non-integer numeric data types are displayed with 2 decimal digits. The precision attribute of a cell can be changed with the `setCellNumPrecision<#setCellNumPrecision%2CwZeeGrid%2Cint%2Cint>`_ function.
## 
## As an example, consider a cell containing a double value of 3.1415926535
## 
## By default, this value will display as 3.14 but can be changed at any time to display a different number of decimal digits. **Changing a cell's precision attribute does not change the value it holds**.
##
## When numeric data is entered by the user by editing the cell contents, a determination is made when the edit function is complete as to whether that new data is text data, or numeric data. If it is determined to be numeric data, and the cell's numeric contents will be displayed with the cell's PRECISION attribute. By default, the PRECISION attribute value is set to 2. Regardless of whether or not the value entered was an integer value or a real number value, it is displayed with the number of decimal places defined by the cell's PRECISION attribute value.
## 
## If the cell's PRECISION attribute value is set to 0, the new value will display as an integer value (no decimal digits) regardless of whether the value entered was an integer value or a real number value.
## 
## When a numeric value is entered into the grid programmatically with `setCellInt<#setCellInt%2CwZeeGrid%2Cint%2Cint>`_, the PRECISION attribute value is set to 0. When a numeric value is entered into the grid programmatically with `setCellDouble<#setCellDouble%2CwZeeGrid%2Cint%2Cfloat>`_, the double value is displayed with the current PRECISION attribute value for that cell.
## 
## A ZeeGrid data cell will hold the actual number entered by the user, regardless of the cell's precision setting.
## 
## When loading the ZeeGrid with data programmatically, the programmer has the option of loading the cell as text (`setCellText<#setCellText%2CwZeeGrid%2Cint%2Cstring>`_) and letting ZeeGrid determine if it's numeric or not, or loading the cell as integer (`setCellInt<#setCellInt%2CwZeeGrid%2Cint%2Cint>`_), or double (`setCellDouble<#setCellDouble%2CwZeeGrid%2Cint%2Cfloat>`_).
## 
## Each ZeeGrid cell has a single internal numeric "register" of type double. Whether the supplied value is an integer or a real number, it is cast to a double type and stored in the register. The PRECISION attribute is then used to control how the number contained in the cell's numeric register is displayed.
##
## **ZeeGrid procs that are related to the numeric attribute**:
## - `setCellNumPrecision<#setCellNumPrecision%2CwZeeGrid%2Cint%2Cint>`_
## - `setColNumPrecision<#setColNumPrecision%2CwZeeGrid%2Cint%2Cint>`_
## - `setDefaultNumPrecision<#setDefaultNumPrecision%2CwZeeGrid%2Cint>`_
## - `setRowNumPrecision<#setRowNumPrecision%2CwZeeGrid%2Cint%2Cint>`_
##
#
## Cell RESTRICTION Attribute
## ==========================
## **The RESTRICTION attribute is not reliable. I have noticed inconsistent behavior with this attribute and will investigate. Until the issues are resolved, use this attribute at your own risk. If I cannot resolve the issues, this attribute may be dropped in a future release.**
##
## Every ZeeGrid cell has a RESTRICTION attribute. The cell RESTRICTION attribute is a numeric value that signifies the filtering that will be applied to a cell when it is being edited from the in-cell edit box.
## 
## By default, the restriction attribute is 0 for all cells. A RESTRICTION attribute value of zero means that there is no restriction for that cell.
## 
## Valid RESTRICTION attribute values are in the range of [0..4]
##
## Restriction value meanings are:
## 
## ======   ==================================
## Number	  Meaning
## ======   ==================================
## 0        No Restriction
## 1        Signed Integer
## 2        Unsigned Integer
## 3        Signed Double
## 4        Unsigned Double
## ======   ==================================
##
## When numeric data is entered by the user by editing the cell contents, the RESTRICTION attribute value for the cell will determine the valid keystrokes the user may enter.
## For instance, if a cell is editable and has a restriction value of 3, (Signed Double) only the digits '0'..'9', '+', '-', or '.' are accepted by the edit control. Once a decimal point ('.') is entered, a second one is not allowed.
## 
## A RESTRICTION attribute value of 1 (signed integer) would only allow the digits '0'..'9'.
## 
## For signed values, the sign must be the in the first character position of the number.
##
## **ZeeGrid procs that are related to the restriciton attribute**:
## - `getCellRestriction<#getCellRestriction%2CwZeeGrid%2Cint>`_
## - `setCellRestriction<#setCellRestriction%2CwZeeGrid%2Cint%2Cint>`_
## - `setColRestriction<#setColRestriction%2CwZeeGrid%2Cint%2Cint>`_
## - `setDefaultRestriction<#setDefaultRestriction%2CwZeeGrid%2Cint>`_
##
#
## Cell TEXT Register
## ==================
## Every ZeeGrid cell has a TEXT register.
## 
## The TEXT register is an internal character pointer variable. When a cell's TEXT value is set, ZeeGrid will analyze the text to determine its data type. This type could be BOOLEAN (TRUE/FALSE), a date, text, or a numeric value. This analysis is determined by the settings of `interpretBool<#interpretBool%2CwZeeGrid%2Cbool>`_, `interpretDates<#interpretDates%2CwZeeGrid%2Cbool>`_, and `interpretNumeric<#interpretNumeric%2CwZeeGrid%2Cbool>`_. If these settings are turned off, the text will be treated as a text string, no matter what the text string represented.
## 
## The TEXT register holds the character string that represents the actual data that is stored. If the cell holds a numeric value, the TEXT register will hold the text string that is displayed to represent that number. For example, if the numeric value stored in the cell is 3.1415926535, and the PRECISION attribute for that cell is set to 4, the TEXT register will hold the string "3.1416". Retrieving the text representation of the number from the TEXT register will likely not be equal to the numeric value stored in the NUMERIC register. To retrieve accurate numeric results, always use `getCellInt<#getCellInt%2CwZeeGrid%2Cint>`_ or `getCellDouble<#getCellDouble%2CwZeeGrid%2Cint>`_ when getting numeric values from cells. Use `getCellText<#getCellText%2CwZeeGrid%2Cint>`_ to retrieve cell text.
## 
## Use `getCellTextLength<#getCellTextLength%2CwZeeGrid%2Cint>`_ to first determine the length of the string when the length might be unknown. You can use the length returned to create a dynamic variable to hold the actual text with `getCellText<#getCellText%2CwZeeGrid%2Cint>`_.
##
## **ZeeGrid procs that are related to the text register**:
## - `getCellTextLength<#getCellTextLength%2CwZeeGrid%2Cint>`_
## - `getCellText<#getCellText%2CwZeeGrid%2Cint>`_
## - `setCellText<#setCellText%2CwZeeGrid%2Cint%2Cstring>`_
##
#
## Cell TYPE Attribute
## ===================
## Every ZeeGrid cell has a type attribute. The cell type is a numeric value that identifies the data type held in it.
##
## The types and are defined as follows:
##
## ======   ==================================
## Number	  Type
## ======   ==================================
## 0        BOOLEAN FALSE
## 1        BOOLEAN TRUE  
## 2        Text
## 3        Numeric
## 4        Date
## 5	      Button
## 127	    Empty Cell
## ======   ==================================
##
## Cells with type value 0 are displayed as unchecked checkboxes.
## 
## Cells with type value 1 are displayed as checked checkboxes.
## 
## Cells with type value 2 are displayed as left justifed (by default) text.
## 
## Cells with type value 3 are displayed as right justified (by default) numeric values. Cells of this type also depend on the precision, width, and format attributes to determine how they are displayed in the ZeeGrid.
## 
## Cells with a type value 4 are displayed as right justified (by default) date format strings. The displayed format of the date can be changed with the format attribute for the cell.
## 
## Cells with a type value 5 are displayed as button controls. The text of the cell becomes the button text. When using button data types, the programmer should take care to assure that the cell is set to readonly by setting the cell's edit attribute to zero.
## 
## The value 127 is assigned and used internally to ZeeGrid. You cannot programmatically change a cell type to be 127. The only valid values that you, the programmer, can use are the values 0..5.
##
## When a ZeeGrid column has mixed types within it and is sorted in ascending mode, it is sorted in the following order:
##
## ======   ==================================
## Number	  Type
## ======   ==================================
## 0        BOOLEAN FALSE
## 1        BOOLEAN TRUE  
## 3 & 4    Numeric and Dates (low to high)
## 2 & 5    Text and Buttons (low to high)
## 127      Date
## ======   ==================================
## 
## **ZeeGrid procs that are related to the type attribute**:
## - `getCellType<#getCellType%2CwZeeGrid%2Cint>`_
## - `setCellType<#setCellType%2CwZeeGrid%2Cint%2Cint>`_
## - `setColType<#setColType%2CwZeeGrid%2Cint%2Cint>`_
## - `setRowType<#setRowType%2CwZeeGrid%2Cint%2Cint>`_
## - `setDefaultType<#setDefaultType%2CwZeeGrid%2Cint>`_
##
{.experimental, deadCodeElim: on.}

from wNim/private/winimx import NMHDR
import wNim/private/wBase
import wNim/private/controls/wControl
export wControl

wEventRegister(wCommandEvent):
  wEvent_ZeeGridFirst
  wEvent_ZeeGridButtonPressed
  wEvent_ZeeGridCellClicked
  wEvent_ZeeGridColumnMoved
  wEvent_ZeeGridCursorCellChanged
  wEvent_ZeeGridDelete
  wEvent_ZeeGridDoubleClickFixedColumn
  wEvent_ZeeGridDoubleClickReadOnly
  wEvent_ZeeGridEditComplete
  wEvent_ZeeGridEditEnd
  wEvent_ZeeGridF1
  wEvent_ZeeGridF2
  wEvent_ZeeGridF3
  wEvent_ZeeGridF4
  wEvent_ZeeGridF5
  wEvent_ZeeGridF6
  wEvent_ZeeGridF7
  wEvent_ZeeGridF8
  wEvent_ZeeGridGotFocus
  wEvent_ZeeGridInsert
  wEvent_ZeeGridLoadCombo
  wEvent_ZeeGridLostFocus
  wEvent_ZeeGridMouseMove
  wEvent_ZeeGridPasteComplete
  wEvent_ZeeGridRightClick
  wEvent_ZeeGridRowSelected
  wEvent_ZeeGridSort 
  wEvent_ZeeGridSortComplete
  wEvent_ZeeGridLast

proc isGridEvent(msg: UINT): bool {.inline, shield.} =
  msg in wEvent_ZeeGridFirst..wEvent_ZeeGridLast

type
  COLORREF* = DWORD
  LPCOLORREF* = ptr COLORREF
template RGB*(r: untyped, g: untyped, b: untyped): COLORREF = COLORREF(COLORREF(r and 0xff) or (COLORREF(g and 0xff) shl 8) or (COLORREF(b and 0xff) shl 16))

const
  # File Export Flags
  EF_FILENAMESUPPLIED* = 0x00000001
  EF_DELIMITERSUPPLIED* = 0x00000002
  EF_SILENT* = 0x00000004
  EF_NOHEADER* = 0x00000008

const
  # Text Justification Constants
  LEFT_SINGLE* = 1
  CENTER_SINGLE* = 4
  RIGHT_SINGLE* = 7
  LEFT_MULTI* = 9
  CENTER_MULTI* = 10
  RIGHT_MULTI* = 11

type
  ZGNOTIFYSTRUCT* {.bycopy.} = object
    header*: NMHDR
    CONTROL*: BOOL
    SHIFT*: BOOL
    ALT*: BOOL
    vkey*: cint

const
  # ZeeGrid Control Messages
  ZGM_LOADICON* = WM_USER + 1
  ZGM_SETCELLICON* = WM_USER + 2
  ZGM_SETROWHEIGHT* = WM_USER + 3
  ZGM_SETCELLFONT* = WM_USER + 4
  ZGM_SETCELLFCOLOR* = WM_USER + 5
  ZGM_SETCELLBCOLOR* = WM_USER + 6
  ZGM_SETTITLEHEIGHT* = WM_USER + 7
  ZGM_SETCELLJUSTIFY* = WM_USER + 8
  ZGM_GETCRC* = WM_USER + 9
  ZGM_ENABLETBEDIT* = WM_USER + 10
  ZGM_ENABLETBSEARCH* = WM_USER + 11
  ZGM_SHOWTOOLBAR* = WM_USER + 12
  ZGM_SHOWEDIT* = WM_USER + 13
  ZGM_SHOWSEARCH* = WM_USER + 14
  ZGM_GRAYBGONLOSTFOCUS* = WM_USER + 15
  ZGM_ALLOCATEROWS* = WM_USER + 16
  ZGM_SETAUTOINCREASESIZE* = WM_USER + 17
  ZGM_APPENDROW* = WM_USER + 18
  ZGM_DELETEROW* = WM_USER + 19
  ZGM_SHRINKTOFIT* = WM_USER + 20
  ZGM_SETRANGE* = WM_USER + 21
  ZGM_GETRANGESUM* = WM_USER + 22
  ZGM_SHOWTITLE* = WM_USER + 23
  ZGM_ENABLESORT* = WM_USER + 24
  ZGM_ENABLECOLMOVE* = WM_USER + 25
  ZGM_SELECTCOLUMN* = WM_USER + 26
  ZGM_DIMGRID* = WM_USER + 27
  ZGM_SETROWNUMBERSWIDTH* = WM_USER + 28
  ZGM_SETDEFAULTBCOLOR* = WM_USER + 29
  ZGM_SETGRIDLINECOLOR* = WM_USER + 30
  ZGM_SETCELLTEXT* = WM_USER + 31
  ZGM_SETCOLWIDTH* = WM_USER + 32
  ZGM_INSERTROW* = WM_USER + 33
  ZGM_SHOWROWNUMBERS* = WM_USER + 34
  ZGM_GETROWS* = WM_USER + 35
  ZGM_REFRESHGRID* = WM_USER + 36
  ZGM_SETDEFAULTFCOLOR* = WM_USER + 37
  ZGM_SETDEFAULTFONT* = WM_USER + 38
  ZGM_MERGEROWS* = WM_USER + 39
  ZGM_SETDEFAULTJUSTIFY* = WM_USER + 40
  ZGM_SETCELLTYPE* = WM_USER + 41
  ZGM_SETCELLFORMAT* = WM_USER + 42
  ZGM_SETCOLFORMAT* = WM_USER + 43
  ZGM_SETCOLTYPE* = WM_USER + 44
  ZGM_SETCOLJUSTIFY* = WM_USER + 45
  ZGM_SETCOLFONT* = WM_USER + 46
  ZGM_GETCELLINDEX* = WM_USER + 47
  ZGM_ENABLETBMERGEROWS* = WM_USER + 48
  ZGM_SHOWCURSORONLOSTFOCUS* = WM_USER + 49
  ZGM_EMPTYGRID* = WM_USER + 50
  ZGM_ENABLETBROWNUMBERS* = WM_USER + 51
  ZGM_GETFIXEDCOLUMNS* = WM_USER + 52
  ZGM_SETCOLFCOLOR* = WM_USER + 53
  ZGM_SETLEFTINDENT* = WM_USER + 54
  ZGM_SETRIGHTINDENT* = WM_USER + 55
  ZGM_ENABLEICONINDENT* = WM_USER + 56
  ZGM_GETROWHEIGHT* = WM_USER + 57
  ZGM_ENABLECOLRESIZING* = WM_USER + 58
  ZGM_GETCOLWIDTH* = WM_USER + 59
  ZGM_SETCOLBCOLOR* = WM_USER + 60
  ZGM_SELECTROW* = WM_USER + 61
  ZGM_SHOWCURSOR* = WM_USER + 62
  ZGM_SETCELLEDIT* = WM_USER + 63
  ZGM_GETCELLEDIT* = WM_USER + 64
  ZGM_GETCURSORINDEX* = WM_USER + 65
  ZGM_AUTOSIZE_ALL_COLUMNS* = WM_USER + 66
  ZGM_SETCOLUMNHEADERHEIGHT* = WM_USER + 67
  ZGM_GETEDITEDCELL* = WM_USER + 68
  ZGM_GOTOCELL* = WM_USER + 69
  ZGM_SETCELLMARK* = WM_USER + 70
  ZGM_MARKTEXT* = WM_USER + 71
  ZGM_SETMARKTEXT* = WM_USER + 72
  ZGM_ENABLETOOLBARTOGGLE* = WM_USER + 73
  ZGM_HIGHLIGHTCURSORROW* = WM_USER + 74
  ZGM_HIGHLIGHTCURSORROWINFIXEDCOLUMNS* = WM_USER + 75
  ZGM_GETROWOFINDEX* = WM_USER + 76
  ZGM_GETCOLOFINDEX* = WM_USER + 77
  ZGM_GETCELLTEXT* = WM_USER + 78
  ZGM_SETDEFAULTEDIT* = WM_USER + 79
  ZGM_SETCOLEDIT* = WM_USER + 80
  ZGM_SHOWGRIDLINES* = WM_USER + 81
  ZGM_ENABLEROWSIZING* = WM_USER + 82
  ZGM_GETGRIDWIDTH* = WM_USER + 83
  ZGM_SETCOLUMNORDER* = WM_USER + 84
  ZGM_ENABLETBEXPORT* = WM_USER + 85
  ZGM_ENABLETBPRINT* = WM_USER + 86
  ZGM_SHOWHSCROLL* = WM_USER + 87
  ZGM_SHOWVSCROLL* = WM_USER + 88
  ZGM_AUTOVSCROLL* = WM_USER + 89
  ZGM_AUTOHSCROLL* = WM_USER + 90
  ZGM_EXPORT* = WM_USER + 91
  ZGM_COMPARETEXT* = WM_USER + 92
  ZGM_GETEDITTEXT* = WM_USER + 93
  ZGM_SETEDITTEXT* = WM_USER + 94
  ZGM_COMPARETEXT2STRING* = WM_USER + 95
  ZGM_GETMOUSEROW* = WM_USER + 96
  ZGM_GETMOUSECOL* = WM_USER + 97
  ZGM_SETCURSORCELL* = WM_USER + 98
  ZGM_CURSORFOLLOWMOUSE* = WM_USER + 99
  ZGM_GETROWSPERPAGE* = WM_USER + 100
  ZGM_GETTOPROW* = WM_USER + 101
  ZGM_SETTOPROW* = WM_USER + 102
  ZGM_AUTOSIZECOLONEDIT* = WM_USER + 103
  ZGM_SETSORTLIMIT* = WM_USER + 105
  ZGM_SORTONCOLDCLICK* = WM_USER + 106
  ZGM_STOPWATCH_START* = WM_USER + 107
  ZGM_STOPWATCH_STOP* = WM_USER + 108
  ZGM_SORTCOLUMNASC* = WM_USER + 109
  ZGM_SORTCOLUMNDESC* = WM_USER + 110
  ZGM_GETCOLS* = WM_USER + 111
  ZGM_SETSORTESTIMATE* = WM_USER + 112
  ZGM_GETCELLTYPE* = WM_USER + 113
  ZGM_GETCELLJUSTIFY* = WM_USER + 114
  ZGM_GETCELLFCOLOR* = WM_USER + 115
  ZGM_GETCELLBCOLOR* = WM_USER + 116
  ZGM_GETCELLFONT* = WM_USER + 117
  ZGM_GETCELLMARK* = WM_USER + 118
  ZGM_GETCELLICON* = WM_USER + 119
  ZGM_SETROWTYPE* = WM_USER + 120
  ZGM_SETROWJUSTIFY* = WM_USER + 121
  ZGM_SETROWFCOLOR* = WM_USER + 122
  ZGM_SETROWBCOLOR* = WM_USER + 123
  ZGM_SETROWFONT* = WM_USER + 124
  ZGM_SETROWMARK* = WM_USER + 125
  ZGM_SETROWICON* = WM_USER + 126
  ZGM_SETROWEDIT* = WM_USER + 127
  ZGM_SEARCHEACHKEYSTROKE* = WM_USER + 128
  ZGM_COMBOCLEAR* = WM_USER + 129
  ZGM_COMBOADDSTRING* = WM_USER + 130
  ZGM_CLEARMARKONSELECT* = WM_USER + 131
  ZGM_SETCOLICON* = WM_USER + 132
  ZGM_SETCOLMARK* = WM_USER + 133
  ZGM_SETDEFAULTTYPE* = WM_USER + 134
  ZGM_SETDEFAULTMARK* = WM_USER + 135
  ZGM_SETDEFAULTICON* = WM_USER + 136
  ZGM_SORTSECONDARY* = WM_USER + 137
  ZGM_GETSORTCOLUMN* = WM_USER + 138
  ZGM_GETCURSORROW* = WM_USER + 139
  ZGM_GETCURSORCOL* = WM_USER + 140
  ZGM_GETSIZEOFCELL* = WM_USER + 141
  ZGM_GETCELLDOUBLE* = WM_USER + 142
  ZGM_SETCELLDOUBLE* = WM_USER + 143
  ZGM_SETDEFAULTNUMWIDTH* = WM_USER + 144
  ZGM_SETDEFAULTNUMPRECISION* = WM_USER + 145
  ZGM_SETCELLNUMWIDTH* = WM_USER + 146
  ZGM_SETCOLNUMWIDTH* = WM_USER + 147
  ZGM_SETROWNUMWIDTH* = WM_USER + 148
  ZGM_SETCELLNUMPRECISION* = WM_USER + 149
  ZGM_SETCOLNUMPRECISION* = WM_USER + 150
  ZGM_SETROWNUMPRECISION* = WM_USER + 151
  ZGM_SETCELLINT* = WM_USER + 152
  ZGM_GETCELLINT* = WM_USER + 153
  ZGM_INTERPRETBOOL* = WM_USER + 154
  ZGM_INTERPRETNUMERIC* = WM_USER + 155
  ZGM_SETCOLOR* = WM_USER + 157
  ZGM_GETCOLOR* = WM_USER + 158
  ZGM_SETFONT* = WM_USER + 159
  ZGM_GETFONT* = WM_USER + 160
  ZGM_SETPRINTPOINTSIZE* = WM_USER + 161
  ZGM_GETROWSALLOCATED* = WM_USER + 162
  ZGM_GETCELLSALLOCATED* = WM_USER + 163
  ZGM_GETSIZEOFGRID* = WM_USER + 165
  ZGM_PRINT* = WM_USER + 166
  ZGM_SETITEMDATA* = WM_USER + 167
  ZGM_GETITEMDATA* = WM_USER + 168
  ZGM_ALTERNATEROWCOLORS* = WM_USER + 169
  ZGM_UNLOCK* = WM_USER + 170
  ZGM_QUERYBUILD* = WM_USER + 171
  ZGM_SAVEGRID* = WM_USER + 172
  ZGM_LOADGRID* = WM_USER + 173
  ZGM_GETCELLTEXTLENGTH* = WM_USER + 174
  ZGM_AUTOSIZECOLUMN* = WM_USER + 175
  ZGM_ISGRIDDIRTY* = WM_USER + 176
  ZGM_INTERPRETDATES* = WM_USER + 177
  ZGM_SETCELLCDATE* = WM_USER + 178
  ZGM_SETCELLJDATE* = WM_USER + 179
  ZGM_GETJDATE* = WM_USER + 180
  ZGM_GETCDATE* = WM_USER + 181
  ZGM_GETTODAY* = WM_USER + 182
  ZGM_SETREGCDATE* = WM_USER + 183
  ZGM_SETREGJDATE* = WM_USER + 184
  ZGM_GETREGDATEFORMATTED* = WM_USER + 185
  ZGM_ISDATEVALID* = WM_USER + 186
  ZGM_GETREGDATEYEAR* = WM_USER + 187
  ZGM_GETREGDATEMONTH* = WM_USER + 188
  ZGM_GETREGDATEDAY* = WM_USER + 189
  ZGM_GETREGDATEDOW* = WM_USER + 190
  ZGM_GETDOW* = WM_USER + 191
  ZGM_GETDOWLONG* = WM_USER + 192
  ZGM_GETDOWSHORT* = WM_USER + 193
  ZGM_GETREGDATEDOY* = WM_USER + 194
  ZGM_GETREGDATEWOY* = WM_USER + 195
  ZGM_GETDOY* = WM_USER + 196
  ZGM_GETWOY* = WM_USER + 197
  ZGM_GETLASTBUTTONPRESSED* = WM_USER + 198
  ZGM_ENABLECOLUMNSELECT* = WM_USER + 199
  ZGM_KEEP3DONLOSTFOCUS* = WM_USER + 200
  ZGM_SETLOSTFOCUSHIGHLIGHTCOLOR* = WM_USER + 201
  ZGM_GOTOFIRSTONSEARCH* = WM_USER + 202
  ZGM_GETSELECTEDROW* = WM_USER + 203
  ZGM_GETSELECTEDCOL* = WM_USER + 204
  ZGM_COPYCELL* = WM_USER + 205
  ZGM_GETCOLUMNORDER* = WM_USER + 206
  ZGM_GETDISPLAYPOSITIONOFCOLUMN* = WM_USER + 207
  ZGM_GETCOLUMNINDISPLAYPOSITION* = WM_USER + 208
  ZGM_SCROLLDOWN* = WM_USER + 209
  ZGM_SCROLLUP* = WM_USER + 210
  ZGM_SCROLLRIGHT* = WM_USER + 211
  ZGM_SCROLLLEFT* = WM_USER + 212
  ZGM_SETBACKGROUNDBITMAP* = WM_USER + 213
  ZGM_ENABLECOPY* = WM_USER + 214
  ZGM_ENABLECUT* = WM_USER + 215
  ZGM_ENABLEPASTE* = WM_USER + 216
  ZGM_EXPANDROWSONPASTE* = WM_USER + 217
  ZGM_SETCELLRESTRICTION* = WM_USER + 218
  ZGM_SETROWRESTRICTION* = WM_USER + 219
  ZGM_SETCOLRESTRICTION* = WM_USER + 220
  ZGM_SETDEFAULTRESTRICTION* = WM_USER + 221
  ZGM_GETCELLRESTRICTION* = WM_USER + 222
  ZGM_SETROWNUMBERFONT* = WM_USER + 223
  ZGM_SETGRIDBGCOLOR* = WM_USER + 224
  ZGM_GETCELLFORMAT* = WM_USER + 225
  ZGM_SHOWCOPYMENU* = WM_USER + 226
  ZGM_ADJUSTHEADERS* = WM_USER + 227
  ZGM_ENABLETRANSPARENTHIGHLIGHTING* = WM_USER + 228
  ZGM_GETCELLADVANCE* = WM_USER + 229
  ZGM_SETCELLADVANCE* = WM_USER + 230
  ZGM_SETCOLADVANCE* = WM_USER + 231
  ZGM_SETROWADVANCE* = WM_USER + 232
  ZGM_SETDEFAULTADVANCE* = WM_USER + 233
  ZGM_GETCELLINTSAFE* = WM_USER + 234
  ZGM_GETROWNUMBERSWIDTH* = WM_USER + 235
  ZGM_SPANCOLUMN* = WM_USER + 236
  ZGM_GETAUTOINCREASESIZE* = WM_USER + 237

const
  # Notification Messages
  ZGN_MOUSEMOVE* = 1
  ZGN_SORT* = 2
  ZGN_CURSORCELLCHANGED* = 3
  ZGN_EDITEND* = 4
  ZGN_RIGHTCLICK* = 5
  ZGN_LOADCOMBO* = 6
  ZGN_INSERT* = 7
  ZGN_DELETE* = 8
  ZGN_F1* = 9
  ZGN_F2* = 10
  ZGN_F3* = 11
  ZGN_F4* = 12
  ZGN_F5* = 13
  ZGN_F6* = 14
  ZGN_F7* = 15
  ZGN_F8* = 16
  ZGN_EDITCOMPLETE* = 17
  ZGN_DOUBLECLICKREADONLY* = 18
  ZGN_DOUBLECLICKFIXEDCOLUMN* = 19
  ZGN_SORTCOMPLETE* = 20
  ZGN_BUTTONPRESSED* = 21
  ZGN_CELLCLICKED* = 22
  ZGN_COLUMNMOVED* = 23
  ZGN_PASTECOMPLETE* = 24
  ZGN_GOTFOCUS* = 25
  ZGN_LOSTFOCUS* = 26
  ZGN_ROWSELECTED* = 27


type
  wZeeGrid* = ref object of wControl
    handle: HWND


proc adjustHeaders*(self:wZeeGrid, fEnable:bool = true) {.validate, property.} =
  ## Sends a ZGM_ADJUSTHEADERS message to enable or disable the adding of adjusting pixels 
  ## to the top of the column headers to cause an integral number of rows to be displayed. If this setting 
  ## is TRUE (enabled), the adjustment pixels are calculated and place at the top of the column header, to 
  ## make the column header height make up for a partial row that might be displayed. If this setting is 
  ## FALSE (disabled), the height that would be added to the column header is placed at the bottom of the 
  ## grid. This will cause a small blank area to be displayed at the bottom of the grid.
  ## 
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will place the adjustment height at the top of the column headers. 
  ##      A value of FALSE will place the adjustment height at the bottom of the grid, 
  ##      below the last fully displayable row.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  This setting is TRUE by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used;set to zero
  SendMessage(self.mHwnd, ZGM_ADJUSTHEADERS, fEnable, 0)

proc allocateRows*(self:wZeeGrid, iRows:int = 2000) {.validate, property.} =
  ## Sends a ZGM_ALLOCATEROWS message to allocate memory for the specified number of rows. 
  ## This only needs to be done if you expect the grid to have more than 2000 rows. 
  ## This message should be sent immediately after the grid is dimensioned with ZGM_DIMGRID.
  ##
  ## Parameters:
  ##    iRows
  ##      The value of wParam. The number of rows to allocate.
  ##
  ## Retrun Values:
  ##  This message does not return a value
  #
  # wParam = (WPARAM)(int) iRows;        //number of rows to allocate
  # lParam = 0;                          //not used; set to zero
  SendMessage(self.mHwnd, ZGM_ALLOCATEROWS, iRows, 0)

proc alternateRowColors*(self:wZeeGrid, fEnable: bool, iCPIndex: int) {.validate, property.} =
  ## Sends a ZGM_ALTERNATEROWCOLORS message to enable or disable the displaying of odd 
  ## numbered rows with the defined alternate background color.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. Specifies whether to enable or disable displaying alternate rows with a different 
  ##      background color. If enabled, the alternate background color is overridden by the cells background 
  ##      color if it is different from the default cell background color for the ZeeGrid. An option to using 
  ##      the BOOLEAN value of TRUE, an integer value greater than or equal to 2 can be used to specify the 
  ##      "spread" of the alternate rows. For instance, setting wParam to a value of 5 will set every 5th row 
  ##      to the color specified in lParam.
  ##    iCPIndex
  ##      The value of lParam. The color index to use for alternate rows. 
  ##      Valid values are in the range [0..127]. This value is ignored if fEnable is FALSE.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  Alternate row colors are disabled by default
  #
  # wParam = (WPARAM) (BOOL) fEnable;     //enable flag
  # lParam = (LPARAM) (int)  iCPIndex;    //color palette index for the alternate color
  SendMessage(self.mHwnd, ZGM_ALTERNATEROWCOLORS, fEnable, iCPIndex)

proc appendRow*(self: wZeeGrid): int {.validate, inline, discardable.} = 
  ## Sends a ZGM_APPENDROW to append a new row at the bottom of the grid. 
  ## To add a new row at a position other than at the bottom of the grid, use ZGM_INSERTROW.
  ##
  ## Return Values:
  ##  The cell index of the first cell (column 1) in the newly appended row.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_APPENDROW, 0 , 0))

proc autoHScroll*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_AUTOHSCROLL message to enable or disable the automatic 
  ## display of the horizontal scrollbar.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will cause the horizontal scrollbar to display 
  ##      if there are more columns in the grid than can be displayed onscreen. 
  ##      A value of FALSE will cause the horizontal scrollbar to be displayed as 
  ##      determined by the setting of ZGM_SHOWHSCROLL.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ## 
  ## Remarks:
  ##  Enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_AUTOHSCROLL, fEnable, 0)

proc autoSizeAllColumns*(self: wZeeGrid) {.validate, property.} = 
  ## Sends a ZGM_AUTOSIZE_ALL_COLUMNS message to adjust each ZeeGrid 
  ## column to fit the maximum length text in each column.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ## 
  ## Remarks:
  ##  This message has the same effect on the ZeeGrid as if the user had 
  ##  double-clicked the right side of each column header.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  SendMessage(self.mHwnd, ZGM_AUTOSIZE_ALL_COLUMNS, 0, 0)

proc autoSizeColOnEdit*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_AUTOSIZECOLONEDIT message to enable or disable automatic
  ## column sizing to fit data entered in an editable cell.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. Specifies whether to enable or disable the automatic 
  ##      sizing of columns to fit data entered from an editable cell. 
  ##      A value of TRUE enables automatic column resizing; 
  ##      a value of FALSE disables automatic column resizing.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ## 
  ## Remarks:
  ##  Automatic column sizing on edit will only happen when the user finishes an 
  ##  edit by pressing the Return key. If a cell is being edited and the user mouse clicks 
  ##  into another cell, the cell that was being edited will not be autosized to fit.
  ##
  ##  Autosizing of columns on edit is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_AUTOHSCROLL, fEnable, 0)

proc autoSizeColumn*(self: wZeeGrid, iCol: int) {.validate, property.} = 
  ## Sends a ZGM_AUTOSIZECOLUMN message to automatically size the specified 
  ## column to fit the data contained within it.
  ##
  ## Parameters:
  ##    iCol
  ##      The value of wParam. The column number to automatically size.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCol;        //column number to autosize
  # lParam = 0;                         //not used; must be zero
  SendMessage(self.mHwnd, ZGM_AUTOSIZECOLUMN, iCol, 0)

proc autoVScroll*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_AUTOHSCROLL message to enable or disable the automatic 
  ## display of the vertical scrollbar.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will cause the vertical scrollbar to display 
  ##      if there are more columns in the grid than can be displayed onscreen. 
  ##      A value of FALSE will cause the vertical scrollbar to be displayed as 
  ##      determined by the setting of ZGM_SHOWHSCROLL.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ## 
  ## Remarks:
  ##  Auto Vertical Scroll is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_AUTOVSCROLL, fEnable, 0)

proc clearMarkOnSelect*(self: wZeeGrid, fEnable:bool = false) {.validate, property.} = 
  ## Sends a ZGM_CLEARMARKONSELECT message to enable or disable the ZeeGrid 
  ## behavior of clearing a marked cell when the cursor is placed on it. Cells have a MARK 
  ## attribute that is set by the search function. 
  ## This is normally set or cleared by the user in the toolbar search function.
  ##
  ## Parameters:
  ##    fEnable
  ##      The value of wParam. A value of TRUE will cause marked cells to change to 
  ##      an unmarked state once the cursor is placed on them. A value of FALSE will 
  ##      keep marked cells marked even after the cursor is placed on them.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_CLEARMARKONSELECT, fEnable, 0)


proc comboAddString*(self: wZeeGrid, lpszString:string = "") {.validate, inline.} = 
  ## Sends a ZGM_COMBOADDSTRING message to load the in-cell droplist combo 
  ## box with selection items. 
  ## This is normally done in response to the ZGN_LOADCOMBO notification message after a ZGM_COMBOCLEAR.
  ##
  ## Parameters:
  ##    lpszString
  ##      The value of lParam. The address of the string to add to the in-cell droplist combo box.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = 0;                       //not used; must be zero
  # lParam = (LPARAM) lpszString;     //address of string to add
  SendMessage(self.mHwnd, ZGM_COMBOADDSTRING, 0, &lpszString)

proc comboClear*(self: wZeeGrid, fSort:bool = true) {.validate, inline.} = 
  ## Sends a ZGM_COMBOCLEAR message to initialize the incell droplist combo box.
  ##
  ## Parameters:
  ##    fSort
  ##      The value of wParam. A value of TRUE initializes the incell droplist combo to be sorted. 
  ##      A value of FALSE initializes an unsorted incell droplist combo. In either case, 
  ##      the incell droplist combo is emptied of any previous data strings.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  The ZGM_COMBOCLEAR message is sent in response to a ZGN_LOADCOMBO (wEvent_ZeeGridLoadCombo) notification message. 
  ##  The ZGN_LOADCOMBO notification message is sent to the application when a cell with an 
  ##  edit value of 2 is being edited by the user.
  #
  # wParam = (WPARAM) (BOOL) fSort;  //sort option flag
  # lParam = 0;                      //not used; must be zero
  SendMessage(self.mHwnd, ZGM_COMBOCLEAR, fSort, 0)

proc compareText*(self: wZeeGrid, iCellIndex1:int, iCellIndex2:int):int {.validate, inline.} = 
  ## Sends a ZGM_COMPARETEXT message to compare the display text of two cells 
  ## specified by their cell indexes in wParam and lParam.
  ##
  ## Parameters:
  ##    iCellIndex1
  ##      The value of wParam. The cell index of a cell to compare (1 of 2).
  ##    iCellIndex2
  ##      The value of wParam. The cell index of a cell to compare (2 of 2).
  ##
  ## Return Values:
  ##  If the text of the cell pointed to by iCellIndex1 is equal to the text of the cell pointed 
  ##  to by iCellIndex2, the return value is zero. If the text of the cell pointed to by iCellIndex1 
  ##  is less than the text of the cell pointed to by iCellIndex2, the return value is less than zero. 
  ##  If the text of the cell pointed to by iCellIndex1 is greater than the text of the cell 
  ##  pointed to by iCellIndex2, the return value is greater than zero.
  #
  # wParam = (WPARAM)(int) iCellIndex1;        //ZeeGrid cell index
  # lParam = (LPARAM)(int) iCellIndex2;        //ZeeGrid cell index
  result = cast[int](SendMessage(self.mHwnd, ZGM_COMPARETEXT, iCellIndex1, iCellIndex2))

proc compareText2String*(self: wZeeGrid, iCellIndex:int, lpszString:string):int {.validate, inline.} = 
  ## Sends a ZGM_COMPARETEXT2STRING message to compare the display text of a cell 
  ## specified by the cell index in wParam and a string specified in lParam.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The cell index of a cell to compare to the text string pointed to by lpString.
  ##    lpszString
  ##      The value of lParam. A pointer to a string to compare to the text in the cell given in iCellIndex.
  ##
  ## Return Values:
  ##  If the text of the cell pointed to by iCellIndex is equal to the string lpString, the return value is zero. 
  ##  If the text of the cell pointed to by iCellIndex is less than the string lpString, the return value is less than zero. 
  ##  If the text of the cell pointed to by iCellIndex is greater than the string lpString, the return value is greater than zero.
  #
  # wParam = (WPARAM)(int) iCellIndex;  //ZeeGrid cell index
  # lParam = (LPARAM) lpszString;       //pointer to string
  result = cast[int](SendMessage(self.mHwnd, ZGM_COMPARETEXT2STRING, iCellIndex, &lpszString))

proc compareText2String*(self: wZeeGrid, iCellIndexSource:int, iCellIndexDestination:int) {.validate, inline.} = 
  ## Sends a ZGM_GETCOPYCELL message to copy a cell specified by cell index in wParam to 
  ## the cell index specified in lParam.
  ##
  ## Parameters:
  ##    iCellIndexSource
  ##      The value of wParam. The cell index of the source cell to copy.
  ##    iCellIndexDestination
  ##      The value of lParam. The cell index of the destination cell to copy to.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##  
  ## Remarks:
  ##  Copying a cell will copy every attribute of the source cell into the destination cell.
  #
  # wParam = (WPARAM)(int) iCellIndexSource;       //cell index
  # lParam = (LPARAM)(int) iCellIndexDestination;  //cell index
  SendMessage(self.mHwnd, ZGM_COPYCELL, iCellIndexSource, iCellIndexDestination)

proc cursorFollowMouse*(self: wZeeGrid, fEnable:bool = false) {.validate, property.} = 
  ## Sends a ZGM_CURSORFOLLOWMOUSE message to enable or disable the automatic cursor 
  ## cell following of mouse movements within the ZeeGrid. This message is buggy if the client area 
  ## of the grid is not completely filled with cells. I can't think of a good reason to use this, 
  ## so the fact that it's buggy shouldn't matter. I recommend not using this message. 
  ## The more I think about it, the less sense it makes.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. Specifies whether to enable or disable the cursor following mouse movements. 
  ##      A value of TRUE enables cursor following the mouse; a value of FALSE disables cursor following the mouse.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##  
  ## Remarks:
  ##  Cursor mouse following is disabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_CURSORFOLLOWMOUSE, fEnable, 0)

proc deleteRow*(self: wZeeGrid, iRow:int) {.validate, inline.} = 
  ## Sends a ZGM_DELETEROW message to delete a row in the ZeeGrid. 
  ## If the row specified in wParam is less than 1, or greater than the number of rows in the grid, nothing happens.
  ##
  ## Parameters:
  ##    iRow
  ##      The value of wParam. The row number to delete.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  #
  # wParam = (WPARAM)(int) iRow;        //row number to delete
  # lParam = 0;                         //not used; must be zero
  SendMessage(self.mHwnd, ZGM_DELETEROW, iRow, 0)

proc dimGrid*(self: wZeeGrid, columns:WPARAM, fixed_columns:LPARAM) {.validate, inline.} = 
  ## Sends a ZGM_DIMGRID message to dimension or redimension an existing ZeeGrid. 
  ## The ZGM_DIMGRID message sets the total number of columns, number of visible columns, 
  ## and the number of fixed columns in the ZeeGrid.
  ##
  ## Parameters:
  ##    columns
  ##      Value of wParam. The LOWORD of wParam defines the number of total columns the ZeeGrid will have. 
  ##      The HIWORD of wParam is the number of visible columns. The number of visible columns must be greater 
  ##      than or equal to 0 and less than or equal to the total number of columns. If the HIWORD of wParam is 0, 
  ##      the number of visible columns will be equal to the total number of columns. 
  ##      If the LOWORD of wParam is less than 1, the LOWORD of wParam will be set to 1. 
  ##      All ZeeGrids must be dimensioned to have at least 1 column.
  ##
  ##    fixed_columns
  ##      Value of lParam. The number of fixed columns in the ZeeGrid. Fixed columns will not scroll off the ZeeGrid 
  ##      window when the ZeeGrid is scrolled horizontally. The number of fixed columns must be less than or equal to 
  ##      the number of visible columns specified in the HIWORD of wParam.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  If an existing and populated ZeeGrid is sent the ZGM_DIMGRID message, all existing data and allocated memory for 
  ##  that ZeeGrid is deleted and released back to the heap before the ZeeGrid is redimensioned.
  ##
  ##  After sending the ZGM_DIMGRID message to your ZeeGrid, it will be formatted with the number of columns specified and 0 rows.
  ##
  ##  ZeeGrid columns are defined in the ZGM_DIMGRID message and cannot be modified without issuing another ZGM_DIMGRID. 
  ##  Note that rows are not dimensioned. Rows are dynamically allocated as needed.
  ##
  ## .. code-block:: nim
  ## 
  ##  #dimension a ZeeGrid with 8 columns and no fixed columns
  ##  self.dimGrid(8,0)
  ##  
  ##  #dimension a ZeeGrid with 10 columns, only 8 of which are visible and 2 fixed columns
  ##  self.dimGrid(10, 2)
  #
  # wParam = (WPARAM) Columns;       //grid total columns and visible columns
  # lParam = (LPARAM) fixed_columns; //grid fixed columns
  SendMessage(self.mHwnd, ZGM_DIMGRID, columns, fixed_columns)

proc emptyGrid*(self: wZeeGrid, fEmpty:bool) {.validate, inline.} = 
  ## Sends a ZGM_EMPTYGRID message to empty the grid contents. 
  ## This does not affect the ZeeGrid title, column headers, or column widths.
  ##
  ## Parameters:
  ##    fEmpty
  ##      Value of wParam. A value of TRUE will delete all rows. 
  ##      A value of FALSE will keep all rows, but set all cells to the default values and attributes.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  #
  # wParam = (WPARAM) (BOOL) fEmpty;   //empty flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_EMPTYGRID, fEmpty, 0)


proc enableColMove*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_ENABLECOLMOVE message to enable or disable the users ability 
  ## to move or reorder the display of columns. When enabled, the user can reorder columns by 
  ## clicking in the column title to select a column, then use the left and right arrow keys 
  ## to move the position of that column.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. Specifies whether to enable or disable column moving or reordering. 
  ##      A value of TRUE enables column moving; a value of FALSE disables column moving.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  Fixed columns cannot be moved.
  ##
  ##  Moving or reordering the display of columns does not alter the index of the cells in the ZeeGrid. 
  ##  If column 7 is moved to the 3rd display column, the cells in that column are still addressed as being column 7.
  ##
  ##  Column moving is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLECOLMOVE, fEnable, 0)

proc enableColResizing*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_ENABLECOLRESIZING message to enable or disable the users ability 
  ## to resize columns by clicking and dragging the right side of the column header.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. Specifies whether to enable or disable the users ability to resize columns. 
  ##      A value of TRUE enables column resizing; a value of FALSE disables column resizing.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  This message only affects the users ability to resize columns. 
  ##  Columns can still be sized programmatically with the ZGM_SETCOLWIDTH message.
  ##
  ##  Column resizing is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLECOLMOVE, fEnable, 0)

proc enableColumnSelect*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_ENABLECOLUMNSELECT message to enable or disable the 
  ## users ability to select a column by clicking the column header.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. Specifies whether to enable or disable the users ability to select a column.
  ##      A value of TRUE enables column selecting; a value of FALSE disables column selecting.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  By default, column selection is enabled. 
  ##  Setting ZGM_ENABLECOLUMNSELECT to FALSE will let the user double-click a column to sort, 
  ##  but will not highlight the column data.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLECOLUMNSELECT, fEnable, 0)

proc enableCopy*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_ENABLECOPY message to enable or disable the users ability to use 
  ## [Ctrl+C] to copy the selected grid area to the Windows clipboard.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will enable copying the selected grid area to the Windows clipboard.
  ##      A value of FALSE will disable copying from the ZeeGrid to the clipboard.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  Copying is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLECOPY, fEnable, 0)

proc enableCut*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_ENABLECUT message to enable or disable the users ability to use 
  ## [Ctrl+X] to cut the selected grid area from the ZeeGrid.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will enable cutting the selected grid area from the ZeeGrid.
  ##      A value of FALSE will disable cutting from the ZeeGrid.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  Cutting is disabled by default. Only cells that have edit values of "1" can be cut. 
  ##  Cells that are cut revert to empty grid cells with default grid attributes. 
  ##  If copy is enabled, the selected area is copied to the Windows clipboard before the cut operation 
  ##  is performed on the selected cells of the ZeeGrid.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLECUT, fEnable, 0)

proc enableIconIndent*(self: wZeeGrid, iCol:int, fEnable:bool) {.validate, property.} = 
  ## Sends a ZGM_ENABLEICONINDENT message to enable or disable left indenting to allow for cell icons.
  ##
  ## Parameters:
  ##    iCol
  ##      Value of wParam. The column number the apply the icon indent setting specified in lParam.
  ##    fEnable
  ##      Value of lParam. A value of TRUE will cause the left indent of all cells in the ZeeGrid to 
  ##      be incrememted by the height of the grid row to cause left justified text to line up in all 
  ##      columns even if only one cell contains an icon. A value of FALSE will cause cells without icons 
  ##      to left justify with left cell boundary. Cell with icons will justify left to the right boundary of the icon.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  #
  # wParam = (WPARAM) (int)  iCol;    //column number
  # lParam = (LPARAM) (BOOL) fEnable; //enable flag
  SendMessage(self.mHwnd, ZGM_ENABLEICONINDENT, iCol, fEnable)

proc enablePaste*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_ENABLEPASTE message to enable or disable the users ability to use 
  ## [Ctrl+V] paste from the Windows clipboard into the ZeeGrid at the cursor position.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will enable pasting from the Windows clipboard to the ZeeGrid at the cursor postion.
  ##      A value of FALSE will disable pasting from the clipboard to the ZeeGrid.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  Pasting is disabled by default. Only cells that have edit values of "1" can be pasted to. Pasting that requires 
  ##  expansion of the columns in ZeeGrid will fail, resulting in a messagebox displaying that the operation could 
  ##  not be fully completed. A pasting operation that requires additional rows in the ZeeGrid will depend on 
  ##  the setting of self.expandRowsOnPaste(true).
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLEPASTE, fEnable, 0)

proc enableRowSizing*(self: wZeeGrid, fEnable:bool = false) {.validate, property.} = 
  ## Sends a ZGM_ENABLEROWSIZING message to enable or disable the users ability to adjust the row 
  ## heights in the ZeeGrid. This can only be done when self.showRowNumbers(true) is set. The cell in the column header 
  ## row above the row numbers is the trigger for this action. When enable row sizing is enabled the mouse cursor will 
  ## change to a row resizing icon and the user can click and drag the mouse to change the row heights.
 ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will enable row sizing.
  ##      A value of FALSE will disable row sizing.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLEROWSIZING, fEnable, 0)

proc enableSort*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_ENABLESORT message to enable or disable sorting of the ZeeGrid.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE enables sorting of the ZeeGrid. 
  ##      A value of FALSE disables sorting.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  Sorting is enabled by default. 
  ##  This message only affects the users ability to sort the ZeeGrid by double-clicking in the column header.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLESORT, fEnable, 0)

proc enableTBEdit*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_ENABLETBEDIT message to enable or disable the edit button on the ZeeGrid toolbar.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will enable the edit button on the ZeeGrid toolbar. 
  ##      A value of FALSE will disable the edit button on the ZeeGrid toolbar.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  The edit button is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLETBEDIT, fEnable, 0)

proc enableTBExport*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_ENABLETBEXPORT message to enable or disable the export button on the ZeeGrid toolbar.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will enable the export button on the ZeeGrid toolbar. 
  ##      A value of FALSE will disable the export button on the ZeeGrid toolbar.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  The edit button is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLETBEXPORT, fEnable, 0)

proc enableTBMergeRows*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_ENABLETBMERGEROWS message to enable or disable the merge rows button on the ZeeGrid toolbar.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will enable the merge rows button on the ZeeGrid toolbar. 
  ##      A value of FALSE will disable the merge rows button on the ZeeGrid toolbar.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  The merge rows button is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLETBMERGEROWS, fEnable, 0)

proc enableTBPrint*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_ENABLETBPRINT message to enable or disable the print button on the ZeeGrid toolbar.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will enable the print button on the ZeeGrid toolbar. 
  ##      A value of FALSE will disable the print button on the ZeeGrid toolbar.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  The print button is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLETBPRINT, fEnable, 0)

proc enableTBRowNumbers*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_ENABLETBROWNUMBERS message to enable or disable the row numbers button on the ZeeGrid toolbar.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will enable the row numbers button on the ZeeGrid toolbar. 
  ##      A value of FALSE will disable the row numbers button on the ZeeGrid toolbar.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  The row numbers button is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLETBROWNUMBERS, fEnable, 0)

proc enableTBSearch*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_ENABLETBSEARCH message to enable or disable the search button on the ZeeGrid toolbar.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will enable the search button on the ZeeGrid toolbar. 
  ##      A value of FALSE will disable the search button on the ZeeGrid toolbar.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  The search button is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLETBSEARCH, fEnable, 0)

proc enableToolBarToggle*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_ENABLETOOLBARTOGGLE message to enable or disable the users ability to toggle 
  ## the display of the ZeeGrid toobar between its shown and hidden state by pressing F8.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will enable toolbar toggling and will toggle the toolbar on and 
  ##      off when the user presses F8. A value of FALSE will disable toolbar toggling.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  Toolbar toggle is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLETOOLBARTOGGLE, fEnable, 0)

proc enableTransparentHighlighting*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_ENABLETRANSPARENTHIGHLIGHTING message to enable or disable the grid using 
  ## transparent highlighting. Transparent highlighting enables the user to see cell background and foreground 
  ## colors when the row is highlighted due to it being the cursor row, or because an area has been selected for 
  ## the clipboard.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. 
  ##      A value of TRUE will enable transparent highlighting. 
  ##      A value of FALSE will use solid color highlighting.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  Transparent highlighting is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLETRANSPARENTHIGHLIGHTING, fEnable, 0)

proc expandRowsOnPaste*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_EXPANDROWSONPASTE message to enable or disable the ZeeGrid adding additional 
  ## rows to complete a clipboard paste operation.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. 
  ##      A value of TRUE will let the ZeeGrid add additional rows if needed in a clipboard paste operation. 
  ##      A value of FALSE will cause the ZeeGrid to not add additional rows.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  Expanding rows on paste is disabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_ENABLETOOLBARTOGGLE, fEnable, 0)

proc exportGrid*(self: wZeeGrid, dwFlags:DWORD, lpszString:string) {.validate, inline.} = 
  ## Sends a ZGM_EXPORT message to save the ZeeGrid contents to a comma-delimited file.
  ##
  ## Parameters:
  ##    dwFlags
  ##      The value of wParam. If this value is zero, and lParam is zero, the user is prompted for the filename to export to. 
  ##      Optionally, the LOWORD of this value can specify the delimiter. 
  ##      The HIWORD of this value can specify special flags for the export operation. 
  ##      See the 'Remarks' section for explaination of the flags.
  ##
  ##    lpszString
  ##      The value of lParam. If this value is zero, the user will be prompted with the save file dialog to 
  ##      name the exported file. If this value is a pointer to a null-terminated string, 
  ##      the ZeeGrid will export to the supplied filename.
  ##
  ## Return Values:
  ##  This message does not return a value. 
  ##
  ## Remarks:
  ##  The HIWORD of wParam can be a combination of the following flags:
  ##    EF_FILENAMESUPPLIED - Filename to export to is given in lParam
  ##    EF_DELIMITERSUPPLIED - LOWORD of wParam is the character to use for the delimiter, otherwise use comma.
  ##    EF_SILENT - Export confirmation message is not displayed.
  ##    EF_NOHEADER - The data export begins with row 1 and does not export the column header row.
  #
  # wParam = (WPARAM)(DWORD) dwFlags;   //Optional flags
  # lParam = (LPARAM) lpszString;       //Optional filename
  SendMessage(self.mHwnd, ZGM_EXPORT, dwFlags, &lpszString)

proc getCDate*(self: wZeeGrid, iJulianDate:int, lpszString:string):bool {.validate, inline.} = 
  ## Sends a ZGM_GETCDATE message to convert a given julian date into a date string in 'YYYY/MM/DD' format.
  ##
  ## Parameters:
  ##    iJulianDate
  ##      Value of wParam. 
  ##      The value of wParam. A valid julian date in the range of [1..3068037]. 
  ##      Julian date 1 = 'Jan 1, 1600'. Julian date 3068037 = 'Dec 31, 9999'
  ##
  ##    lpszString
  ##      The value of lParam. If the julian date supplied in wParam is valid, 
  ##      the julian date is converted to text in the 'YYYY/MM/DD' form and returned 
  ##      in the string pointed to by lParam.
  ##
  ##      The string must be previously allocated and have a minimum length of 11 characters. 
  ##      Failure to preallocate this string will result in undefined behavior, 
  ##      possibly resulting in data loss and/or program crash.
  ##
  ## Return Values:
  ##  This message returns TRUE if the julian date is valid, otherwise it returns FALSE.
  ##
  ## Remarks:
  ##  Preallocate the string in lParam with at least 11 characters.
  #
  # wParam = (WPARAM) (int) iJulianDate;   //julian date
  # lParam = (LPARAM) lpszString;          //pointer to string to return converted julian date as text in 'YYYY/MM/DD' format.
  result = cast[bool](SendMessage(self.mHwnd, ZGM_GETCDATE, iJulianDate, &lpszString))

proc getCellBColor*(self: wZeeGrid, iCellIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCELLBCOLOR message to get the background color of the specified cell in the ZeeGrid.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The cell index to get the background color.
  ##
  ## Return Values:
  ##  The color palette index of the specified cell's background color.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = 0;                          //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCELLBCOLOR, iCellIndex, 0))

proc getCellDouble*(self: wZeeGrid, iCellIndex:int):float {.validate, inline.} = 
  ## Sends a ZGM_GETCELLDOUBLE message to get the double value of the specified cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The ZeeGrid cell index.
  ##
  ##    lpDoubleValue
  ##      The value of lParam. A pointer to a double.
  ##
  ## Return Values:
  ##  Returns float value of cell.
  #
  # wParam = (WPARAM)(int) iCellIndex;        //ZeeGrid cell index
  # lParam = (LPARAM) lpDoubleValue;          //pointer to double
  var lpDoubleValue: float
  SendMessage(self.mHwnd, ZGM_GETCELLDOUBLE, iCellIndex, addr lpDoubleValue)
  return lpDoubleValue

proc getCellEdit*(self: wZeeGrid, iCellIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCELLEDIT message to get the edit attribute value of the specified cell in the ZeeGrid.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The cell index to get the edit attribute value.
  ##
  ## Return Values:
  ##  The return value is the edit attribute of the specified ZeeGrid cell. A value of 0 means that the cell is not editable, 
  ##  or readonly. A value of 1 means that the cell is editable with a text edit box. A value of 2 means that the cell is editable 
  ##  with a droplist combo box. A value of 3 means that the cell is a boolean value and is editable by double-clicking the cell 
  ##  to change the boolean state from TRUE to FALSE or vice versa. A value of 4 means that the cell is editable by the date picker 
  ##  common control.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = 0;                          //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCELLEDIT, iCellIndex, 0))

proc getCellFColor*(self: wZeeGrid, iCellIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCELLFCOLOR message to get the foreground color (text color) of the specified cell in the ZeeGrid.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The cell index to get the foreground color.
  ##
  ## Return Values:
  ##  The color palette index of the specified cell's foreground (text) color.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = 0;                          //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCELLFCOLOR, iCellIndex, 0))

proc getCellFont*(self: wZeeGrid, iCellIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCELLFONT message to get the font palette index of the font in the specified cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The cell index to get the cell font palette index.
  ##
  ## Return Values:
  ##  The font palette index of the font in the specified cell.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = 0;                          //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCELLFONT, iCellIndex, 0))

proc getCellFormat*(self: wZeeGrid, iCellIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCELLFORMAT message to get the format value of the specified cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The ZeeGrid cell index.
  ##
  ## Return Values:
  ##  The format value of the cell specified in iCellIndex.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = 0;                          //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCELLFORMAT, iCellIndex, 0))

proc getCellIcon*(self: wZeeGrid, iCellIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCELLICON message to get the icon palette index of the icon in the specified cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The cell index to get the cell icon palette index.
  ##
  ## Return Values:
  ##  The icon palette index of the icon in the specified cell.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = 0;                          //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCELLICON, iCellIndex, 0))

proc getCellIndex*(self: wZeeGrid, iRow:int, iCol:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCELLINDEX message to get the index of a cell that is being referenced by row and column.
  ##
  ## Parameters:
  ##    iRow
  ##      The value of wParam. The ZeeGrid row number.
  ##    iCol
  ##      The value of lParam. The ZeeGrid column number.
  ##
  ## Return Values:
  ##  The ZeeGrid cell index of the cell referenced by row and column.
  #
  # wParam = (WPARAM)(int) iRow;        //row of cell
  # lParam = (LPARAM)(int) iCol;        //column of cell
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCELLINDEX, iRow, iCol))

proc getCellInt*(self: wZeeGrid, iCellIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCELLINT message to get the integer value of the specified cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The ZeeGrid cell index.
  ##
  ##    lpIntValue
  ##      The value of lParam. A pointer to a integer.
  ##
  ## Return Values:
  ##  Returns int value of cell.
  #
  # wParam = (WPARAM)(int) iCellIndex;     //ZeeGrid cell index
  # lParam = (LPARAM) lpIntValue;          //pointer to int
  var lpIntValue: int
  SendMessage(self.mHwnd, ZGM_GETCELLINT, iCellIndex, addr lpIntValue)
  return lpIntValue

proc getCellJustify*(self: wZeeGrid, iCellIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCELLJUSTIFY message to get the text justification value of the specified cell in the ZeeGrid.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The ZeeGrid cell index to get the text justification value.
  ##
  ## Return Values:
  ##  The text justification value of the cell specified in wParam.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = 0;                          //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCELLJUSTIFY, iCellIndex, 0))

proc getCellMark*(self: wZeeGrid, iCellIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCELLMARK message to get the mark attribute of the specified cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The index of the ZeeGrid cell.
  ##
  ## Return Values:
  ##  The value of the cell mark attribute.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = 0;                          //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCELLMARK, iCellIndex, 0))

proc getCellRestriction*(self: wZeeGrid, iCellIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCELLRESTRICTION message to get the ZeeGrid restriction value of the referenced cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The index of the ZeeGrid cell.
  ##
  ## Return Values:
  ##  The value of the cell restriction attribute.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = 0;                          //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCELLRESTRICTION, iCellIndex, 0))

proc getCellsAllocated*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETCELLSALLOCATED message to get the number of cells that are allocated in memory for the ZeeGrid.
  ##
  ## Return Values:
  ##  The number of cells allocated for the ZeeGrid.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCELLSALLOCATED, 0, 0))

proc getCellTextLength*(self: wZeeGrid, iCellIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCELLTEXTLENGTH message to get the length of the text string specified by the cell index.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The ZeeGrid cell index.
  ##
  ## Return Values:
  ##  The length of the string in the cell specified in iCellIndex.
  #
  # wParam = (WPARAM)(int) iCellIndex;        //ZeeGrid cell index
  # lParam = 0;                               //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCELLTEXTLENGTH, iCellIndex, 0))

proc getCellText*(self: wZeeGrid, iCellIndex:int):string {.validate, inline.} = 
  ## Sends a ZGM_GETCELLTEXT message to get the display text string of the specified cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The ZeeGrid cell index.
  ##
  ##    lpszString
  ##      The value of lParam. A pointer to a string.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;     //ZeeGrid cell index
  # lParam = (LPARAM) lpszString;          //pointer to string
  var needed = self.getCellTextLength(iCellIndex)
  if needed > 0:
    var lpszString = newString(needed)
    SendMessage(self.mHwnd, ZGM_GETCELLTEXT, iCellIndex, &lpszString)
    return lpszString
  else:
    return ""

proc getCellType*(self: wZeeGrid, iCellIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCELLTYPE message to get the ZeeGrid data type of the data in the referenced cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The ZeeGrid cell index.
  ##
  ## Return Values:
  ##  The value of the cell type attribute.
  #
  # wParam = (WPARAM)(int) iCellIndex;        //ZeeGrid cell index
  # lParam = 0;                               //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCELLTYPE, iCellIndex, 0))

proc getColOfIndex*(self: wZeeGrid, iCellIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCOLOFINDEX message to get the column that contains the specified cell index
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The ZeeGrid cell index.
  ##
  ## Return Values:
  ##  The column number of the specified ZeeGrid cell index.
  #
  # wParam = (WPARAM)(int) iCellIndex;        //ZeeGrid cell index
  # lParam = 0;                               //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCOLOFINDEX, iCellIndex, 0))

proc getColor*(self: wZeeGrid, iCPIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCOLOR message to get the RGB value of the specified 
  ## index of the ZeeGrid color palette.
  ##
  ## Parameters:
  ##    iCPIndex
  ##      The value of wParam. The index of the color palette to retrieve the RGB value.
  ##
  ## Return Values:
  ##  The RGB value of the specified index of the color palette.
  #
  # wParam = (WPARAM)(int) iCPIndex;        //Color palette index
  # lParam = 0;                             //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCOLOR, iCPIndex, 0))

proc getCols*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETCOLS to get the number of columns in the ZeeGrid.
  ##
  ## Return Values:
  ##  This message returns the total number of columns in the ZeeGrid.
  ##
  ## Remarks:
  ##  This message function will return the total number of columns in the ZeeGrid. 
  ##  Columns that have been resized to zero width and non-visible columns as specified in ZGM_DIMGRID 
  ##  are included in the returned value.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCOLS, 0, 0))

proc getColumnInDisplayPosition*(self: wZeeGrid, iDisplayColumn:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCOLUMNINDISPLAYPOSITION message to get the column in the specified 
  ## dislay positon of the ZeeGrid. Since the user can reorder the display positions of the columns, 
  ## this message provides a way to programmatically determine the column in a particular display 
  ## position in the ZeeGrid.
  ##
  ## Parameters:
  ##    iDisplayColumn
  ##      The value of wParam. The display position to determine the column.
  ##
  ## Return Values:
  ##  The column in the specified display position is returned.
  #
  # wParam = (WPARAM)(int) iDisplayColumn;        //Color palette index
  # lParam = 0;                                   //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCOLUMNINDISPLAYPOSITION, iDisplayColumn, 0))

proc getColumnOrder*(self: wZeeGrid, iElements:int, lpiArray:openArray[int]): pointer {.validate, inline.} = 
  ## Sends a ZGM_GETCOLUMNORDER message to programmatically retrieve the ZeeGrid column dispay order. 
  # lParam is a pointer to an array of integers. 
  # wParam is the number of elements in the array pointed to by lParam.
  ##
  ## Parameters:
  ##  iElements
  ##    The value of wParam. The number of elements in the integer array supplied in lParam.
  ##
  ##  lpiArray
  ##    The value of lParam. A pointer to an array of integers. On return, this array will hold the column display order.
  ##
  ## Return Values:
  ##  returns array with the column order. 
  ##
  ## Remarks:
  ##  Before using this message, the programmer should get the number of columns with ZGM_GETCOLS. 
  ##  An array of integers should be created with this number of elements. 
  ##  The number of elements in the array must be specified in wParam and be equal to the number of columns in the ZeeGrid.
  #
  # wParam = (WPARAM)(int) iElements;      //number of elements in the array in lParam
  # lParam = (LPARAM) lpiArray;            //array of integers
  var arr = cast[pointer](unsafeAddr lpiArray)
  SendMessage(self.mHwnd, ZGM_GETCOLUMNORDER, iElements, arr)  
  return arr

proc getColWidth*(self: wZeeGrid, iCol:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETCOLWIDTH message to get the width of the specified column in pixels.
  ##
  ## Parameters:
  ##    iCol
  ##      The value of wParam. The column number to get the width.
  ##
  ## Return Values:
  ##  The width of the specified column in pixels.
  #
  # wParam = (WPARAM)(int) iCol;        //column number
  # lParam = 0;                         //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCOLWIDTH, iCol, 0))

proc getCRC*(self: wZeeGrid, lpszString:string = ""):int {.validate, inline.} = 
  ## Sends a ZGM_GETCRC message to get the CRC (cyclic redundancy checksum) value of the specified null-terminated string.
  ##
  ## Parameters:
  ##    lpszString
  ##      Value of lParam. A pointer to a null-terminated string.
  ##
  ## Return Values:
  ##  The CRC value of the text supplied in lParam.
  #
  # wParam = 0;                      //not used; must be zero
  # lParam = (LPARAM) lpszString;    //address of string
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCOLWIDTH, 0, &lpszString))

proc getCursorCol*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETCURSORCOL message to get the column of the ZeeGrid cursor.
  ##
  ## Return Values:
  ##  The column of the ZeeGrid cursor.
  ##
  ## Remarks:
  ##  If the cursor was "lost", the return value will be -1.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCURSORCOL, 0, 0))

proc getCursorIndex*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETCURSORINDEX message to get the cell index of the ZeeGrid cursor.
  ##
  ## Return Values:
  ##  The return value is the cell index of the ZeeGrid cursor.
  ##
  ## Remarks:
  ##  If the cursor was "lost", the return value will be -1.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCURSORINDEX, 0, 0))

proc getCursorRow*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETCURSORROW message to get the row of the ZeeGrid cursor.
  ##
  ## Return Values:
  ##  The return value is the row of the ZeeGrid cursor.
  ##
  ## Remarks:
  ##  If the cursor was "lost", the return value will be -1.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETCURSORROW, 0, 0))

proc getDisplayPositionOfColumn*(self: wZeeGrid, iColumn: int):int {.validate, inline.} = 
  ## Sends a ZGM_GETDISPLAYPOSITIONOFCOLUMN message to get the dislay positon of 
  ## the specified column in the ZeeGrid. Since the user can reorder the display positions of the columns, 
  ## this message provides a way to programmatically determine the display position of a particular column.
  ##
  ## Parameters:
  ##  iColumn
  ##    The value of wParam. The actual column number to determine the display position.
  ##
  ## Return Values:
  ##  The display position of the specified column is returned.
  #
  # wParam = (WPARAM)(int) iColumn;     //column number
  # lParam = 0;                         //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETDISPLAYPOSITIONOFCOLUMN, iColumn, 0))

proc getDOW*(self: wZeeGrid, iJulianDate: int):int {.validate, inline.} = 
  ## Sends a ZGM_GETDOW message to get the day of the week of the julian date specified in wParam.
  ##
  ## Parameters:
  ##  iJulianDate
  ##    The value of wParam. The value is a valid julian date in the range of [1..3068037].
  ##
  ## Return Values:
  ##  If the julian date specified in wParam is valid, this message returns the day of the week of that date. Otherwise, the message returns -1.
  ## 
  ##  The following values are returned based on the day of the week:
  ## 
  ##   2 - Sunday
  ##   3 - Monday
  ##   4 - Tuesday
  ##   5 - Wednesday
  ##   6 - Thursday
  ##   0 - Friday
  ##   1 - Saturday
  #
  # wParam = (WPARAM) (int) iJulianDate;   //julian date
  # lParam = 0;                            //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETDOW, iJulianDate, 0))

proc getDOWLong*(self: wZeeGrid, iDayOfWeek: int):string {.validate, inline.} = 
  ## Sends a ZGM_GETDOWLONG message to get name of the weekday of the day of the week value specified in wParam.
  ##
  ## Parameters:
  ##  iDayOfWeek
  ##    The value of wParam. The value is the value returned by ZGM_GETDOW or ZGM_GETREGDATEDOW.
  ##
  ##  lpszString
  ##    The value of lParam. A pointer to a null-terminated string to hold the weekday name that is returned from this message. 
  ##    This character string must be previously allocated with a minimum length of 10 characters.
  ##    The string must be previously allocated and have a minimum length of 10 characters. 
  ##    Failure to preallocate this string will result in undefined behavior, possibly resulting in data loss and/or program crash.
  ##
  ## Return Values:
  ##  This message returns TRUE if the value in wParam is a valid day of the week value in the range of [0..6], otherwise the message returns FALSE.
  #
  # wParam = (WPARAM) (int) iDayOfWeek;    //day of week value
  # lParam = (LPARAM) lpszString;          //pointer to string to return the weekday name
  var lpszString = newString(10)
  SendMessage(self.mHwnd, ZGM_GETDOWLONG, iDayOfWeek, &lpszString)
  return lpszString
  
proc getDOWShort*(self: wZeeGrid, iDayOfWeek: int):string {.validate, inline.} = 
  ## Sends a ZGM_GETDOWLONG message to get 3-character abbreviated name of the weekday of the day of the week value specified in wParam.
  ##
  ## Parameters:
  ##  iDayOfWeek
  ##    The value of wParam. The value is the value returned by ZGM_GETDOW or ZGM_GETREGDATEDOW.
  ##
  ##  lpszString
  ##    The value of lParam. A pointer to a null-terminated string to hold the 3-character abbreviated weekday name that is returned from this message. 
  ##    This character string must be previously allocated with a minimum length of 4 characters.
  ##    The string must be previously allocated and have a minimum length of 4 characters. 
  ##    Failure to preallocate this string will result in undefined behavior, possibly resulting in data loss and/or program crash.
  ##
  ## Return Values:
  ##  This message returns TRUE if the value in wParam is a valid day of the week value in the range of [0..6], otherwise the message returns FALSE.
  #
  # wParam = (WPARAM) (int) iDayOfWeek;    //day of week value
  # lParam = (LPARAM) lpszString;          //pointer to string to return the weekday name
  var lpszString = newString(4)
  SendMessage(self.mHwnd, ZGM_GETDOWSHORT, iDayOfWeek, &lpszString)
  return lpszString

  
proc getDOY*(self: wZeeGrid, iJulianDate: int):int {.validate, inline.} = 
  ## Sends a ZGM_GETDOY message to get the day of the year for the given julian date.
  ##
  ## Parameters:
  ##  iJulianDate
  ##    The value of lParam. A julian date value. Valid values are in the range of [1..3068037].
  ##
  ## Return Values:
  ##  This message returns the day of the year for the given julian date. If the julian date specified in lParam is valid, 
  ##  the return value will be in the range of [1..366]. If the julian date specified in lParam is not valid, this message will return 0;
  #
  # wParam = 0;                          //not used; must be 0
  # lParam = (LPARAM)(int) iJulianDate;  //julian date
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETDOY, 0, iJulianDate))

proc getEditedCell*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETEDITEDCELL message to retrieve the cell index of the most recently edited cell.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  ##
  ## Return Values:
  ##  The return value is the cell index of the most recently edited cell.
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETEDITEDCELL, 0, 0))

proc getEditText*(self: wZeeGrid):string {.validate, inline.} = 
  ## Sends a ZGM_GETEDITTEXT to get the text of a cell's edit box after the edit is finished, but before the text is stored in the cell.
  ##
  ## Parameters:
  ##  iChars
  ##    The value of wParam. The number of bytes allocated for the string in lParam
  ##
  ##  lpszString
  ##    The value of lParam. A pointer to a null-terminated string to hold the contents of the cell edit control contents.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iChars;       //length of string supplied in lParam
  # lParam = (LPARAM) lpszString;        //pointer to string to retrieve edit text
  var iCellIndex = self.getEditedCell()
  var iChars = self.getCellTextLength(iCellIndex)
  var lpszString = newString(iChars)
  SendMessage(self.mHwnd, ZGM_GETDOWSHORT, iChars, &lpszString)
  return lpszString

proc getFixedColumns*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETFIXEDCOLUMNS message to get the number of fixed columns in the ZeeGrid.
  ##
  ## Return Values:
  ##  The number of fixed columns in the ZeeGrid.
  ##
  ## Remarks:
  ##  The return value will be the same value as the lParam in the ZGM_DIMGRID message function.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETFIXEDCOLUMNS, 0, 0))

proc getFont*(self: wZeeGrid, iFPIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETFONT message to get the font handle (HFONT) of the specified index in the ZeeGrid font palette.
  ##
  ## Parameters:
  ##  iFPIndex
  ##    The value of wParam. The index of the font palette to retrieve the font handle.
  ##
  ## Return Values:
  ##  The font handle (HFONT) of the specified index of the font palette.
  #
  # wParam = (WPARAM)(int) iFPIndex;  //Font palette index
  # lParam = 0;                       //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETFONT, iFPIndex, 0))

proc getGridWidth*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETGRIDWIDTH message to determine the width of the ZeeGrid client area in pixels.
  ##
  ## Return Values:
  ##  The width of the client area of the ZeeGrid in pixels.
  ##
  ## Remarks:
  ##  The returned value is the width in pixels from the left client edge of the ZeeGrid data area to 
  ##  the right client edge if there is no vertical scrollbar. Otherwise, 
  ##  it is the distance to the left edge of the vertical scrollbar.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETGRIDWIDTH, 0, 0))

proc getItemData*(self: wZeeGrid, iCellIndex:int):int32 {.validate, inline.} = 
  ## Sends a ZGM_GETITEMDATA message to get the user supplied 32-bit value associated with the specified cell in the ZeeGrid.
  ##
  ## Parameters:
  ##  iCellIndex
  ##    The value of wParam. The cell index to get the user supplied 32-bit data value.
  ##
  ## Return Values:
  ##  The return value is the 32-bit value associated with the specified ZeeGrid cell.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = 0;                          //not used; must be zero
  result = cast[int32](SendMessage(self.mHwnd, ZGM_GETITEMDATA, iCellIndex, 0))

proc getJDate*(self: wZeeGrid, lpszString:string):int {.validate, inline.} = 
  ## Sends a ZGM_GETJDATE message to get the julian date of a date represented as a null-terminated string.
  ##
  ## Parameters:
  ##  lpszString
  ##    The value of lParam. A pointer to a null-terminated date string. 
  ##    This string could be '12/28/58', '1958/12/28', '12/28/1958' or 'Dec 28, 1958' or other valid string representation of a date.
  ##    Valid dates are in the range from 'Jan 1, 1600' to 'Dec 31, 9999'
  ##
  ## Return Values:
  ##  If the date string represented in lParam is a valid date, the message will return the julian date of the text represented date. 
  ##  If the date string cannot be deciphered to a valid date, the message will return 0.
  ##  Julian dates are valid through the range of [1..3068037]. Julian date 1 = 'Jan 1, 1600'. Julian date 3068037 = 'Dec 31, 9999'.
  #
  # wParam = 0;                          //not used; must be 0
  # lParam = (LPARAM) lpszString;        //pointer to string representation of a date
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETJDATE, 0, &lpszString))

proc getLastButtonPressed*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETLASTBUTTONPRESSED message to get the index of the button data type cell that was last clicked.
  ##
  ## Return Values:
  ##  The return value is the cell index of the most recently clicked button data type cell.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETLASTBUTTONPRESSED, 0, 0))

proc getMouseCol*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETMOUSECOL message to determine the column of the ZeeGrid that the mouse pointer is currently on.
  ##
  ## Return Values:
  ##  The column number that the mouse pointer is currently over. 
  ##  The return value will only be valid when this message is sent in response to a ZeeGrid notification message about a mouse action.
  ##
  ## Remarks:
  ##  A return value of -1 signifies that the mouse is over an area of the grid that is not a valid column. 
  ##  A return value of 0 signifies the mouse is over the row numbers column.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETMOUSECOL, 0, 0))

proc getMouseRow*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETMOUSEROW message to determine the row of the ZeeGrid that the mouse pointer is currently on.
  ##
  ## Return Values:
  ##  The row number that the mouse pointer is currently over. 
  ##  The return value will only be valid when this message is sent in response to a ZeeGrid notification message about a mouse action.
  ##
  ## Remarks:
  ##  A return value of -1 signifies that the mouse is over an area of the grid that is not a valid row. 
  ##  A return value of 0 signifies the mouse is over the column header row.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETMOUSEROW, 0, 0))

proc getRangeSum*(self: wZeeGrid, iCellIndex:int):float {.validate, inline.} = 
  ## Sends a ZGM_GETRANGESUM message to get the sum of the range that was calculated with the ZGM_SETRANGE message.
  ##
  ## Parameters:
  ##    lpDoubleValue
  ##      The value of lParam. A pointer to a double to retrieve the range sum..
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = 0;                               //not used; must be zero
  # lParam = (LPARAM) lpDoubleValue;          //pointer to double
  var lpDoubleValue: float
  SendMessage(self.mHwnd, ZGM_GETRANGESUM, 0, addr lpDoubleValue)
  return lpDoubleValue

proc getRegDateDay*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETREGDATEDAY message to get the day of the month of the date in the internal date register.
  ##
  ## Return Values:
  ##  If the date in the internal date register is valid, this message returns the day of the month of that date. 
  ##  Otherwise, the message returns 0.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETREGDATEDAY, 0, 0))

proc getRegDateDOW*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETREGDATEDOW message to get the day of the week of the date in the internal date register.
  ##
  ## Return Values:
  ##  If the date in the internal date register is valid, this message returns the day of the week of that date. Otherwise, the message returns -1.
  ## 
  ##  The following values are returned based on the day of the week:
  ## 
  ##   2 - Sunday
  ##   3 - Monday
  ##   4 - Tuesday
  ##   5 - Wednesday
  ##   6 - Thursday
  ##   0 - Friday
  ##   1 - Saturday
  #
  # wParam = 0;       //not used; must be 0
  # lParam = 0;       //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETREGDATEDOW, 0, 0))

proc getRegDateDOY*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETREGDATEDOY message to get the day of the year of the date in the internal date register.
  ##
  ## Return Values:
  ##  If the date in the internal date register is valid, this message returns the day of the year of that date. Otherwise, the message returns 0.
  ##  If the date is valid, return value will be in the range of [1..366].
  #
  # wParam = 0;       //not used; must be 0
  # lParam = 0;       //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETREGDATEDOY, 0, 0))

proc getRegDateFormatted*(self: wZeeGrid, iDateFormat: int):string {.validate, inline.} = 
  ## Sends a ZGM_GETREGDATEFORMATTED message to get the specified text representation of the date in the internal date register.
  ##
  ## Parameters:
  ##  iDateFormat
  ##    The value of wParam. Valid date format numbers are in the range of [0..4].
  ##    For example, the date 'February 3, 1965' will be returned as follows for the given formats:
  ##    
  ##      0 - '1965/02/03'
  ##      1 - '02/03/1965'
  ##      2 - '2/3/1965'
  ##      3 - 'Feb 3, 1965'
  ##      4 - 'February 3, 1965
  ##
  ##  lpszString
  ##    The value of lParam. The date in the internal date register is converted to text in the specified format and returned in the string pointed to by lParam.
  ##    The string must be previously allocated and have a minimum length of 19 characters. 
  ##    Failure to preallocate this string will result in undefined behavior, possibly resulting in data loss and/or program crash.
  ##    A string of 19 characters is needed to hold the longest formatted date that could possibly be returned. 
  ##    That would be 'September DD, YYYY' and is 18 characters in length. One character is needed for the null termination, 
  ##    thus needing a length of at least 19 characters.
  ##
  ## Return Values:
  ##  Returns the text representation of the date in internal date register.
  #
  # wParam = (WPARAM) (int) iDateFormat; //date format number
  # lParam = (LPARAM) lpszString;        //pointer to string to return the text representation of a date
  #  This message returns TRUE if the date in the internal date register is valid, otherwise it returns FALSE.
  var lpszString = newString(19)
  SendMessage(self.mHwnd, ZGM_GETREGDATEFORMATTED, iDateFormat, &lpszString)
  return lpszString

proc getRegDateMonth*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETREGDATEMONTH message to get the month of the date in the internal date register.
  ##
  ## Return Values:
  ##  If the date in the internal date register is valid, this message returns the month of that date. Otherwise, the message returns 0.
  #
  # wParam = 0;       //not used; must be 0
  # lParam = 0;       //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETREGDATEMONTH, 0, 0))

proc getRegDateWOY*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETREGDATEWOY message to get the week of the year of the date in the internal date register.
  ##
  ## Return Values:
  ##  If the date in the internal date register is valid, this message returns the week of the year of that date. Otherwise, the message returns 0.
  ##  If the date is valid, return values are in the range of [1..53]. Weeks begin on Sunday and end on Saturday.
  ##  If the return value is 53, that day really falls in the first week of the next calendar year, 
  ##  but it is in the 53rd week of the year of the date in question.
  #
  # wParam = 0;       //not used; must be 0
  # lParam = 0;       //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETREGDATEWOY, 0, 0))

proc getRegDateYear*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETREGDATEYEAR message to get the year of the date in the internal date register.
  ##
  ## Return Values:
  ##  If the date in the internal date register is valid, this message returns the year of that date. Otherwise, the message returns 0.
  #
  # wParam = 0;       //not used; must be 0
  # lParam = 0;       //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETREGDATEYEAR, 0, 0))

proc getRowHeight*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETROWHEIGHT to get the height in pixels of the ZeeGrid data rows.
  ##
  ## Return Values:
  ##  The height of the ZeeGrid data rows in pixels.
  ##
  ## Renarks:
  ##  All data rows of the ZeeGrid are the same height.
  #
  # wParam = 0;       //not used; must be 0
  # lParam = 0;       //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETROWHEIGHT, 0, 0))

proc getRowOfIndex*(self: wZeeGrid, iCellIndex:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETROWOFINDEX message to get the row of the specified cell index.
  ##
  ## Parameters:
  ##  iCellIndex
  ##    The value of wParam. The index of the ZeeGrid cell.
  ##
  ## Return Values:
  ##  The ZeeGrid row number of the specified cell index.
  #
  # wParam = (WPARAM)(int) iCellIndex;  //cell index
  # lParam = 0;                         //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETROWOFINDEX, iCellIndex, 0))

proc getRows*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETROWS message to get the number of rows in the ZeeGrid.
  ##
  ## Return Values:
  ##  The return value is the number of rows in the ZeeGrid.
  ##
  ## Renarks:
  ##  The number of rows does not include the column header row.
  #
  # wParam = 0;       //not used; must be 0
  # lParam = 0;       //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETROWS, 0, 0))

proc getRowsAllocated*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETROWSALLOCATED message to get the number of rows that are allocated in memory for the ZeeGrid.
  ##
  ## Return Values:
  ##  The number of rows allocated for the ZeeGrid.
  ##
  ## Renarks:
  ##  A ZeeGrid might only have 30 rows of data, but could have 30 or more rows allocated in memory for additional row expansion. 
  ##  The ZeeGrid automatically resizes its number of allocated rows when needed to hold additional rows of data.
  #
  # wParam = 0;       //not used; must be 0
  # lParam = 0;       //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETROWSALLOCATED, 0, 0))

proc getRowsPerPage*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETROWSPERPAGE to determine the number of rows that can be displayed in the ZeeGrid without vertical scrolling.
  ##
  ## Return Values:
  ##  The number of rows per display page. That is, the number of rows that can be displayed in the ZeeGrid without having to use the vertical scrollbar.
  #
  # wParam = 0;       //not used; must be 0
  # lParam = 0;       //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETROWSPERPAGE, 0, 0))

proc getSelectedColumn*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETSELECTEDCOL message to get the currently selected column in the ZeeGrid. If no column is selected, this message will return -1.
  ##
  ## Return Values:
  ##  The currently selected column is returned. If no column is currently selected, the message returns -1.
  #
  # wParam = 0;       //not used; must be 0
  # lParam = 0;       //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETSELECTEDCOL, 0, 0))

proc getSelectedRow*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETSELECTEDROW message to get the currently selected row in the ZeeGrid. If no row is selected, this message will return -1.
  ##
  ## Return Values:
  ##  The currently selected row number is returned. If no row is currently selected, the message returns -1.
  #
  # wParam = 0;       //not used; must be 0
  # lParam = 0;       //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETSELECTEDROW, 0, 0))

proc getSizeOfCell*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETSIZEOFCELL to get the size of the data structure (in bytes) of a ZeeGrid cell.
  ##
  ## Return Values:
  ##  The size (in bytes) of the ZeeGrid cell data structure.
  ##
  ## Remarks:
  ##  This value multiplied by the number of cells allocated plus the size of the grid is the total number of bytes of memory required for the ZeeGrid. 
  ##  This does not include the memory required for the actual display contents (the text) of the cells.
  #
  # wParam = 0;       //not used; must be 0
  # lParam = 0;       //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETSIZEOFCELL, 0, 0))

proc getSizeOfGrid*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETSIZEOFGRID to get the size of the data structure (in bytes) of a ZeeGrid.
  ##
  ## Return Values:
  ##  The size (in bytes) of the ZeeGrid data structure.
  ##
  ## Remarks:
  ##  This is the ZeeGrid overhead for every ZeeGrid window in your application. It is this value, plus the size of the zeegrid cell * the number of cells 
  ##  allocated that determines the minimum amount of memory allocated to a particular ZeeGrid. This does not include the memory required to hold the text 
  ##  strings displayed in the cells.
  #
  # wParam = 0;       //not used; must be 0
  # lParam = 0;       //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETSIZEOFGRID, 0, 0))

proc getSortColumn*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETSORTCOLUMN to get the column that was double-clicked indicating that the user wants to sort the ZeeGrid.
  ##
  ## Return Values:
  ##  The column number that is being double-clicked to sort.
  ##
  ## Remarks:
  ##  This message is normally sent in response to a ZGN_SORT notification message from the ZeeGrid. 
  ##  Its purpose is to determine the column that is about to be sorted, so that the secondary sort column can be set programmatically. 
  ##  The application will recieve a ZGN_SORT notification if ZGM_SORTONCOLDCLICK is set to TRUE.
  #
  # wParam = 0;       //not used; must be 0
  # lParam = 0;       //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETSORTCOLUMN, 0, 0))

proc getToday*(self: wZeeGrid):string {.validate, inline.} = 
  ## Sends a ZGM_GETTODAY message to get the current day's julian date and string representation in 'YYYY/MM/DD' format.
  ##
  ## Parameters:
  ##  lpszString
  ##    The value of lParam. The current date is converted to text in the 'YYYY/MM/DD' form and returned in the string pointed to by lParam.
  ##    The string must be previously allocated and have a minimum length of 11 characters. 
  ##    Failure to preallocate this string will result in undefined behavior, possibly resulting in data loss and/or program crash.
  ##
  ## Return Values:
  ##  This message returns TRUE if the date in the internal date register is valid, otherwise it returns FALSE.
  #
  # wParam = 0;                      //not used; must be 0
  # lParam = (LPARAM) lpszString;    //pointer to string to return today's date as text in 'YYYY/MM/DD' format
  var lpszString = newString(11)
  SendMessage(self.mHwnd, ZGM_GETTODAY, 0, &lpszString)
  return lpszString

proc getTopRow*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_GETTOPROW message retrieve the row number of the first displayed row in the ZeeGrid.
  ##
  ## Return Values:
  ##  The row number of the first displayed (top) row in the ZeeGrid.
  #
  # wParam = 0;       //not used; must be 0
  # lParam = 0;       //not used; must be 0
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETTOPROW, 0, 0))

proc getWOY*(self: wZeeGrid, iJulianDate:int):int {.validate, inline.} = 
  ## Sends a ZGM_GETWOY message to get the week of the year for the given julian date.
  ##
  ## Parameters:
  ##  iJulianDate
  ##    The value of lParam. A julian date value. Valid values are in the range of [1..3068037].
  ##
  ## Return Values:
  ##  This message returns the week of the year that the given date is in. 
  ##  If the julian date specified in lParam is valid, the return value will be in the range of [1..53]. 
  ##  If the julian date specified in lParam is not valid, this message will return 0. Weeks begin on Sunday and end on Saturday. 
  ##  If the return value is 53, that day really falls in the first week of the next calendar year, 
  ##  but it is in the 53rd week of the year of the date in question.
  #
  # wParam = 0;                          //not used; must be 0
  # lParam = (LPARAM)(int) iJulianDate;  //julian date
  result = cast[int](SendMessage(self.mHwnd, ZGM_GETWOY, 0, iJulianDate))

proc goToCell*(self: wZeeGrid, iCellIndex:int, bFlag:bool) {.validate, inline.} = 
  ## Sends a ZGM_GOTOCELL message to programmatically scroll to the specified cell.
  ##
  ## Parameters:
  ##  iCellIndex
  ##    The value of lParam. A julian date value. Valid values are in the range of [1..3068037].
  ##  
  ##  bFlag
  ##    The value of lParam. A value of TRUE will perform a horizontal scroll if needed to put the referenced cell in the 
  ##    first non-fixed display column of the page. A value of FALSE will only perform the vertical scroll necessary to 
  ##    display the specified cell on the page.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;      //cell index
  # lParam = (LPARAM)(BOOL) bFlag;          //scroll to column
  SendMessage(self.mHwnd, ZGM_GOTOCELL, iCellIndex, bFlag) 

proc goToFirstOnSearch*(self: wZeeGrid, fEnable:bool = false) {.validate, property.} = 
  ## Sends a ZGM_GOTOFIRSTONSEARCH message to enable or disable the movement of the cursor to the first match 
  ## when the [Enter] key is pressed after typing the string to search for in the search edit control.
  ##
  ## Parameters:
  ##  fEnable
  ##    Value of wParam. Specifies whether to enable or disable the movement of the grid cursor to the first match after [Enter] is pressed from the search edit control.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  GOTO_FIRST_ON_SEARCH is disabled (FALSE) by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_GOTOFIRSTONSEARCH, fEnable, 0) 

proc grayBGOnLostFocus*(self: wZeeGrid, fEnable:bool = false) {.validate, property.} = 
  ## Sends a ZGM_GRAYBGONLOSTFOCUS message to enable or disable the graying of a ZeeGrid that has lost the keyboard input focus.
  ##
  ## Parameters:
  ##  fEnable
  ##    Value of wParam. A value of TRUE will enable graying of the ZeeGrid background colors when it loses the keyboard input focus. 
  ##    A value of FALSE will display the ZeeGrid background colors as normal when the ZeeGrid loses the keyboard input focus.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  Graying of ZeeGrids that have lost the keyboard input focus is disabled by default..
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_GRAYBGONLOSTFOCUS, fEnable, 0) 

proc highlightCursorRow*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_HIGHLIGHTCURSORROW message to enable or disable the highlighting of the row of the cursor.
  ##
  ## Parameters:
  ##  fEnable
  ##    Value of wParam. Specifies whether to enable or disable highlighting of the cursor row. 
  ##    A value of TRUE enables cursor row highlighting; a value of FALSE disables cursor row highlighting.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  If cursor row highlighting is disabled, cursor row highlighting in fixed columns (ZGM_HIGHLIGHTCURSORROWINFIXEDCOLUMNS) is disabled.
  ##  Cursor row highlighting is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_HIGHLIGHTCURSORROW, fEnable, 0) 

proc highlightCursorRowInFixedColumns*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_HIGHLIGHTCURSORROWINFIXEDCOLUMNS message to enable or disable the highlighting of the row of the cursor in fixed columns.
  ##
  ## Parameters:
  ##  fEnable
  ##    Value of wParam. Specifies whether to enable or disable highlighting of the cursor row in fixed columns. 
  ##    A value of TRUE enables cursor row highlighting in fixed columns; a value of FALSE disables cursor row highlighting in fixed columns.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  If cursor row highlighting (ZGM_HIGHLIGHTCURSORROW)is disabled, cursor row highlighting in fixed columns is disabled.
  ##  Cursor row highlighting in fixed columns is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_HIGHLIGHTCURSORROWINFIXEDCOLUMNS, fEnable, 0) 

proc insertRow*(self: wZeeGrid, iRow:int):int {.validate, inline.} = 
  ## Sends a ZGM_INSERTROW message to insert a row before the specified row in the ZeeGrid. The specified row must already be present in the ZeeGrid.
  ##
  ## Parameters:
  ##  iRow
  ##    The value of wParam. The row number to insert. This row must exist in the ZeeGrid for this message to succeed.
  ##
  ## Return Values:
  ##  The ZeeGrid cell index of the cell in the first column of the inserted row.
  #
  # wParam = (WPARAM)(int) iRow;        //row number to insert
  # lParam = 0;                         //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_INSERTROW, iRow, 0))

proc interpretBool*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_INTERPRETBOOL message to enable or disable the interpretation of the text 'TRUE' and 'FALSE' 
  ## as boolean when entered from an editable cell by the user, or programmatically entered into the cell with the ZGM_SETCELLTEXT message.
  ##
  ## Parameters:
  ##  fEnable
  ##    Value of wParam. Specifies whether to enable or disable the interpretation of entered text as boolean 'TRUE' and 'FALSE'. 
  ##    If enabled and the text 'TRUE' is entered in a cell, ZeeGrid will display that cell as a checked checkbox. If disabled, 
  ##    the text will be displayed literally as 'TRUE'.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  Interpret boolean is enabled by default.
  ##  When enabled, the entered text is converted to uppercase and tested for a match with 'TRUE' or 'FALSE'. Therefore, 
  ##  the text strings 'True','trUE', and 'TrUe' would all be interpreted as boolean.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_INTERPRETBOOL, fEnable, 0) 

proc interpretDates*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_INTERPRETDATES message to enable or disable the interpretation of text as a date when entered 
  ## from an editable cell by the user, or programmatically entered into the cell with the ZGM_SETCELLTEXT message.
  ##
  ## Parameters:
  ##  fEnable
  ##    Value of wParam. Specifies whether to enable or disable the interpretation of entered text as a date. 
  ##    If enabled and the text '12/28/58' is entered in a cell, ZeeGrid will display that cell as a date text string, 
  ##    for instance 'December 28, 1958', and right justify it in the cell. If disabled, the text will be displayed literally as '12/28/58'.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  Interpret dates is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_INTERPRETDATES, fEnable, 0) 

proc interpretNumeric*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_INTERPRETNUMERIC message to enable or disable the interpretation of text as a numeric value when entered from an 
  ## editable cell by the user, or programmatically entered into the cell with the ZGM_SETCELLTEXT message.
  ##
  ## Parameters:
  ##  fEnable
  ##    Value of wParam. Specifies whether to enable or disable the interpretation of entered text as numeric values. 
  ##    If enabled and the text '3.145' is entered in a cell, ZeeGrid will display that cell as a right justified numeric value. 
  ##    If disabled, the text will be displayed as a left justified text string '3.145'.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  Interpret numeric is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_INTERPRETNUMERIC, fEnable, 0) 

proc isDateValid*(self: wZeeGrid, lpszString:string):int {.validate, inline.} = 
  ## Sends a ZGM_ISDATEVALID message to test the validity of a date represented as a null-terminated character string.
  ##
  ## Parameters:
  ##  lpszString
  ##    The value of lParam. A null-terminated string containing the text representation of a date. This text can be in many date formats.
  ##    For example, the date 12/28/1958 could be represented in string form as '1958/12/28', '12/28/58', '12/28/1958', 'Dec 28, 1958', or 'December 28, 1958'
  ##    Valid dates range from 1/1/1600 to 12/31/9999.
  ##    This fuction also tests for a valid number of days for a given month.
  ##
  ## Return Values:
  ##  This message returns the julian date of the date represented in the text string in lParam if it is a valid date. 
  ##  If it is not a valid date, the message returns 0.
  #
  # wParam = 0;                          //not used; must be 0
  # lParam = (LPARAM) lpszString;        //pointer to string representation of a date
  result = cast[int](SendMessage(self.mHwnd, ZGM_ISDATEVALID, &lpszString, 0))

proc isGridDirty*(self: wZeeGrid, fEnable:bool = false):bool {.validate, inline.} = 
  ## Sends a ZGM_ISGRIDDIRTY to determine if a value or an attribute of the grid has been changed.
  ##
  ## Parameters:
  ##  fEnable
  ##    Value of wParam. A value of TRUE resets the "DIRTY" flag. A value of FALSE leaves the "DIRTY" flag in its current state.
  ##
  ## Return Values:
  ##  A boolean value indicating whether or not the grid is "dirty". A dirty grid means that a value or attribute of the grid has 
  ##  changed and a grid save operation may be necessary.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  result = cast[bool](SendMessage(self.mHwnd, ZGM_ISGRIDDIRTY, fEnable, 0))

proc keep3DOnLostFocus*(self: wZeeGrid, fEnable:bool = false) {.validate, property.} = 
  ## Sends a ZGM_KEEP3DONLOSTFOCUS message to enable or disable the changing of column headers from 3D to flat when ZeeGrid has lost the input focus.
  ##
  ## Parameters:
  ##  fEnable
  ##    Value of wParam. A value of TRUE will keep the column headers and row numbers column displaying in 3D when it loses the keyboard input focus.
  ##    A value of FALSE will display the column headers and row numbers column as flat when ZeeGrid loses the input focus.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  By default, the column headers and row numbers column will display as flat when input focus is lost. 
  ##  You need to only use this message when you want to change the default behavior of the ZeeGrid.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_KEEP3DONLOSTFOCUS, fEnable, 0)

proc loadGrid*(self: wZeeGrid, lpszString:string) {.validate, inline.} = 
  ## Sends a ZGM_LOADGRID message to load a ZeeGrid from a file. The file must have been created with the ZGM_SAVEGRID message.
  ##
  ## Parameters:
  ##  lpszString
  ##   The value of lParam. The address of a string specifying the path and filename to load.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = 0;                       //not used; must be zero
  # lParam = (LPARAM) lpszString;     //address of string specifying the filename to load
  SendMessage(self.mHwnd, ZGM_LOADGRID, 0, &lpszString)

proc loadIcon*(self: wZeeGrid, iIPIndex:int, wIcon:wIcon) {.validate, inline.} = 
  ## Sends a ZGM_LOADICON message to load an icon handle (HICON) into the specified index of the ZeeGrid icon palette.
  ##
  ## Parameters:
  ##  iIPIndex
  ##    The value of wParam. The icon palette index to load the icon handle.
  ##
  ##  wIcon
  ##    The value of lParam. The handle to the icon (HICON) that is to be loaded into the ZeeGrid icon palette.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iIPIndex;    //Icon palette index
  # lParam = (LPARAM)(HICON) hIcon;     //icon handle

  SendMessage(self.mHwnd, ZGM_LOADICON, iIPIndex, wIcon.mHandle)

proc markText*(self: wZeeGrid, lpszString:string):int {.validate, inline.} = 
  ## Sends a ZGM_MARKTEXT to mark the text that contains the given string.
  ##
  ## Parameters:
  ##  lpszString
  ##   The value of lParam. The address of a string to match in the grid cells.
  ##
  ## Return Values:
  ##  The number of cells that matched the text in lpstring.
  ##
  ## Remarks:
  ##  The return value indicates the number of matches in visible cells. 
  ##  Cells that match the text but are in columns that are sized to a width of zero will not be marked, and are not returned in the match count.
  #
  # wParam = 0;                      //not used; must be zero
  # lParam = (LPARAM) lpszString;    //address of string to match
  result = cast[int](SendMessage(self.mHwnd, ZGM_MARKTEXT, 0, &lpszString))


proc mergeRows*(self: wZeeGrid, fEnable:bool = false) {.validate, inline.} = 
  ## Sends a ZGM_MERGEROWS message to enable or disable the merging of consecutive rows of identical data 
  ## in fixed columns to display as a single cell.
  ##
  ## Parameters:
  ##  fEnable
  ##    Value of wParam. Specifies whether to enable or disable the merging of identical cells in fixed columns.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  Merge rows is disabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_MERGEROWS, fEnable, 0)

proc print*(self: wZeeGrid) {.validate, inline.} = 
  ## Sends a ZGM_PRINT message to print the ZeeGrid data.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  This message will initiate the common dialog print selection just as though the user had clicked the print button on the toolbar.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  SendMessage(self.mHwnd, ZGM_PRINT, 0, 0) 

proc queryBuild*(self: wZeeGrid, fFlag:bool = false): int {.validate, inline.} = 
  ## Sends a ZGM_QUERYBUILD to get the ZeeGrid DLL build number.
  ##
  ## Parameters:
  ##   fFlag
  ##    Value of wParam. A value of TRUE will display the ZeeGrid DLL build number in an internal MessageBox. 
  ##    A value of FALSE will cause the message to operate in "silent" mode. That is, the MessageBox will not be displayed.
  ##
  ## Return Values:
  ##  The ZeeGrid DLL build number.
  ##
  ## Remarks:
  ##  This message is used so that an application can be sure that it is not using a ZeeGrid DLL of a build prior to the 
  ##  build with which the application was developed. Build numbers are essentially ZeeGrid DLL version numbers.
  #
  # wParam = (WPARAM) (BOOL) fFlag;  //show MessageBox flag
  # lParam = 0;                      //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_QUERYBUILD, fFlag, 0))

proc refreshGrid*(self: wZeeGrid) {.validate, inline.} = 
  ## Sends a ZGM_REFRESHGRID to force a repaint of the ZeeGrid client area.
  ##
  ## Return Values:
  ##  A grid refresh is needed after programmatically setting visible cell text or attributes.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  SendMessage(self.mHwnd, ZGM_REFRESHGRID, 0, 0) 

proc saveGrid*(self: wZeeGrid, lpszString:string) {.validate, inline.} = 
  ## Sends a ZGM_SAVEGRID message to save a ZeeGrid from to a file. 
  ## The saved file can then be loaded at a later time with the ZGM_LOADGRID message.
  ##
  ## Parameters:
  ##  lpszString
  ##    The value of lParam. The address of a string specifying the path and filename to save the ZeeGrid to.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = 0;                      //not used; must be zero
  # lParam = (LPARAM) lpszString;    //address of string specifying the filename to save
  SendMessage(self.mHwnd, ZGM_SAVEGRID, 0, &lpszString) 

proc scrollDown*(self: wZeeGrid, iRows:int) {.validate, inline.} = 
  ## Sends a ZGM_SCROLLDOWN message to programmatically scroll the ZeeGrid down the specified number of rows.
  ##
  ## Parameters:
  ##  iRows
  ##    Value of wParam. This specifies the number of rows to scroll down.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iRows;      //number of rows to scroll 
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SCROLLDOWN, iRows, 0) 

proc scrollLeft*(self: wZeeGrid, iCols:int) {.validate, inline.} = 
  ## Sends a ZGM_SCROLLLEFT message to programmatically scroll the ZeeGrid left the specified number of columns.
  ##
  ## Parameters:
  ##  iCols
  ##    Value of wParam. This specifies the number of columns to scroll left.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCols;      //number of columns to scroll 
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SCROLLLEFT, iCols, 0) 

proc scrollRight*(self: wZeeGrid, iCols:int) {.validate, inline.} = 
  ## Sends a ZGM_SCROLLRIGHT message to programmatically scroll the ZeeGrid right the specified number of columns.
  ##
  ## Parameters:
  ##  iCols
  ##    Value of wParam. This specifies the number of columns to scroll right.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCols;      //number of columns to scroll 
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SCROLLRIGHT, iCols, 0) 

proc scrollUp*(self: wZeeGrid, iRows:int) {.validate, inline.} = 
  ## Sends a ZGM_SCROLLUP message to programmatically scroll the ZeeGrid up the specified number of rows.
  ##
  ## Parameters:
  ##  iRows
  ##    Value of wParam. This specifies the number of rows to scroll up.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iRows;      //number of rows to scroll 
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SCROLLUP, iRows, 0) 

proc searchEachKeyStroke*(self: wZeeGrid, fEnable:bool = true) {.validate, property.} = 
  ## Sends a ZGM_SEARCHEACHKEYSTROKE message to enable or disable the option in the 
  ## search panel for the ZeeGrid to be searched for matches on each keystroke in the "find" edit control.
  ##
  ## Parameters:
  ##  fEnable
  ##    Value of wParam. Specifies whether to enable or disable the searching of the ZeeGrid on each keystroke in 
  ##    the "find" edit control in the search panel.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  Search each keystroke is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SEARCHEACHKEYSTROKE, fEnable, 0) 

proc selectColumn*(self: wZeeGrid, iCol:int) {.validate, inline.} = 
  ## Sends a ZGM_SELECTCOLUMN message to programmatically select a ZeeGrid column. 
  ## This is done manually by the user by clicking in the column header.
  ##
  ## Parameters:
  ##  iCol
  ##    The value of wParam. The column number to select.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCol;        //column number to select
  # lParam = 0;                         //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SELECTCOLUMN, iCol, 0) 

proc selectRow*(self: wZeeGrid, iRow:int) {.validate, inline.} = 
  ## Sends a ZGM_SELECTROW message to programmatically select a ZeeGrid row. 
  ## This is done manually by the user by clicking in the row number column (if displayed).
  ##
  ## Parameters:
  ##  iRow
  ##    The value of wParam. The row number to select.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iRow;        //row number to select
  # lParam = 0;                         //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SELECTROW, iRow, 0) 

proc setAutoIncreaseSize*(self: wZeeGrid, iIncreaseSize:int) {.validate, inline.} = 
  ## Sends a ZGM_SETAUTOINCREASESIZE message to set the number of rows that are allocated for
  ## the ZeeGrid when it needs to expand to hold more rows.
  ##
  ## Parameters:
  ##  iIncreaseSize
  ##    The value of wParam. The number of rows to increase allocated memory by when the ZeeGrid needs to expand for additional rows.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iIncreaseSize;  //number of rows to increase in memory allocation
  # lParam = 0;                            //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETAUTOINCREASESIZE, iIncreaseSize, 0) 

proc setBackgroundBitmap*(self: wZeeGrid, hBitmap:int) {.validate, inline.} = 
  ## Sends a ZGM_SETBACKGROUNDBITMAP message to set a background bitmap for the ZeeGrid. 
  ## The default background color must be set to color index 17 to make the background of the cells paint with a NULL_BRUSH. 
  ## The user supplied bitmap is stretched to fit the background area of the ZeeGrid control.
  ##
  ## Parameters:
  ##  hBitmap
  ##    The value of lParam. This is a handle to a bitmap to be used for the ZeeGrid background.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  The application is responsible for loading the bitmap, and destroying it upon application exit. 
  ##  The bitmap must remain valid for the life of the ZeeGrid using it.
  #
  # wParam = 0;                       //not used; must be zero
  # lParam = (LPARAM)hBitmap;         //handle to bitmap
  SendMessage(self.mHwnd, ZGM_SETBACKGROUNDBITMAP, 0, hBitmap) 

proc setCellBColor*(self: wZeeGrid, iCellIndex:int, iCPIndex:int) {.validate, inline.} = 
  ## Sends a ZGM_SETCELLBCOLOR message to set the background color of the specified cell in the ZeeGrid.
  ##
  ## Parameters:
  ##  iCellIndex
  ##    The value of wParam. The cell index to set the background color.
  ##
  ##  iCPIndex
  ##    The value of lParam. The color index to set the cell background color to. 
  ##    Valid color index numbers are in the range of [0..127].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = (LPARAM)(int) iCPIndex;     //Color palette index
  SendMessage(self.mHwnd, ZGM_SETCELLBCOLOR, iCellIndex, iCPIndex) 

proc setCellFColor*(self: wZeeGrid, iCellIndex:int, iCPIndex:int) {.validate, inline.} = 
  ## Sends a ZGM_SETCELLFCOLOR message to set the background color of the specified cell in the ZeeGrid.
  ##
  ## Parameters:
  ##  iCellIndex
  ##    The value of wParam. The cell index to set the background color.
  ##
  ##  iCPIndex
  ##    The value of lParam. The color index to set the cell background color to. 
  ##    Valid color index numbers are in the range of [0..127].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = (LPARAM)(int) iCPIndex;     //Color palette index
  SendMessage(self.mHwnd, ZGM_SETCELLFCOLOR, iCellIndex, iCPIndex) 

proc setCellCDate*(self: wZeeGrid, iCellIndex: int, lpszString: string = ""):int {.validate, inline.} = 
  ## Sends a ZGM_SETCELLCDATE message to set the specified cell in the ZeeGrid to the date specified by the null-terminated string in lParam.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The index of the ZeeGrid cell.
  ##
  ##    lpszString
  ##      The value of lParam. A null-terminated string containing the text representation of a date. This text can be in many date formats.
  ##      For example, the date 12/28/1958 could be represented in string form as '1958/12/28', '12/28/58', '12/28/1958', 'Dec 28, 1958', or 'December 28, 1958'
  ##      Valid dates range from 1/1/1600 to 12/31/9999.
  ##
  ## Return Values:
  ##  If the string representation of the date specified in lParam can be deciphered into a valid date, the message will return the julian date of the specified string date.
  #
  # wParam = (WPARAM)(int) iCellIndex;        //ZeeGrid cell index
  # lParam = (LPARAM) lpszString;             //pointer to string representation of a date
  result = cast[int](SendMessage(self.mHwnd, ZGM_SETCELLCDATE, iCellIndex, &lpszString))

proc setCellDouble*(self: wZeeGrid, iCellIndex: int, lpDoubleValue: float = 0.00) {.validate, inline.} = 
  ## Sends a ZGM_SETCELLDOUBLE message to set the double value of the specified cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The ZeeGrid cell index.
  ##
  ##    lpDoubleValue
  ##      The value of lParam. A pointer to a double.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;        //ZeeGrid cell index
  # lParam = (LPARAM) lpDoubleValue;          //pointer to double
  var f: float = lpDoubleValue
  SendMessage(self.mHwnd, ZGM_SETCELLDOUBLE, iCellIndex, addr f)

proc setCellEdit*(self: wZeeGrid, iCellIndex: int, iEdit: int) {.validate, property.} = 
  ## Sends a ZGM_SETCELLEDIT message to set the edit attribute value of the specified cell in the ZeeGrid.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The cell index to set the edit attribute value.
  ##
  ##    iEdit
  ##      The value of lParam. The edit attribute value to set the specified cell to. Valid edit attribute values are in the range of [0..4]. 
  ##        0 = cell is not editable, or readonly
  ##        1 = editable with a text edit box
  ##        2 = editable with a droplist combo box
  ##        3 = boolean value and is editable by double-clicking the cell to change the boolean state from TRUE to FALSE or vice versa
  ##        4 = editable with date picker common control
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = (LPARAM)(int) iEdit;        //Edit attribute value
  SendMessage(self.mHwnd, ZGM_SETCELLEDIT, iCellIndex, iEdit)

proc setCellFont*(self: wZeeGrid, iCellIndex: int, iFPIndex: int) {.validate, property.} = 
  ## Sends a ZGM_SETCELLFONT message to set the font of the specified cell in the ZeeGrid.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The cell index to set the font index value.
  ##
  ##    iFPIndex
  ##      The value of lParam. Valid values are in the range of [0..127].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = (LPARAM)(int) iFPIndex;     //Font palette index
  SendMessage(self.mHwnd, ZGM_SETCELLFONT, iCellIndex, iFPIndex)

proc setCellFormat*(self: wZeeGrid, iCellIndex: int, iValue: int) {.validate, property.} = 
  ## Sends a ZGM_SETCELLFORMAT message to set the format value of the specified cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The ZeeGrid cell index.
  ##
  ##    iValue
  ##      The value of lParam. The value to set the cell format attribute.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;        //ZeeGrid cell index
  # lParam = (LPARAM)(int) iValue;            //format value
  SendMessage(self.mHwnd, ZGM_SETCELLFORMAT, iCellIndex, iValue)

proc setCellIcon*(self: wZeeGrid, iCellIndex: int, iIPIndex: int) {.validate, property.} = 
  ## Sends a ZGM_SETCELLICON message to set the icon of the specified cell in the ZeeGrid.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The ZeeGrid cell index.
  ##
  ##    iIPIndex
  ##      The value of lParam. Valid values are in the range of [0..127].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = (LPARAM)(int) iIPIndex;     //Icon palette index
  SendMessage(self.mHwnd, ZGM_SETCELLICON, iCellIndex, iIPIndex)

proc setCellInt*(self: wZeeGrid, iCellIndex: int, lpIntValue: int = 0) {.validate, inline.} = 
  ## Sends a ZGM_SETCELLINT message to set the integer value of the specified cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The ZeeGrid cell index.
  ##
  ##    lpIntValue
  ##      The value of lParam. A pointer to a integer.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;        //ZeeGrid cell index
  # lParam = (LPARAM) lpIntValue;             //pointer to integer
  var i: int = lpIntValue
  SendMessage(self.mHwnd, ZGM_SETCELLINT, iCellIndex, addr i)

proc setCellJDate*(self: wZeeGrid, iCellIndex: int, iJulianDate: int): bool {.validate, inline.} = 
  ## Sends a ZGM_SETCELLINT message to set the integer value of the specified cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The ZeeGrid cell index.
  ##
  ##    iJulianDate
  ##      The value of lParam. The julian date where 1 = 'January 1, 1600' and 3068037 = 'December 31, 9999'. 
  ##      Values less than or equal to 0 are invalid julian dates.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = (LPARAM)(int) iJulianDate;  //julian date
  result = cast[bool](SendMessage(self.mHwnd, ZGM_SETCELLJDATE, iCellIndex, iJulianDate))

proc setCellJustify*(self: wZeeGrid, iCellIndex: int, iJustify: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCELLJUSTIFY message to set the text justification of the specified cell in the ZeeGrid.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The ZeeGrid cell index.
  ##
  ##    iJustify
  ##      The value of lParam. Valid values are in the range of [0..8].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //ZeeGrid cell index
  # lParam = (LPARAM)(int) iJustify;     //Justification value
  SendMessage(self.mHwnd, ZGM_SETCELLJUSTIFY, iCellIndex, iJustify)

proc setCellMark*(self: wZeeGrid, iCellIndex: int, iMark: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCELLMARK message to set the mark attribute of the specified cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The ZeeGrid cell index.
  ##
  ##    iMark
  ##      The value of lParam. The mark attribute value to set the specified cell.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = (LPARAM)(int) iMark;        //Cell mark attribute
  SendMessage(self.mHwnd, ZGM_SETCELLMARK, iCellIndex, iMark)

proc setCellNumPrecision*(self: wZeeGrid, iCellIndex: int, iValue: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCELLNUMPRECISION message to set the precision (number of decimal places displayed) of the double value of the specified cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The ZeeGrid cell index.
  ##
  ##    iValue
  ##      The value of lParam. The value to set the cell number precision.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;        //ZeeGrid cell index
  # lParam = (LPARAM)(int) iValue;            //precision value
  SendMessage(self.mHwnd, ZGM_SETCELLNUMPRECISION, iCellIndex, iValue)

proc setCellNumWidth*(self: wZeeGrid, iCellIndex: int, iValue: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCELLNUMWIDTH message to set the width (leading padding spaces) of the value of the specified cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The ZeeGrid cell index.
  ##
  ##    iValue
  ##      The value of lParam. The value to set the cell number width.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;        //ZeeGrid cell index
  # lParam = (LPARAM)(int) iValue;            //number width value
  SendMessage(self.mHwnd, ZGM_SETCELLNUMWIDTH, iCellIndex, iValue)

proc setCellRestriction*(self: wZeeGrid, iCellIndex: int, iRestriction: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCELLRESTRICTION to programmatically set a cell's restriction value. 
  ## Restrictions perform numeric data entry validation, allowing only valid characters per the restriction to be entered.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The ZeeGrid cell index.
  ##
  ##    iRestriction
  ##      The value of lParam. The data restriction attribute value to set the specified cell. Valid values are in the range of [0..4].
  ##      The restriction values are defined as follows:
  ##       0 = No Restriction
  ##       1 = Signed Integer
  ##       2 = Unsigned Integer
  ##       3 = Signed Double
  ##       4 = Unsigned Double
  ##
  ## Return Values:
  ##  This message does not return a value.
  ## 
  ## Remarks:
  ##  A restriction only restricts the characters allowed to be entered into a cell by manual keyboard input. 
  ##  If a paste operation is performed on restricted cells, the restriction will apply and the paste operation may not be able to be completed fully.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = (LPARAM)(int) iRestriction; //Cell restriction value
  SendMessage(self.mHwnd, ZGM_SETCELLRESTRICTION, iCellIndex, iRestriction)

proc setCellText*(self: wZeeGrid, iCellIndex: int, lpszString: string = "") {.validate, inline.} = 
  ## Sends a ZGM_SETCELLTEXT message to set the text of the specified cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The ZeeGrid cell index.
  ##
  ##    lpszString
  ##      The value of lParam. A pointer to a string.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;        //ZeeGrid cell index
  # lParam = (LPARAM) lpszString;             //pointer to string
  SendMessage(self.mHwnd, ZGM_SETCELLTEXT, iCellIndex, &lpszString)

proc setCellType*(self: wZeeGrid, iCellIndex: int, iType: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCELLTYPE to programmatically set a cell's data type.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The ZeeGrid cell index.
  ##
  ##    iType
  ##      The value of lParam. The data type attribute value to set the specified cell. 
  ##      Valid values are in the range of [0..5].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = (LPARAM)(int) iType;        //Cell type attribute
  SendMessage(self.mHwnd, ZGM_SETCELLTYPE, iCellIndex, iType)

proc setColBColor*(self: wZeeGrid, iCol: int, iCPIndex: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLBCOLOR message to set the background color of every cell in the specified column of the ZeeGrid.
  ##
  ## Parameters:
  ##    iCol
  ##      The value of wParam. The ZeeGrid column number to set the background color. 
  ##      If this value is zero, the action is performed on all columns.
  ##
  ##    iCPIndex
  ##      The value of lParam. The color index to set the column background color to. 
  ##      Valid color index numbers are in the range of [0..127].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCol;         //ZeeGrid column
  # lParam = (LPARAM)(int) iCPIndex;     //Color palette index
  SendMessage(self.mHwnd, ZGM_SETCOLBCOLOR, iCol, iCPIndex)

proc setColEdit*(self: wZeeGrid, iCol: int, iEdit: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLEDIT message to set the edit attribute value of every cell in the specified column in the ZeeGrid.
  ##
  ## Parameters:
  ##    iCol
  ##      The value of wParam. The ZeeGrid column to set every cell the edit attribute value. 
  ##      If this value is zero, the action is performed on all columns.
  ##
  ##    iEdit
  ##      The value of lParam. The edit attribute value to set every cell in the specified ZeeGrid column to. 
  ##      Valid edit attribute values are in the range of [0..4]. A value of 0 means that the cell is not editable, or readonly. 
  ##      1 = editable with a text edit box
  ##      2 = editable with a droplist combo box
  ##      3 = boolean value and is editable by double-clicking the cell to change the boolean state from TRUE to FALSE or vice versa
  ##      4 = editable with the date picker common control
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCol;         //ZeeGrid column
  # lParam = (LPARAM)(int) iEdit;        //Edit attribute value
  SendMessage(self.mHwnd, ZGM_SETCOLEDIT, iCol, iEdit)

proc setColFColor*(self: wZeeGrid, iCol: int, iCPIndex: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLFCOLOR message to set the foreground color (text color) of every cell in the specified column of the ZeeGrid.
  ##
  ## Parameters:
  ##    iCol
  ##      The value of wParam. The ZeeGrid column number to set the foreground color. 
  ##      If this value is zero, the action is performed on all columns.
  ##
  ##    iCPIndex
  ##      The value of lParam. The color index to set the column foreground color to. 
  ##      Valid color index numbers are in the range of [0..127].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCol;         //ZeeGrid column
  # lParam = (LPARAM)(int) iCPIndex;     //Color palette index
  SendMessage(self.mHwnd, ZGM_SETCOLFCOLOR, iCol, iCPIndex)

proc setColFont*(self: wZeeGrid, iCol: int, iFPIndex: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLFONT message to set the font of every cell in the specified column in the ZeeGrid.
  ##
  ## Parameters:
  ##    iCol
  ##      The value of wParam. The ZeeGrid column to set every cell the font index value.
  ##      If this value is zero, the action is performed on all columns.
  ##
  ##    iFPIndex
  ##      The value of lParam. Valid values are in the range of [0..127].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCol;         //ZeeGrid column
  # lParam = (LPARAM)(int) iFPIndex;     //Font palette index
  SendMessage(self.mHwnd, ZGM_SETCOLFONT, iCol, iFPIndex)

proc setColFormat*(self: wZeeGrid, iCol: int, iValue: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLFORMAT message to set the format value of the cells in the specified column.
  ##
  ## Parameters:
  ##    iCol
  ##      The value of wParam. The ZeeGrid column number.
  ##      If this value is zero, the action is performed on all columns.
  ##
  ##    iValue
  ##      The value of lParam. The value to set the cell format for every cell in the specified column.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCol;              //ZeeGrid column
  # lParam = (LPARAM)(int) iValue;            //format value
  SendMessage(self.mHwnd, ZGM_SETCOLFORMAT, iCol, iValue)

proc setColIcon*(self: wZeeGrid, iCol: int, iIPIndex: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLICON message to set the icon of every cell in the specified column in the ZeeGrid.
  ##
  ## Parameters:
  ##    iCol
  ##      The value of wParam. The ZeeGrid column to set every cell the icon index value. 
  ##      If this value is zero, the action is performed on all columns.
  ##
  ##    iIPIndex
  ##      The value of lParam. Valid values are in the range of [0..127].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCol;         //ZeeGrid column
  # lParam = (LPARAM)(int) iIPIndex;     //Icon palette index
  SendMessage(self.mHwnd, ZGM_SETCOLICON, iCol, iIPIndex)

proc setColJustify*(self: wZeeGrid, iCol: int, iJustify: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLJUSTIFY message to set the text justification of every cell in the specified column in the ZeeGrid.
  ##
  ## Parameters:
  ##    iCol
  ##      The value of wParam. The ZeeGrid column to set every cell the text justification value.
  ##      If this value is zero, the action is performed on all columns.
  ##
  ##    iJustify
  ##      The value of lParam. Valid values are in the range of [0..8].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCol;         //ZeeGrid column
  # lParam = (LPARAM)(int) iJustify;     //Justification value
  SendMessage(self.mHwnd, ZGM_SETCOLJUSTIFY, iCol, iJustify)

proc setColMark*(self: wZeeGrid, iCol: int, iMark: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLMARK message to set the mark attribute of every cell in the the specified column(s).
  ##
  ## Parameters:
  ##    iCol
  ##      The value of wParam. The column number to set the mark attribute.
  ##      If this value is zero, the action is performed on all columns.
  ##
  ##    iMark
  ##      The value of lParam. The mark attribute value to set every cell in the column.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCol;         //Column number
  # lParam = (LPARAM)(int) iMark;        //Cell mark attribute
  SendMessage(self.mHwnd, ZGM_SETCOLMARK, iCol, iMark)

proc setColNumPrecision*(self: wZeeGrid, iCol: int, iValue: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLNUMPRECISION message to set the precision of the double values of the cells in the specified column.
  ##
  ## Parameters:
  ##    iCol
  ##      The value of wParam. The ZeeGrid column number. 
  ##      If this value is zero, the action is performed on all columns.
  ##
  ##    iValue
  ##      The value of lParam. The value to set the cell number precision for every cell in the specified column.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCol;              //ZeeGrid column
  # lParam = (LPARAM)(int) iValue;            //number precision value
  SendMessage(self.mHwnd, ZGM_SETCOLNUMPRECISION, iCol, iValue)

proc setColNumWidth*(self: wZeeGrid, iCol: int, iValue: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLNUMWIDTH message to set the width of the displayed value in the cells of the specified column.
  ##
  ## Parameters:
  ##    iCol
  ##      The value of wParam. The ZeeGrid column number. 
  ##      If this value is zero, the action is performed on all columns.
  ##
  ##    iValue
  ##      The value of lParam. The value to set the cell number width for every cell in the specified column.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCol;              //ZeeGrid column
  # lParam = (LPARAM)(int) iValue;            //number width value
  SendMessage(self.mHwnd, ZGM_SETCOLNUMWIDTH, iCol, iValue)

proc setColor*(self: wZeeGrid, iCPIndex: int, dwRGB: DWORD) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLOR message to set the RGB color value of the specified index of the ZeeGrid color palette.
  ##
  ## Parameters:
  ##    iCPIndex
  ##      The value of wParam. The index of the color palette to set the color.
  ##
  ##    dwRGB
  ##      The value of lParam. The RGB value to set the specified index of the ZeeGrid color palette.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCPIndex;  //Color palette index
  # lParam = (LPARAM)(DWORD)dwRGB ;   //RGB color value
  SendMessage(self.mHwnd, ZGM_SETCOLOR, iCPIndex, dwRGB)

proc setColRestriction*(self: wZeeGrid, iCol: int, iRestriction: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLRESTRICTION message to set the restriction value of every cell in the specified column in the ZeeGrid. 
  ## Restrictions perform numeric data entry validation, allowing only valid characters per the restriction to be entered.
  ##
  ## Parameters:
  ##    iCol
  ##      The value of wParam. The ZeeGrid column to set every cell the restriction value specified in lParam.
  ##      If this value is zero, the action is performed on all columns.
  ##
  ##    iRestriction
  ##      The value of lParam. The data restriction attribute value to set every cell in the the specified column. Valid values are in the range of [0..4].
  ##      The restriction values are defined as follows:
  ##       0 = No Restriction
  ##       1 = Signed Integer
  ##       2 = Unsigned Integer
  ##       3 = Signed Double
  ##       4 = Unsigned Double
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  A restriction only restricts the characters allowed to be entered into a cell by manual keyboard input. 
  ##  If a paste operation is performed on restricted cells, the restriction will apply and the paste operation may not be able to be completed fully.
  #
  # wParam = (WPARAM)(int) iCol;         //ZeeGrid column
  # lParam = (LPARAM)(int) iRestriction; //Restriction value
  SendMessage(self.mHwnd, ZGM_SETCOLRESTRICTION, iCol, iRestriction)

proc setColType*(self: wZeeGrid, iCol: int, iType: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLTYPE message to set the data type of every cell in the specified column in the ZeeGrid.
  ##
  ## Parameters:
  ##    iCol
  ##      The value of wParam. The ZeeGrid column to set every cell the data type value.
  ##      If this value is zero, the action is performed on all columns.
  ##
  ##    iType
  ##      The value of lParam. Valid values are in the range of [0..5].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCol;         //ZeeGrid column
  # lParam = (LPARAM)(int) iType;        //Type value
  SendMessage(self.mHwnd, ZGM_SETCOLTYPE, iCol, iType)

proc setColumnHeaderHeight*(self: wZeeGrid, iHeight: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLUMNHEADERHEIGHT message to set the minimum height of the column header row in pixels. 
  ## If iHeight is set to 0, no column headers are displayed. This also makes the grid columns unable to be resized or reordered by the user. 
  ## If the value of iHeight is greater than zero, the minimum height will be automatically calculated and set to contain the tallest column header title. 
  ## If iHeight is greater than the calculated height to contain the tallest column header title, the additional space is added to the top of the column headers.
  ## If the column header height is set to a value greater than 0, the minimum height will be automatically set to 20. 
  ## If the column header titles won't fit with the 20 pixel height, it will be automatically sized up to hold the title. 
  ## A value that is more than that required to contain the title will be respected.
  ##
  ## Parameters:
  ##    iHeight
  ##      The value of wParam. The number of pixels to set for the minumum column header height.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iHeight;  //minimum height in pixels to use for the column header row
  # lParam = 0;                      //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETCOLUMNHEADERHEIGHT, iHeight, 0)

proc setColumnOrder*(self: wZeeGrid, iElements: int, lpiArray: openArray[int]) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLUMNORDER message to programmatically set the display order of the ZeeGrid columns.
  ##
  ## Parameters:
  ##    iElements
  ##      The value of wParam. The number of elements in the integer array supplied in lParam.
  ##
  ##    lpiArray
  ##      The value of lParam. A pointer to an array of integers. This array defines the column display order. 
  ##      Each element of the array holds a valid ZeeGrid column number. 
  ##      The display order of the columns will be set to the order specified by the array.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iElements;      //number of elements in the array in lParam
  # lParam = (LPARAM) lpiArray;            //array of integers
  var arr = cast[pointer](unsafeAddr lpiArray)
  SendMessage(self.mHwnd, ZGM_SETCOLUMNORDER, iElements, arr)

proc setColWidth*(self: wZeeGrid, iCol: int, iWidth: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCOLWIDTH to programmatically set the width of the specified column in pixels.
  ##
  ## Parameters:
  ##    iCol
  ##      The value of wParam. The column number to set the width.
  ##
  ##    iWidth
  ##      The value of lParam. The width in pixels to set the specified column.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCol;         //Column number
  # lParam = (LPARAM)(int) iWidth;       //Width in pixels
  SendMessage(self.mHwnd, ZGM_SETCOLWIDTH, iCol, iWidth)

proc setCursorCell*(self: wZeeGrid, iCellIndex: int) {.validate, inline.} = 
  ## Sends a ZGM_SETCURSORCELL message to programmatically set the cursor cell.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The index of the ZeeGrid cell.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;      //cell index for cursor
  # lParam = 0;                             //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETCURSORCELL, iCellIndex, 0)

proc setDefaultBColor*(self: wZeeGrid, iCPIndex: int) {.validate, property.} = 
  ## Sends a ZGM_SETDEFAULTBCOLOR message to set the default background color of newly added cells to the ZeeGrid.
  ##
  ## Parameters:
  ##    iCPIndex
  ##      The value of wParam. The color palette index to set as the default background color for new cells.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCPIndex;    //color palette index to use for default cell background
  # lParam = 0;                         //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETDEFAULTBCOLOR, iCPIndex, 0)

proc setDefaultEdit*(self: wZeeGrid, iEdit: int) {.validate, property.} = 
  ## Sends a ZGM_SETDEFAULTEDIT message to set the default edit attribute of newly added cells to the ZeeGrid.
  ##
  ## Parameters:
  ##    iEdit
  ##      The value of wParam. The edit attribute value to assign to new cells by default.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iEdit;  //edit value to use for default
  # lParam = 0;                    //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETDEFAULTEDIT, iEdit, 0)

proc setDefaultFColor*(self: wZeeGrid, iCPIndex: int) {.validate, property.} = 
  ## Sends a ZGM_SETDEFAULTBCOLOR message to set the default foreground color of newly added cells to the ZeeGrid.
  ##
  ## Parameters:
  ##    iCPIndex
  ##      The value of wParam. The color palette index to set as the default foreground color for new cells.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCPIndex;    //color palette index to use for default cell foreground
  # lParam = 0;                         //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETDEFAULTFCOLOR, iCPIndex, 0)

proc setDefaultFont*(self: wZeeGrid, iFPIndex: int) {.validate, property.} = 
  ## Sends a ZGM_SETDEFAULTFONT message to set the default font of newly added cells to the ZeeGrid.
  ##
  ## Parameters:
  ##    iFPIndex
  ##      The value of wParam. The index of the font palette to assign to new cells by default.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iFPIndex;   //font palette index to use for default
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETDEFAULTFONT, iFPIndex, 0)

proc setDefaultIcon*(self: wZeeGrid, iIPIndex: int) {.validate, property.} = 
  ## Sends a ZGM_SETDEFAULTICON message to set the default icon attribute of newly added cells to the ZeeGrid.
  ##
  ## Parameters:
  ##    iIPIndex
  ##      The value of wParam. The index of the icon palette to assign to new cells by default.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iIPIndex;   //icon palette index to use for default
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETDEFAULTICON, iIPIndex, 0)

proc setDefaultJustify*(self: wZeeGrid, iJustify: int) {.validate, property.} = 
  ## Sends a ZGM_SETDEFAULTJUSTIFY message to set the default text justification of newly added cells to the ZeeGrid.
  ##
  ## Parameters:
  ##    iJustify
  ##      The value of wParam. The value of the justification attribute to assign to new cells by default.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iJustify;   //text justification to use for default
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETDEFAULTJUSTIFY, iJustify, 0)

proc setDefaultMark*(self: wZeeGrid, iMark: int) {.validate, property.} = 
  ## Sends a ZGM_SETDEFAULTMARK message to set the default mark attribute of newly added cells to the ZeeGrid.
  ##
  ## Parameters:
  ##    iMark
  ##      The value of wParam. The value of the mark attribute to assign to new cells by default.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iMark;  //mark value to use for default
  # lParam = 0;                    //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETDEFAULTMARK, iMark, 0)

proc setDefaultNumPrecision*(self: wZeeGrid, iPrecision: int) {.validate, property.} = 
  ## Sends a ZGM_SETDEFAULTNUMPRECISION message to set the default numeric precision of newly added cells to the ZeeGrid.
  ##
  ## Parameters:
  ##    iPrecision
  ##      The value of wParam. The value of the numeric precision attribute to assign to new cells by default.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iPrecision;   //numeric precision to use for default
  # lParam = 0;                          //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETDEFAULTNUMPRECISION, iPrecision, 0)

proc setDefaultNumWidth*(self: wZeeGrid, iNumWidth: int) {.validate, property.} = 
  ## Sends a ZGM_SETDEFAULTNUMWIDTH message to set the default numeric width of newly added cells to the ZeeGrid.
  ##
  ## Parameters:
  ##    iNumWidth
  ##      The value of wParam. The value of the numeric width attribute to assign to new cells by default.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iNumWidth;  //numeric width to use for default
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETDEFAULTNUMWIDTH, iNumWidth, 0)

proc setDefaultRestriction*(self: wZeeGrid, iRestriction: int) {.validate, property.} = 
  ## Sends a ZGM_SETDEFAULTRESTRICTION message to set the default restriction value of newly added cells to the ZeeGrid.
  ##
  ## Parameters:
  ##    iRestriction
  ##      The value of wParam. The value of the restriction attribute to assign to new cells by default.
  ##      Valid values are in the range of [0..4].
  ##      The restriction values are defined as follows:
  ##       0 = No Restriction
  ##       1 = Signed Integer
  ##       2 = Unsigned Integer
  ##       3 = Signed Double
  ##       4 = Unsigned Double
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  A restriction only restricts the characters allowed to be entered into a cell by manual keyboard input. 
  ##  If a paste operation is performed on restricted cells, the restriction will apply and the paste operation may not be able to be completed fully.
  #
  # wParam = (WPARAM)(int) iRestriction; //restriction value to use for default
  # lParam = 0;                          //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETDEFAULTRESTRICTION, iRestriction, 0)

proc setDefaultType*(self: wZeeGrid, iType: int) {.validate, property.} = 
  ## Sends a ZGM_SETDEFAULTTYPE message to set the default data type of newly added cells to the ZeeGrid.
  ##
  ## Parameters:
  ##    iType
  ##      The value of wParam. The value of the data type attribute to assign to new cells by default.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iType;      //data type to use for default
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETDEFAULTTYPE, iType, 0)

proc setEditText*(self: wZeeGrid, lpszString: string) {.validate, property.} = 
  ## Sends a ZGM_SETEDITTEXT message to set the text of the edit control used for incell editing.
  ##
  ## Parameters:
  ##    lpszString
  ##      The value of lParam. A pointer to a null-terminated string to load into the cell edit control.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = 0;                      //not used; must be zero
  # lParam = (LPARAM) lpszString;    //pointer to string
  SendMessage(self.mHwnd, ZGM_SETEDITTEXT, 0, &lpszString)

proc setFont*(self: wZeeGrid, iFPIndex: int, wFont: wFont) {.validate, property.} = 
  ## Sends a ZGM_SETFONT message to set the specified ZeeGrid entry in the font palette to the supplied font handle (HFONT).
  ##
  ## Parameters:
  ##    iFPIndex
  ##      The value of wParam. The index of the font palette to assign a font handle.
  ##
  ##    hFont
  ##      The value of lParam. The handle to the font (HFONT) to load into the ZeeGrid font palette.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iFPIndex;  //Font palette index
  # lParam = (LPARAM)(HFONT) hFont;   //handle to font

  SendMessage(self.mHwnd, ZGM_SETFONT, iFPIndex, wFont.mHandle)

proc setGridBGColor*(self: wZeeGrid, iCPIndex: int) {.validate, property.} = 
  ## Sends a ZGM_SETGRIDBGCOLOR message to set the grid background color to the specified ZeeGrid color palette entry.
  ##
  ## Parameters:
  ##    iCPIndex
  ##      The value of wParam. The index of the color palette.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  The grid background color is specifies the color of the grid body that is not occupied by grid cells. 
  ##  This is the area to the right of the rightmost column, and below the last row. 
  ##  This area will not gray when when grid has lost focus if using ZGM_GRAYBGONLOSTFOCUS.
  #
  # wParam = (WPARAM)(int) iCPIndex;     //index of the color palette to use for the grid background color
  # lParam = 0;                          //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETGRIDBGCOLOR, iCPIndex, 0)

proc setGridLineColor*(self: wZeeGrid, iCPIndex: int) {.validate, property.} = 
  ## Sends a ZGM_SETGRIDLINECOLOR message to set the gridline color to the specified ZeeGrid color palette entry.
  ##
  ## Parameters:
  ##    iCPIndex
  ##      The value of wParam. The index of the color palette.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCPIndex;     //index of the color palette to use for the grid background color
  # lParam = 0;                          //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETGRIDLINECOLOR, iCPIndex, 0)

proc setItemData*(self: wZeeGrid, iCellIndex: int, dwData: DWORD) {.validate, property.} = 
  ## Sends a ZGM_SETITEMDATA message to set a user supplied 32-bit value associated with the specified cell in the ZeeGrid.
  ##
  ## Parameters:
  ##    iCellIndex
  ##      The value of wParam. The cell index to set cell data value.
  ##
  ##    dwData
  ##      Value of lParam. Specifies the 32-bit value to be associated with the specified ZeeGrid cell.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex;   //Cell index
  # lParam = (LPARAM) dwData;            //Value to associate with specified cell
  SendMessage(self.mHwnd, ZGM_SETITEMDATA, iCellIndex, dwData)

proc setLeftIndent*(self: wZeeGrid, dwIndent: DWORD) {.validate, property.} = 
  ## Sends a ZGM_SETLEFTINDENT message to set the left indent of each cell in the ZeeGrid.
  ##
  ## Parameters:
  ##    dwIndent
  ##      Value of wParam. Specifies the number of pixels to indent cell contents from the left cell gridline.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##  
  ## Remarks:
  ##  The left indent is set to 2 pixels by default.
  ##  The left and right indent values are global indents. All cells will be indented by the specified number of pixels.
  #
  # wParam = (WPARAM) (DWORD) dwIndent;  //pixels to indent
  # lParam = 0;                          //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETLEFTINDENT, dwIndent, 0)

proc setLostFocusHighlightColor*(self: wZeeGrid, iCPIndex: int) {.validate, property.} = 
  ## Sends a ZGM_SETLOSTFOCUSHIGHTLIGHTCOLOR message to set the color index of the color palette to be used for displaying the highlight color when the ZeeGrid loses input focus.
  ##
  ## Parameters:
  ##    iCPIndex
  ##      The value of wParam. The index of the color palette to use for the highlight color when the ZeeGrid loses input focus.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##  
  ## Remarks:
  ##  By default, the highlight color is black for a ZeeGrid that has lost the input focus.
  #
  # wParam = (WPARAM)(int) iCPIndex;  //Color palette index
  # lParam = 0;                       //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETLOSTFOCUSHIGHLIGHTCOLOR, iCPIndex, 0)

proc setMarkText*(self: wZeeGrid, fEnable: bool) {.validate, property.} = 
  ## Sends a ZGM_SETMARKTEXT to enable or disable the display of marked text.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will cause all marked text cells to display in the marked text color. 
  ##      A value of FALSE will cause all marked cells to display without marking.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETMARKTEXT, fEnable, 0)

proc setPrintPointSize*(self: wZeeGrid, iPointSize: int) {.validate, property.} = 
  ## Sends a ZGM_SETPRINTPOINTSIZE message to set the printing font size.
  ##
  ## Parameters:
  ##    iPointSize
  ##      The value of wParam. The point size of the font to use when printing the ZeeGrid.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iPointSize;   //size of print font in points for printer output
  # lParam = 0;                          //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETPRINTPOINTSIZE, iPointSize, 0)

proc setRange*(self: wZeeGrid, iCellIndex1: int, iCellIndex2: int) {.validate, property.} = 
  ## Sends a ZGM_SETRANGE message to define a bounding block of cells and calculates the sum of all numeric type cells in the block. 
  ## The application must then use ZGM_GETRANGESUM to retrieve this sum.
  ##
  ## Parameters:
  ##    iCellIndex1
  ##      The value of wParam. The cell index of the ZeeGrid. This index is the first of two that defines a block of cells. 
  ##      The block can be in a single column, or span multiple columns. This cell index should be the cell that defines the upper left corner of the cell block.
  ##
  ##    iCellIndex2
  ##      The value of lParam. The cell index of the ZeeGrid. This index is the second of two that defines a block of cells. 
  ##      The block can be in a single column, or span multiple columns. This cell index should be the cell that defines the lower right corner of the cell block.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iCellIndex1;   //Cell index of the top left bounding block of cells
  # lParam = (LPARAM)(int) iCellIndex2;   //Cell index of the bottom right bounding block of cells
  SendMessage(self.mHwnd, ZGM_SETRANGE, iCellIndex1, iCellIndex2)

proc setRegCDate*(self: wZeeGrid, lpszString: string):int {.validate, property.} = 
  ## Sends a ZGM_SETREGCDATE message to set the internal date register in the ZeeGrid to the date specified by the null-terminated string in lParam.
  ##
  ## Parameters:
  ##    lpszString
  ##      The value of lParam. A null-terminated string containing the text representation of a date. This text can be in many date formats. 
  ##      For example, the date 12/28/1958 could be represented in string form as '1958/12/28', '12/28/58', '12/28/1958', 'Dec 28, 1958', or 'December 28, 1958'
  ##       Valid dates range from 1/1/1600 to 12/31/9999.
  ##
  ## Return Values:
  ##  This message returns the julian date if valid, otherwise it returns 0.
  #
  # wParam = 0;                     //not used; must be 0
  # lParam = (LPARAM) lpszString;   //pointer to string representation of a date
  result = cast[int](SendMessage(self.mHwnd, ZGM_SETREGCDATE, 0, &lpszString))

proc setRegJDate*(self: wZeeGrid, iJulianDate: int):int {.validate, property.} = 
  ## Sends a ZGM_SETREGJDATE message to set the internal date register in the ZeeGrid to the date specified by the julian date in lParam.
  ##
  ## Parameters:
  ##    iJulianDate
  ##      The value of lParam. The julian date where 1 = 'January 1, 1600' and 3068037 = 'December 31, 9999'. Values less than or equal to 0 are invalid julian dates.
  ##
  ## Return Values:
  ##  This message returns the julian date if valid, otherwise it returns 0.
  #
  # wParam = 0;                          //not used; must be 0
  # lParam = (LPARAM)(int) iJulianDate;  //julian date
  result = cast[int](SendMessage(self.mHwnd, ZGM_SETREGJDATE, iJulianDate, 0))

proc setRightIndent*(self: wZeeGrid, dwIndent: DWORD) {.validate, property.} = 
  ## Sends a ZGM_SETRIGHTINDENT message to set the right indent of each cell in the ZeeGrid.
  ##
  ## Parameters:
  ##    dwIndent
  ##      Value of wParam. Specifies the number of pixels to indent cell contents from the right cell gridline.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  The right indent is set to 2 pixels by default.
  ##  The left and right indent values are global indents. All cells will be indented by the specified number of pixels.
  #
  # wParam = (WPARAM) (DWORD) dwIndent;  //pixels to indent
  # lParam = 0;                          //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETRIGHTINDENT, dwIndent, 0)

proc setRowBColor*(self: wZeeGrid, iRow: int, iCPIndex: int) {.validate, property.} = 
  ## Sends a ZGM_SETROWBCOLOR message to set the background color of every cell in the specified row of the ZeeGrid.
  ##
  ## Parameters:
  ##    iRow
  ##      The value of wParam. The ZeeGrid row number to set the backgground color.
  ##
  ##    iCPIndex
  ##      The value of lParam. The color index to set the row background color to. Valid color index numbers are in the range of [0..127].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iRow;         //ZeeGrid row
  # lParam = (LPARAM)(int) iCPIndex;     //Color palette index
  SendMessage(self.mHwnd, ZGM_SETROWBCOLOR, iRow, iCPIndex)

proc setRowEdit*(self: wZeeGrid, iRow: int, iEdit: int) {.validate, property.} = 
  ## Sends a ZGM_SETROWBCOLOR message to set the background color of every cell in the specified row of the ZeeGrid.
  ##
  ## Parameters:
  ##    iRow
  ##      The value of wParam. The ZeeGrid row to set every cell the edit attribute value.
  ##
  ##    iEdit
  ##      The value of lParam. The edit attribute value to set every cell in the specified ZeeGrid row to. Valid edit attribute values are in the range of [0..4]. 
  ##      0 = not editable, or readonly
  ##      1 = editable with a text edit box
  ##      2 = editable with a droplist combo box
  ##      3 = boolean value and is editable by double-clicking the cell to change the boolean state from TRUE to FALSE or vice versa
  ##      4 = editable with the date picker common control.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iRow;         //ZeeGrid row
  # lParam = (LPARAM)(int) iEdit;        //Edit attribute value
  SendMessage(self.mHwnd, ZGM_SETROWEDIT, iRow, iEdit)

proc setRowFColor*(self: wZeeGrid, iRow: int, iCPIndex: int) {.validate, property.} = 
  ## Sends a ZGM_SETROWFCOLOR message to set the foreground color (text color) of every cell in the specified row of the ZeeGrid.
  ##
  ## Parameters:
  ##    iRow
  ##      The value of wParam. The ZeeGrid row number to set the foreground color.
  ##
  ##    iCPIndex
  ##      The value of lParam. The color index to set the row foreground color to. Valid color index numbers are in the range of [0..127].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iRow;         //ZeeGrid row
  # lParam = (LPARAM)(int) iCPIndex;     //Color palette index
  SendMessage(self.mHwnd, ZGM_SETROWFCOLOR, iRow, iCPIndex)

proc setRowFont*(self: wZeeGrid, iRow: int, iFPIndex: int) {.validate, property.} = 
  ## Sends a ZGM_SETROWFONT message to set the font of every cell in the specified row in the ZeeGrid.
  ##
  ## Parameters:
  ##    iRow
  ##      The value of wParam. The ZeeGrid row to set every cell the font index value.
  ##
  ##    iFPIndex
  ##      The value of lParam. Valid values are in the range of [0..127].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iRow;         //ZeeGrid row
  # lParam = (LPARAM)(int) iFPIndex;     //Font palette index
  SendMessage(self.mHwnd, ZGM_SETROWFONT, iRow, iFPIndex)

proc setRowHeight*(self: wZeeGrid, iHeight: int) {.validate, property.} = 
  ## Sends a ZGM_SETROWHEIGHT message to programmatically set the height of the ZeeGrid rows to the specified number of pixels.
  ##
  ## Parameters:
  ##    iHeight
  ##      The value of wParam. The ZeeGrid row to set every cell the font index value.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iHeight;      //height of all data rows in pixels
  # lParam = 0;                          //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETROWHEIGHT, iHeight, 0)

proc setRowIcon*(self: wZeeGrid, iRow: int, iIPIndex: int) {.validate, property.} = 
  ## Sends a ZGM_SETROWICON message to set the icon of every cell in the specified row in the ZeeGrid.
  ##
  ## Parameters:
  ##    iRow
  ##      The value of wParam. The ZeeGrid row to set every cell the icon index value.
  ##
  ##    iIPIndex
  ##      The value of lParam. Valid values are in the range of [0..127].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iRow;         //ZeeGrid row
  # lParam = (LPARAM)(int) iIPIndex;     //Icon palette index
  SendMessage(self.mHwnd, ZGM_SETROWICON, iRow, iIPIndex)

proc setRowJustify*(self: wZeeGrid, iRow: int, iJustify: int) {.validate, property.} = 
  ## Sends a ZGM_SETROWJUSTIFY message to set the text justification of every cell in the specified row in the ZeeGrid.
  ##
  ## Parameters:
  ##    iRow
  ##      The value of wParam. The ZeeGrid row to set every cell the text justification value.
  ##
  ##    iJustify
  ##      The value of lParam. Valid values are in the range of [0..8].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iRow;         //ZeeGrid row
  # lParam = (LPARAM)(int) iJustify;     //Justification value
  SendMessage(self.mHwnd, ZGM_SETROWJUSTIFY, iRow, iJustify)

proc setRowMark*(self: wZeeGrid, iRow: int, iMark: int) {.validate, property.} = 
  ## Sends a ZGM_SETROWMARK message to set the mark attribute of every cell in the the specified row.
  ##
  ## Parameters:
  ##    iRow
  ##      The value of wParam. The ZeeGrid row to set every cell the text justification value.
  ##
  ##    iMark
  ##      The value of lParam. The mark attribute value to set every cell in the row.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iRow;         //Row number
  # lParam = (LPARAM)(int) iMark;        //Cell mark attribute
  SendMessage(self.mHwnd, ZGM_SETROWMARK, iRow, iMark)

proc setRowNumberFont*(self: wZeeGrid, iFPIndex: int) {.validate, property.} = 
  ## Sends a ZGM_SETROWNUMBERFONT message to change the font used to display the row number in the ZeeGrid.
  ##
  ## Parameters:
  ##    iFPIndex
  ##      The value of wParam. Valid values are in the range of [0..127].
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  The row number column will automatically size itself to hold the number of digits required to display the largest row number 
  ##  currently in the ZeeGrid. This width will be determined by the font size of the selected font palette.
  #
  # wParam = (LPARAM)(int) iFPIndex;   //Font palette index
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETROWNUMBERFONT, iFPIndex, 0)

proc setRowNumbersWidth*(self: wZeeGrid, iWidth: int) {.validate, property.} = 
  ## Sends a ZGM_SETROWNUMBERSWIDTH message to set the width of the row number column. This column cannot be adjusted by the user, 
  ## so it is the only way to adjust this column's width.
  ##
  ## Parameters:
  ##    iWidth
  ##      The value of wParam. The value is the width of the row numbers column in pixels.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iWidth;       //Width in pixels
  # lParam = 0;                          //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETROWNUMBERSWIDTH, iWidth, 0)

proc setRowNumPrecision*(self: wZeeGrid, iRow: int, iValue: int) {.validate, property.} = 
  ## Sends a ZGM_SETROWNUMPRECISION message to set the precision of the double values of the cells in the specified row.
  ##
  ## Parameters:
  ##    iRow
  ##      The value of wParam. The ZeeGrid row number.
  ##
  ##    iValue
  ##      The value of lParam. The value to set the cell number precision for every cell in the specified row.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iRow;              //ZeeGrid row
  # lParam = (LPARAM)(int) iValue;            //number precision value
  SendMessage(self.mHwnd, ZGM_SETROWNUMPRECISION, iRow, iValue)

proc setRowNumWidth*(self: wZeeGrid, iRow: int, iValue: int) {.validate, property.} = 
  ## Sends a ZGM_SETROWNUMWIDTH message to set the width of the displayed value in the cells of the specified row.
  ##
  ## Parameters:
  ##    iRow
  ##      The value of wParam. The ZeeGrid row number.
  ##
  ##    iValue
  ##      The value of lParam. The value to set the cell number width for every cell in the specified row.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iRow;              //ZeeGrid row
  # lParam = (LPARAM)(int) iValue;            //number width value
  SendMessage(self.mHwnd, ZGM_SETROWNUMWIDTH, iRow, iValue)

proc setRowRestriction*(self: wZeeGrid, iRow: int, iRestriction: int) {.validate, property.} = 
  ## Sends a ZGM_SETROWRESTRICTION message to set the restriction value of every cell in the specified row in the ZeeGrid. 
  ## Restrictions perform numeric data entry validation, allowing only valid characters per the restriction to be entered.
  ##
  ## Parameters:
  ##    iRow
  ##      The value of wParam. The ZeeGrid row number to set every cell the restriction value specified in lParam.
  ##
  ##    iRestriction
  ##      The value of lParam. The data restriction attribute value to set every cell in the the specified row. Valid values are in the range of [0..4].
  ##      The restriction values are defined as follows:
  ##      0 = No Restriction
  ##      1 = Signed Integer
  ##      2 = Unsigned Integer
  ##      3 = Signed Double
  ##      4 = Unsigned Double
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  A restriction only restricts the characters allowed to be entered into a cell by manual keyboard input. 
  ##  If a paste operation is performed on restricted cells, the restriction will apply and the paste operation may not be able to be completed fully.
  #
  # wParam = (WPARAM)(int) iRow;         //Row number
  # lParam = (LPARAM)(int) iRestriction; //Cell restriction valu
  SendMessage(self.mHwnd, ZGM_SETROWRESTRICTION, iRow, iRestriction)

proc setRowType*(self: wZeeGrid, iRow: int, iType: int) {.validate, property.} = 
  ## Sends a ZGM_SETROWTYPE message to set the data type of every cell in the specified row in the ZeeGrid.
  ##
  ## Parameters:
  ##    iRow
  ##      The value of wParam. The ZeeGrid row number.
  ##
  ##    iType
  ##      The value of lParam. The data type attribute value to set every cell in the row. Valid values are in the range of [0..5].
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iRow;         //Row number
  # lParam = (LPARAM)(int) iType;        //Cell type attribute
  SendMessage(self.mHwnd, ZGM_SETROWTYPE, iRow, iType)

proc setSortLimit*(self: wZeeGrid, iSortLimit: int, bFlag: bool) {.validate, property.} = 
  ## Sends a ZGM_SETSORTLIMIT message to set the maximum amount of time (in seconds) that a sort operation will take before prompting 
  ## the user with the estimated time to sort and asking if (s)he wants to continue the sort operation.
  ##
  ## Parameters:
  ##    iSortLimit
  ##      The value of wParam. The value is the number of seconds to allow for sorting. If this number is less than the estimated time to sort, 
  ##      the user is prompted to continue or cancel the sort operation depending on the boolean flag value of lParam..
  ##
  ##    bFlag
  ##      The value of lParam. If this value is TRUE, the user will receive a prompt to continue or cancel the sort operation if the estimated 
  ##      time exceeds the sort limit value. If this value is FALSE, no prompt is given and the sort operation is canceled.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iSortLimit;   //number of seconds
  # lParam = (LPARAM)(BOOL) bFlag ;      //MessageBox flag
  SendMessage(self.mHwnd, ZGM_SETSORTLIMIT, iSortLimit, bFlag)
  
proc setTitleHeight*(self: wZeeGrid, iHeight: int) {.validate, property.} = 
  ## Sends a ZGM_SETTITLEHEIGHT message to set the minimum height in pixels of the ZeeGrid title.
  ##
  ## Parameters:
  ##    iHeight
  ##      The value of wParam. The minimum height of the ZeeGrid title in pixels.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iHeight;      //Minimum title height in pixels
  # lParam = 0;                          //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETTITLEHEIGHT, iHeight, 0)

proc setTopRow*(self: wZeeGrid, iRow: int) {.validate, property.} = 
  ## Sends a ZGM_SETTOPROW message to set the first displayed row number in the ZeeGrid.
  ##
  ## Parameters:
  ##    iRow
  ##      The value of wParam. The ZeeGrid row number to display at the top of the page.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM)(int) iRow;         //Row number
  # lParam = 0;                          //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SETTOPROW, iRow, 0)

proc showCopyMenu*(self: wZeeGrid, fEnable: bool = true) {.validate, property.} = 
  ## Sends a ZGM_SHOWCOPYMENU message to enable or disable the display of the copy/paste context menu when the user right-clicks the 
  ## selected cell or highlighted range of cells. If the setting is FALSE (disabled), the grid will post a ZGN_RIGHTCLICK message to the host application. 
  ## If the setting is TRUE (enabled), the context menu is displayed, and the ZGN_RIGHTCLICK message is not sent to the host application.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will cause the copy/paste context menu to be displayed with the user right-clicks the current cell or selected range of cells. 
  ##      A value of FALSE will inhibit the context menu from showing, and send a ZGN_RIGHTCLICK notification message to the host application.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  This setting is enabled (TRUE) by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SHOWCOPYMENU, fEnable, 0)

proc showCursor*(self: wZeeGrid, fEnable: bool = true) {.validate, property.} = 
  ## Sends a ZGM_SHOWCURSOR message to enable or disable the display of the cursor when the ZeeGrid has the input focus.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. Specifies whether to enable or disable the display of the cursor in the focus ZeeGrid. 
  ##      A value of TRUE enables showing the cursor; a value of FALSE disables showing the cursor.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  Showing the cursor is enabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SHOWCURSOR, fEnable, 0)

proc showCursorOnLostFocus*(self: wZeeGrid, fEnable: bool = true) {.validate, property.} = 
  ## Sends a ZGM_SHOWCURSORONLOSTFOCUS message to enable or disable the display of the cursor on a ZeeGrid that has lost the keyboard input focus.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will show the cursor on a ZeeGrid that has lost the keyboard input focus. 
  ##      A value of FALSE will not show the cursor on a ZeeGrid that has lost the keyboard input focus.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  The cursor is shown on lost focus ZeeGrids by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SHOWCURSORONLOSTFOCUS, fEnable, 0)

proc showEdit*(self: wZeeGrid, fEnable: bool = false) {.validate, property.} = 
  ## Sends a ZGM_SHOWCURSORONLOSTFOCUS message to enable or disable the display of the cursor on a ZeeGrid that has lost the keyboard input focus.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will show the auxillary edit panel on the ZeeGrid. 
  ##      A value of FALSE will hide the auxillary edit panel on the ZeeGrid.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  The edit panel is hidden by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SHOWEDIT, fEnable, 0)

proc showGridLines*(self: wZeeGrid, fEnable: bool = true) {.validate, property.} = 
  ## Sends a ZGM_SHOWGRIDLINES message to enable or disable the display of gridlines in the ZeeGrid.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. Specifies whether to enable or disable displaying of gridlines. 
  ##      A value of TRUE enables displaying gridlines; a value of FALSE disables displaying gridlines.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  Gridlines are shown by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SHOWGRIDLINES, fEnable, 0)

proc showHScroll*(self: wZeeGrid, fEnable: bool) {.validate, property.} = 
  ## Sends a ZGM_SHOWHSCROLL message to enable or disable the display of the horizonal scrollbar.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will show the horizontal scrollbar if ZGM_AUTOHSCROLL is set to FALSE. 
  ##      A value of FALSE will hide the horizontal scrollbar if ZGM_AUTOHSCROLL is set to FALSE. 
  ##      If ZGM_AUTOHSCROLL is set to TRUE, the setting of ZGM_SHOWHSCROLL will have no effect.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SHOWHSCROLL, fEnable, 0)

proc showRowNumbers*(self: wZeeGrid, fEnable: bool = true) {.validate, property.} = 
  ## Sends a ZGM_SHOWROWNUMBERS message to enable or disable the display of row numbers in the ZeeGrid.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will display row numbers. A value of FALSE will hide the row numbers.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SHOWROWNUMBERS, fEnable, 0)

proc showSearch*(self: wZeeGrid, fEnable: bool = false) {.validate, property.} = 
  ## Sends a ZGM_SHOWSEARCH message to show or hide the ZeeGrid search panel.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will display the ZeeGrid search panel. 
  ##      A value of FALSE will hide the ZeeGrid search panel.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  Show search is disabled by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SHOWSEARCH, fEnable, 0)

proc showTitle*(self: wZeeGrid, fEnable: bool) {.validate, property.} = 
  ## Sends a ZGM_SHOWTITLE message to enable or disable the showing of the title in the ZeeGrid.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will display the ZeeGrid title. 
  ##      A value of FALSE will hide the ZeeGrid title.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SHOWTITLE, fEnable, 0)

proc showToolbar*(self: wZeeGrid, fEnable: bool = false) {.validate, property.} = 
  ## Sends a ZGM_SHOWSEARCH message to show or hide the ZeeGrid search panel.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will show the ZeeGrid toolbar.
  ##      A value of FALSE will hide the ZeeGrid toolbar.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  The toolbar is hidden by default.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SHOWTOOLBAR, fEnable, 0)

proc showVScroll*(self: wZeeGrid, fEnable: bool) {.validate, property.} = 
  ## Sends a ZGM_SHOWHSCROLL message to enable or disable the display of the horizonal scrollbar.
  ##
  ## Parameters:
  ##    fEnable
  ##      Value of wParam. A value of TRUE will show the vertical scrollbar if ZGM_AUTOVSCROLL is set to FALSE. 
  ##      A value of FALSE will hide the vertical scrollbar if ZGM_AUTOVSCROLL is set to FALSE. 
  ##      If ZGM_AUTOVSCROLL is set to TRUE, the setting of ZGM_SHOWVSCROLL will have no effect.
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = (WPARAM) (BOOL) fEnable;  //enable flag
  # lParam = 0;                        //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SHOWVSCROLL, fEnable, 0)

proc shrinkToFit*(self: wZeeGrid) {.validate, property.} = 
  ## Sends a ZGM_SHRINKTOFIT message to release any memory for allocated rows beyond the memory required to hold the current number of data rows.
  ##
  ##
  ## Return Values:
  ##  This message does not return a value.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SHRINKTOFIT, 0, 0)

proc sortColumnASC*(self: wZeeGrid, iPrimarySortCol: int, iSecondarySortCol: int) {.validate, inline.} = 
  ## Sends a ZGM_SORTCOLUMNASC message to set the primary and secondary sort columns to sort in ascending order.
  ##
  ## Parameters:
  ##    iPrimarySortCol
  ##      The value of wParam. The ZeeGrid column number to use as the primary sort column. When sorting, 
  ##      the order of equal values in this column will be determined by the secondary sort column.
  ##
  ##    iSecondarySortCol
  ##      The value of lParam. The ZeeGrid column number to use as the secondary sort column. 
  ##      The secondary sort column is used as a tie-breaker for rows with equal values in the primary sort column.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  ZeeGrid types are sorted in the following order: BOOLEAN FALSE, BOOLEAN TRUE, numeric values (low to high), alpha values (low to high).
  #
  # wParam = (WPARAM)(int) iPrimarySortCol;       //Primary sort column
  # lParam = (LPARAM)(int) iSecondarySortCol;     //Secondary sort column
  SendMessage(self.mHwnd, ZGM_SORTCOLUMNASC, iPrimarySortCol, iSecondarySortCol)

proc sortColumnDESC*(self: wZeeGrid, iPrimarySortCol: int, iSecondarySortCol: int) {.validate, inline.} = 
  ## Sends a ZGM_SORTCOLUMNASC message to set the primary and secondary sort columns to sort in ascending order.
  ##
  ## Parameters:
  ##    iPrimarySortCol
  ##      The value of wParam. The ZeeGrid column number to use as the primary sort column. 
  ##      When sorting, the order of equal values in this column will be determined by the secondary sort column.
  ##
  ##    iSecondarySortCol
  ##      The value of lParam. The ZeeGrid column number to use as the secondary sort column. 
  ##      The secondary sort column is used as a tie-breaker for rows with equal values in the primary sort column.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  ZeeGrid types are sorted in the following order: alpha values (high to low), numeric values (high to low), BOOLEAN TRUE, BOOLEAN FALSE
  #
  # wParam = (WPARAM)(int) iPrimarySortCol;       //Primary sort column
  # lParam = (LPARAM)(int) iSecondarySortCol;     //Secondary sort column
  SendMessage(self.mHwnd, ZGM_SORTCOLUMNDESC, iPrimarySortCol, iSecondarySortCol)

proc sortSecondary*(self: wZeeGrid, iSecondarySortCol: int) {.validate, inline.} = 
  ## Sends a ZGM_SORTSECONDARY message in response to the ZGN_SORT notification. 
  ## This allows the application to programmatically determine the secondary sort column based on the 
  ## column that the sort operation was requested on by the user double-clicking the column header.
  ##
  ## Parameters:
  ##    iSecondarySortCol
  ##      The value of wParam. The ZeeGrid column to use as the secondary sort column.
  ##
  ## Return Values:
  ##  This message does not return a value.
  ##
  ## Remarks:
  ##  This message is primarily used when processing a ZGN_SORT notification message. 
  ##  By determining which column is being sorted, the application can vary the secondary sort column.
  #
  # wParam = (WPARAM)(int) iSecondarySortCol;     //Secondary sort column
  # lParam = 0;                                   //not used; must be zero
  SendMessage(self.mHwnd, ZGM_SORTSECONDARY, iSecondarySortCol, 0)

proc stopwatch_start*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_STOPWATCH_START message to start an internal interval timer.
  ##
  ## Return Values:
  ##  This message returns the machine speed value that is calculated when the ZeeGrid DLL is initialized. 
  ##  This value is the basis on which the estimated sort times are calculated.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_STOPWATCH_START, 0, 0))

proc stopwatch_stop*(self: wZeeGrid):int {.validate, inline.} = 
  ## Sends a ZGM_STOPWATCH_STOP message to get the elapsed time since the execution of the last ZGM_STOPWATCH_START message.
  ##
  ## Return Values:
  ##  This message returns the elapsed time since the internal stopwatch was started. 
  ##  The time is in 1000ths of a second. For example, a return value of 1500 = 1.5 seconds.
  #
  # wParam = 0;  //not used; must be zero
  # lParam = 0;  //not used; must be zero
  result = cast[int](SendMessage(self.mHwnd, ZGM_STOPWATCH_STOP, 0, 0))

method release(self: wZeeGrid) =
  discard

proc wZeeGrid_ParentOnCommand(self: wZeeGrid, event: wEvent) =
  if event.mLparam == self.mHwnd:
    case HIWORD(event.mWparam)
    of ZGN_BUTTONPRESSED:
      ## ZGN_BUTTONPRESSED
      ## The ZGN_BUTTONPRESSED notification message is sent when the user has clicked on a cell having the button data type. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridButtonPressed, event.mWparam, event.mLparam)
    of ZGN_CELLCLICKED:
      ## ZGN_CELLCLICKED
      ## The ZGN_CELLCLICKED notification message is sent when the mouse is left-clicked on any data cell. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridCellClicked, event.mWparam, event.mLparam)
    of ZGN_COLUMNMOVED:
      ## ZGN_COLUMNMOVED
      ## The ZGN_COLUMNMOVED notification message is sent when the column display order is changed by the user. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridColumnMoved, event.mWparam, event.mLparam)
    of ZGN_CURSORCELLCHANGED:
      ## ZGN_CURSORCELLCHANGED
      ## The ZGN_CURSORCELLCHANGED notification message is sent when the ZeeGrid cursor cell is changed. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridCursorCellChanged, event.mWparam, event.mLparam)
    of ZGN_DELETE:
      ## ZGN_DELETE
      ## The ZGN_DELETE notification message is sent when the delete key is pressed in the ZeeGrid contol that has the keyboard input focus.
      ##The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridDelete, event.mWparam, event.mLparam)
    of ZGN_DOUBLECLICKFIXEDCOLUMN:
      ## ZGN_DOUBLECLICKFIXEDCOLUMN
      ## TThe ZGN_DOUBLECLICKFIXEDCOLUMN notification message is sent when the user has double-clicked in a fixed column cell. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridDoubleClickFixedColumn, event.mWparam, event.mLparam)
    of ZGN_DOUBLECLICKREADONLY:
      ## ZGN_DOUBLECLICKREADONLY
      ## The ZGN_DOUBLECLICKREADONLY notification message is sent when the user has double-clicked a cell that is readonly. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridDoubleClickReadOnly, event.mWparam, event.mLparam)
    of ZGN_EDITCOMPLETE:
      ## ZGN_EDITCOMPLETE
      ## The ZGN_EDITCOMPLETE notification message is sent when the user finishes editing an editable cell. 
      ## This message is sent after the ZeeGrid has written the edit control contents to the cell. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridEditComplete, event.mWparam, event.mLparam)
    of ZGN_EDITEND:
      ## ZGN_EDITEND
      ## The ZGN_EDITEND notification message is sent when the user finishes editing an editable cell. 
      ## This message is sent prior to the ZeeGrid writing the edit control contents to the cell. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridEditEnd, event.mWparam, event.mLparam)
    of ZGN_F1:
      ## ZGN_F1
      ## The ZGN_F1 notification message is sent when the F1 key is pressed in the ZeeGrid contol that has the keyboard input focus. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridF1, event.mWparam, event.mLparam)
    of ZGN_F2:
      ## ZGN_F2
      ## The ZGN_F2 notification message is sent when the F2 key is pressed in the ZeeGrid contol that has the keyboard input focus. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridF2, event.mWparam, event.mLparam)
    of ZGN_F3:
      ## ZGN_F3
      ## The ZGN_F3 notification message is sent when the F3 key is pressed in the ZeeGrid contol that has the keyboard input focus. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridF3, event.mWparam, event.mLparam)
    of ZGN_F4:
      ## ZGN_F4
      ## The ZGN_F4 notification message is sent when the F4 key is pressed in the ZeeGrid contol that has the keyboard input focus. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridF4, event.mWparam, event.mLparam)
    of ZGN_F5:
      ## ZGN_F5
      ## The ZGN_F5 notification message is sent when the F5 key is pressed in the ZeeGrid contol that has the keyboard input focus. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridF5, event.mWparam, event.mLparam)
    of ZGN_F6:
      ## ZGN_F6
      ## The ZGN_F6 notification message is sent when the F6 key is pressed in the ZeeGrid contol that has the keyboard input focus. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridF6, event.mWparam, event.mLparam)
    of ZGN_F7:
      ## ZGN_F7
      ## The ZGN_F7 notification message is sent when the F7 key is pressed in the ZeeGrid contol that has the keyboard input focus. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      self.processMessage(wEvent_ZeeGridF7, event.mWparam, event.mLparam)
    of ZGN_F8:
      ## ZGN_F8
      ## The ZGN_F8 notification message is sent when the F8 key is pressed in the ZeeGrid contol that has the keyboard input focus. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      ## currently doesn't execute, built in tool bar takes command
      self.processMessage(wEvent_ZeeGridF8, event.mWparam, event.mLparam)
    of ZGN_GOTFOCUS:
      ## ZGN_GOTFOCUS
      ## The ZGN_GOTFOCUS notification message is sent when the grid receives the keyboard input focus. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      ## currently doesn't execute, built in tool bar takes command
      self.processMessage(wEvent_ZeeGridGotFocus, event.mWparam, event.mLparam)
    of ZGN_INSERT:
      ## ZGN_INSERT
      ## The ZGN_INSERT notification message is sent when the insert key is pressed in the ZeeGrid contol that has the keyboard input focus. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      ## currently doesn't execute, built in tool bar takes command
      self.processMessage(wEvent_ZeeGridInsert, event.mWparam, event.mLparam)
    of ZGN_LOADCOMBO:
      ## ZGN_LOADCOMBO
      ## The ZGN_LOADCOMBO notification message is sent when the user has begun editing a cell that has an edit attribute of 2. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      ## currently doesn't execute, built in tool bar takes command
      self.processMessage(wEvent_ZeeGridLoadCombo, event.mWparam, event.mLparam)
    of ZGN_LOSTFOCUS:
      ## ZGN_LOSTFOCUS
      ## The ZGN_LOSTFOCUS notification message is sent when the grid loses the keyboard input focus. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      ## currently doesn't execute, built in tool bar takes command
      self.processMessage(wEvent_ZeeGridLostFocus, event.mWparam, event.mLparam)
    of ZGN_MOUSEMOVE:
      ## ZGN_LOSTFOCUS
      ## The ZGN_MOUSEMOVE notification message is sent when the user has moved the mouse pointer over the ZeeGrid data cell area. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      ## currently doesn't execute, built in tool bar takes command
      self.processMessage(wEvent_ZeeGridMouseMove, event.mWparam, event.mLparam)
    of ZGN_PASTECOMPLETE:
      ## ZGN_PASTECOMPLETE
      ## The ZGN_PASTECOMPLETE notification message is sent upon the completion of a paste from the clipboard. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      ## currently doesn't execute, built in tool bar takes command
      self.processMessage(wEvent_ZeeGridPasteComplete, event.mWparam, event.mLparam)
    of ZGN_RIGHTCLICK:
      ## ZGN_RIGHTCLICK
      ## The ZGN_RIGHTCLICK notification message is sent when the user has right-clicked in the ZeeGrid data area. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      ## currently doesn't execute, built in tool bar takes command
      self.processMessage(wEvent_ZeeGridRightClick, event.mWparam, event.mLparam)
    of ZGN_ROWSELECTED:
      ## ZGN_ROWSELECTED
      ## The ZGN_ROWSELECTED notification message is sent when the user selects a row by clicking in the row numbers column. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      ## currently doesn't execute, built in tool bar takes command
      self.processMessage(wEvent_ZeeGridRowSelected, event.mWparam, event.mLparam)
    of ZGN_SORT:
      ## ZGN_SORT
      ## The ZGN_SORT notification message is sent when the user has double-clicked in a column header signaling a sort operation is about to take place. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      ## currently doesn't execute, built in tool bar takes command
      self.processMessage(wEvent_ZeeGridSort, event.mWparam, event.mLparam)
    of ZGN_SORTCOMPLETE:
      ## ZGN_SORTCOMPLETE
      ## The ZGN_SORTCOMPLETE notification message is sent when the grid has completed a sort operation. 
      ## The parent window of the ZeeGrid control receives this notification message through the WM_COMMAND message.
      ## idZeeGrid = (int) LOWORD(wParam);  //identifier of the ZeeGrid control
      ## hwndZeeGrid = (HWND) lParam;       //handle to the ZeeGrid control
      ## currently doesn't execute, built in tool bar takes command
      self.processMessage(wEvent_ZeeGridSortComplete, event.mWparam, event.mLparam)
    else: discard

proc final*(self: wZeeGrid) =
  ## Default finalizer for wZeeGrid.
  discard

proc init*(self: wZeeGrid, parent: wWindow, id = wDefaultID, pos = wDefaultPoint, size = wDefaultSize, style = WS_CHILD or WS_VISIBLE or WS_BORDER) {.validate.} =
  ## Initializer.
  wValidate(parent)
 
  var hgridmod: HMODULE = 0
  var hgrid: HWND

  when sizeof(int) == 4:
    # running on a 32 bit system!
    hgridmod = LoadLibrary("ZeeGrid.dll")
  elif sizeof(int) == 8:
    # running on a 64 bit system!
    hgridmod = LoadLibrary("ZeeGridx64.dll")
  else:
    raise newException(wError, "Can't determine if 64 or 32 bit!")

  if hgridmod == 0:
    raise newException(wError, "ZeeGrid module not loaded!")

  self.wControl.init(className="ZeeGrid", parent=parent, id=id, pos=pos, size=size, style=style)
  
  parent.systemConnect(WM_COMMAND) do (event: wEvent):
    wZeeGrid_ParentOnCommand(self, event)


  self.hardConnect(wEvent_Navigation) do (event: wEvent):
    # keep focus when pressing the arrow keys
    var vetoKeys = {wKey_Left, wKey_Right, wKey_Up, wKey_Down}

    if event.keyCode in vetoKeys:
      event.veto

proc ZeeGrid*(parent: wWindow, id = wDefaultID, pos = wDefaultPoint, size = wDefaultSize, style =  WS_CHILD or WS_VISIBLE or WS_BORDER): wZeeGrid {.inline, discardable.} =
  ## Constructor, creating and showing a zeegrid control.
  wValidate(parent)
  new(result, final)
  result.init(parent, id, pos, size, style)
