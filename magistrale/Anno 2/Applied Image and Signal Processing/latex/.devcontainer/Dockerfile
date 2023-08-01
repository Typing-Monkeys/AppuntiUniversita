FROM qmcgaw/latexdevcontainer

# fix temporaneo aggiornamento latex 2023 
# RUN wget https://ctan.mirror.garr.it/mirrors/ctan/systems/texlive/tlnet/update-tlmgr-latest.sh && sh update-tlmgr-latest.sh -- --upgrade && tlmgr update --self --all

# update del package manager
RUN tlmgr update --self

# installo pacchetti necessari
RUN tlmgr install \
            listings caption xcolor float wrapfig \ 
            footmisc emoji fontspec emptypage pgf pgfplots \ 
            && texhash

# installo font emoji
RUN  apt install fonts-noto-color-emoji