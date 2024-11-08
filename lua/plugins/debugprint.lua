return {
  {
    "andrewferrier/debugprint.nvim",
    opts = {
      display_location = false,
      display_counter = false,
      display_snippet = false,
      print_tag = "###",
      keymaps = {
        normal = {
          plain_below = "gCp",
          plain_above = "gCP",
          variable_below = "gCv",
          variable_above = "gCV",
          variable_below_alwaysprompt = nil,
          variable_above_alwaysprompt = nil,
          textobj_below = "gCo",
          textobj_above = "gCO",
          toggle_comment_debug_prints = nil,
          delete_debug_prints = nil,
        },
        visual = {
          variable_below = "gCv",
          variable_above = "gCV",
        },
      },
      commands = {
        toggle_comment_debug_prints = "ToggleCommentDebugPrints",
        delete_debug_prints = "DeleteDebugPrints",
      },
    },
  }
}
