# Nev's Miscellaneous Notes on Vim usage
## Nev's Custom Key Bindings
Items in this section are configured in Nev's vimrc.
#### \<Leader\> is , (comma)
#### jj
Alternative to &lt;Esc> when in Insert mode.
#### \<Leader\>w
Toggle off or on, highlighting of tab characters as well as any whitespace at the end of the line.  
#### &lt;leader>zz
Switches between;
* keep cursor vertically centered and scroll the screen up and down
* scroll the cursor up and down the screen.  
    (Configured in Nev's vimrc)
## Useful commands
#### :noh
'No highlight', removes search highlighting.
#### :set nolist | :set list
Toggle between displaying whitespace characters or not.
#### :dig | :digraphs
Displays a complete listing of all possible characters available.
To insert a Digraph from within insert mode, press &lt;C-k> then the 2-letter combination.

#### &set linebreak
Line wrap at words.
#### * | #
Search the text under the cursor forward or back.
#### @:
Repeat the last command.
#### q: | q/
List previous commands|searches to select and re-run.
________________________________________
## Tabs
#### gt|gT
Toggle forward and back between tabs.
#### :tabnew [&lt;filename>]
Opens a new tab. Either empty or with the file specified.
________________________________________
## Splits / Windows
#### :split|:vsplit
Create a new window split horizontally or vertically containing a duplicate of the current buffer.
#### :new|:vnew [&lt;filename>]
Create a new window split horizontally or vertically. Either blank or containing the file specified.
#### &lt;C-h|j|k|l>
Switch between windows. Left|Down|Up|Right
#### &lt;C-w>h|j|k|l
Move the current window all the way to the left|bottom|top|right of the current screen.
#### &lt;C-w>w|W
Switch to next or previous window.
#### Resizing splits/windows
**:resize|:res n|+n|-n** => Resize height to the absolute or differential number of rows specified.  
**:vertical resize n|+n|-n** => Resize width to the absolute or differential number of columns specified.  
**&lt;C-w>[num]+|-|>|<** => Increase|decrease the height|width by a single row|column (or by the [num] specified).  
**&lt;C-=>** => Resize all windows to equal dimensions.  
**&lt;C-_>** => Resize window to its maximum height.  
**&lt;C-|>** => Resize window to its maximum width.  
________________________________________
## Buffers
#### :bnext|:bn    :bprevious|:bp
Goto the next or previous buffer.
#### &lt;F5>
Display open buffers and wait for number or name to switch to.
#### :buffers|:ls|:files
List buffers currently open. All 3 commands are synonyms.
#### :buffer|:b &lt;buf_no>|&lt;buf_name>
Switch to the buffer number specified.
#### &lt;C-^>
Toggle between previous buffer.
#### :bdelete|:bd &lt;num>|&lt;name>
Remove the buffer specified.
________________________________________
## Registers
In the commands below 'X' is the register identifier/name.  
**"Xy** => Yank to the specified register.  
**"Xp** => Paste from the specified register.  
**&lt;C-r>X** => Paste from the specified register when in Insert mode.  
**:Reg** => List all registers.  
**@+=@%** => Copy the file path register to the clipboard register.  
**@:** => Repeats the last command executed.  
#### Read only registers
**".** => Last inserted text.  
**"%** => Current file path.  
**"#** => Alternative file. This is the file switched to with &lt;C-^>.  
**":** => Most recently executed command.  
**"/** => Search register. Most recent search pattern.
**"-** => Small delete. The last delete less than on line in length.
#### Special registers
**"_** => Black hole register.  
**""** => Default register. All deleted and yanked text goes here.  
**"0** => Most recent yanked text.  
**"1 thru "9** => Deleted text goes into register 1 then incrementally pushed up through registers 2 => 9.  
**"=** => Expression register.
#### Selection and drop registers
**"*** => This is the GUI clipboard "copied" text.  
**"+** => On X11 systems this is the selected/highlighted text which can be pasted with the middle mouse button. (In MS Windows it is the same as "\*.)  
**"~** => This is the dropped text from the last drag'n'drop operation.  
________________________________________
## Sessions
These are from the vim-session plugin.  
**:OpenSession**  
**:SaveSession**  
**:CloseSession**  
**:DeleteSession**  
**:OpenTabSession**  
**:AppendTabSession**  
**:SaveTabSession**  
**:CloseTabSession**  
________________________________________
## Markdown shortcuts
The following is implemented by markdown-preview plugin.  
**:MarkdownPreview** => Opens a webpage to preview the current markdown file.  
The following are from Nev's vimrc.  
**&lt;leader>e** => Emphasis/Italics  
**&lt;leader>b** => Bold  
**&lt;leader>eb** => Emphasis and bold  
**&lt;leader>s** => Strikethrough  
**&lt;leader>i** => Image  
**&lt;leader>l** => Hyperlink  
**&lt;leader>1** => Heading 1  
**&lt;leader>2** => Heading 2  
**&lt;leader>3** => Heading 3  
**&lt;leader>4** => Heading 4  
**&lt;leader>5** => Heading 5  
**&lt;leader>6** => Heading 6  
**&lt;leader>q** => Quote block  
**&lt;leader>c** => Code block  
**&lt;leader>r** => Ruby code block  
**&lt;leader>p** => Python code block  
**&lt;leader>h** => Horizontal rule  

