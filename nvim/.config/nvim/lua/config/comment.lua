local Comment_ok, Comment = pcall(require, "Comment")

if not Comment_ok then
  return
end

-- Enable Comment.nvim
Comment.setup()
