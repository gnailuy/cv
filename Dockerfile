# Image: gnailuy/miktex
# Solves the "File `l3backend-xdvipdfmx.def` not found" issue
FROM miktex/miktex

RUN initexmf --update-fndb --admin && \
    initexmf --mkmaps --admin && \
    initexmf --mklinks --force --admin && \
    mpm --find-updates --admin && \
    mpm --update --admin
