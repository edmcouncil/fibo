import AXIOM from './AXIOM'
const parsers = {
    "STRING": function (data) {
        return data.value
    },
    "AXIOM": function (data) {
        let value =  data.value;

        return AXIOM;
    }
}

export {parsers}