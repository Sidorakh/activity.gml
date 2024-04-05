const path = require('path');

module.exports = {
    output: {
        path: path.resolve(process.cwd(), '../'),
        filename: 'discord.js',
    },
    mode: 'production',
};