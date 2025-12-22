dialogStuff = []
currentDialog = 0
active = false
addDialog = function(_portrait, _text, _funcdialog = function()
{
})
{
    var q = 
    {
        portrait: _portrait,
        text: _text,
        func: _funcdialog
    }
    array_push(dialogStuff, q)
}
textVisual = ""
textLetter = 1
canProgress = false