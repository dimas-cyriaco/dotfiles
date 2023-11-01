return {
  "chrisgrieser/nvim-recorder",
  dependencies = "rcarriga/nvim-notify",
  opts = {
    mapping = {
      startStopRecording = "Q",
      playMacro = "q",
      switchSlot = "<C-q>",
      editMacro = "cq",
      yankMacro = "yq",
      addBreakPoint = "##", -- ⚠️ this should be a string you don't use in insert mode during a macro
    },
  },
}
