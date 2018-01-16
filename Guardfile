guard 'nanoc' do
  watch('nanoc.yaml')
  watch('Rules')
  watch(%r{^(content|layouts|lib)/.*$})
end

notification :terminal_notifier, timeout: 1 if `uname` =~ /Darwin/
