-- Jupytext: seamlessly open .ipynb files as markdown in Neovim.
-- Converts on the fly and saves back to .ipynb behind the scenes.
--
-- Prerequisites (install globally, not in a venv):
--   pip install jupytext

return {
  'GCBallesteros/jupytext.nvim',
  opts = {
    style = 'markdown',
    output_extension = 'md',
    force_ft = 'markdown',
  },
}
