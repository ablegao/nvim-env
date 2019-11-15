# 

	PlugInstall
	VimProcInstall
	GoInstall
	pip install python-language-server
	pip install pynvim 
	pip install yapf
	pip install autopep8
	pip install pyline
	pip install isort
	pip install pydocstyle
	pip install rope

# markdown 支持

### Markdown 格式化工具
	sudo npm install -g markdownlint-cli
	go get github.com/mattn/efm-langserver


## shell 编码支持
	
	npm i -g bash-language-server

	



# .tmux.conf


	set -g default-terminal screen-256color
	set-option -ga terminal-overrides ",*256col*:Tc" # 这句是关键
	set -g mouse on

	set -g status-justify centre
	# 启用活动警告
	setw -g monitor-activity on
	set -g visual-activity on
	bind '"' split-window -c "#{pane_current_path}"
	bind % split-window -h -c "#{pane_current_path}"
	bind c new-window -c "#{pane_current_path}"


	bind-key m \
	  if-shell 'if [ `tmux show-options -g mouse | cut -d " " -f2` = "on" ];then tmux set -g mouse off  && tmux display "mouse off"; else tmux set -g mouse on && tmux display "mouse on"; fi' ''
