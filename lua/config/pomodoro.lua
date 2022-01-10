require('lualine').setup({
    sections = {
        lualine_c = { 'filename', require('pomodoro').statusline() }
    }
})

require('pomodoro').setup({
    time_work = 25,
    time_break_short = 5,
    time_break_long = 20,
    timers_to_long_break = 4
})
