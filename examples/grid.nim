import wNim/[wApp, wFrame, wPanel]
import ../wZeeGrid

let app = App()

let frame = Frame(title="ZeeGrid Demo", size=(400, 300))

var panel = Panel(frame)

var grid = ZeeGrid(panel, pos=(0,0), size=(300, 200))

# 100 columns, 1st is frozen
grid.dimGrid(100,1)

# show row numbers
grid.showRowNumbers(true)

#create 100 rows of empty cells
for i in 1 .. 100:
  discard grid.appendRow()

# set some column header titles
grid.setCellText(1,"first row\nis fixed")
grid.setCellText(2,"second")
grid.setCellText(3,"** 3 **")
grid.setCellText(4,"fourth")

# create combo box
grid.setCellText(103,"First Combo")
grid.setCellType(103,2)
grid.setCellEdit(103,2)

# create another combo box
grid.setCellText(203,"Second Combo")
grid.setCellType(203,2)
grid.setCellEdit(203,2)

# create button
grid.setCellText(303,"First Button")
grid.setCellType(303,5)
grid.setCellEdit(303,0)

# create another button
grid.setCellText(403,"Second Button")
grid.setCellType(403,5)
grid.setCellEdit(403,0)

# create checkbox row
grid.setColType(5, 1)
grid.setColEdit(5, 3)

grid.wEvent_ZeeGridLoadCombo do (event: wEvent):
  # when user clicks on combobox, clear, and then depending on
  # cell index display a different result set
  grid.comboClear(true)
  if grid.getCursorIndex() == 103:
    grid.comboAddString("TEST 1")
    grid.comboAddString("TEST 9")
    grid.comboAddString("TEST 3")
    grid.comboAddString("TEST 4")
    grid.comboAddString("TEST 5")
  if grid.getCursorIndex() == 203:
    grid.comboAddString("BLAH 1")
    grid.comboAddString("BLAH 9")
    grid.comboAddString("BLAH 3")
    grid.comboAddString("BLAH 4")
    grid.comboAddString("BLAH 5")

grid.wEvent_ZeeGridButtonPressed do (event: wEvent):
    # run event when button is clicked
    # different based on cell index
    echo "BUTTON PRESSED"
    if grid.getCursorIndex() == 303:
      echo "Button 33 Pressed!"
    if grid.getCursorIndex() == 403:
      echo "Button 44 Pressed"

grid.wEvent_ZeeGridF7 do(event: wEvent):
    # fire event when F7 key is pressed
    echo "F7 Pressed"


grid.setColEdit(2,1)

# set column to date type
grid.setColType(4,2)

# set column to be edited by date picker
grid.setColEdit(4,4)

# set date
grid.setCellText(104,"05/23/2019")

# set custom color
grid.setcolor(20, RGB(190, 190, 190)) # filter row

# alternate row colors
grid.alternateRowColors(true,20)

# auto size all columns
grid.autoSizeAllColumns()

proc layout() = # layout items on screen
  panel.layout:
    grid:
      top = panel.top
      bottom = panel.innerBottom
      left = panel.innerLeft
      right = panel.innerRight

panel.wEvent_Size do ():
  layout()
      
layout()
frame.center()
frame.show()
app.mainLoop()