return {
    dir = '~/projects/zap',
    config = function ()
        require('history').setup({
            keybinds = {
                back = '<BS>',
                forward = '<CR>',
            }
        })
    end
}
