FROM qmcgaw/latexdevcontainer

# update del package manager
RUN tlmgr update --self

# installo pacchetti necessari
RUN tlmgr install listings caption xcolor float wrapfig footmisc emoji fontspec emptypage && texhash

# installo font emoji
RUN  apt install fonts-noto-color-emoji