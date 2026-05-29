const MAX_RETRIES = 3;
let globalCounter = 0;

class DataProcessor {
    constructor(name, options = {}) {
        this.name = name;
        this.options = options;
        this.data = [];
    }

    async fetchData(url) {
        try {
            const response = await fetch(url);
            const json = await response.json();
            return json;
        } catch (error) {
            console.error(`Failed to fetch: ${error.message}`);
            return null;
        }
    }

    *generateSequence(start, end) {
        for (let i = start; i <= end; i++) {
            yield i * 2;
        }
    }
}

function processArray(arr, callback) {
    if (!Array.isArray(arr)) {
        throw new TypeError("Expected an array");
    }
    return arr
        .filter(item => item > 0)
        .map(callback)
        .reduce((sum, val) => sum + val, 0);
}

const regex = /https?:\/\/[\w.-]+\/[\w./_-]+/gi;
const template = `Result: ${MAX_RETRIES} items processed`;

// Line comment
/* Block
   comment */
export default DataProcessor;