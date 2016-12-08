#!/usr/bin/node

'use strict';

process.env.ATOM_RESOURCE_PATH = process.env.ATOM_RESOURCE_PATH ||
        '/usr/lib/atom';

require('../lib/apm-cli.js').run(process.argv.slice(2), function (error) {
    process.exitCode = +!!error;
});

