## Istruzioni per in container

Servono per buildare il pdf con lualatex (emoji di merda).
Le metto qui per ricordarmele.

Il container sarebbe meglio aggiungerlo alla repo (commit qui dentro).

```bash
# history

1  ls
2  clear
3  tlmgr install listings
4  tlmgr update --self
5  tlmgr install listings
6  tlmgr install caption xcolor
7  tlmgr install float
8  tlmgr install wrapfig
9  hostname
10  tlmgr install footmisc
11  tlmgr install emoji
12  texhash
13  tlmgr --help
14  lualatex --help
15  tlmgr install fontspec
16  texhash
17  apt install fonts-noto-color-emoji
18  tlmgr install NotoColorEmoji
19  texhash
20  tlmgr install emptypage
21  texhash
22  cd santini
23  cdd capitoli
24  ls
25  cd capitoli
26  cd secure_coding
27  ls
28  tlmgr install movie15
29  texhash
30  tlmgr install animate
31  texhash
32  tlmgr install pdfbase
33  tlmgr install media9
34  texhash
35  tlmgr install zref-abspage
36  tlmgr install zref
37  texhash
38  tlmgr install ocgbase
39  tlmgr install ocgx2
40  texhash
```