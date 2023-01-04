
let filtered_sub_rules = [{'reviewer': 'jac', 'valid': 'Yes', 'ndc_code_rules_array': ["rule|111|00173086910|Prescription to HCC 1:1", "rule|111|00173087310|Prescription to HCC 1:1", "rule|111|00173088710|Prescription to HCC 1:1", "rule|111|00173089310|Prescription to HCC 1:1"], 'nope': 'absolutely not', 'substance_list_rules_array': ['rule|111|00173085555|Prescription to HCC 1:1', 'rule|111|00173085533|Prescription to HCC 1:1', 'rule|111|00173085981|Prescription to HCC 1:1'], 'substance_rules_array': ['rule|111|00173089999|Prescription to HCC 1:1']}]

filtered_sub_rules.forEach(record => {
    keysWeCareAbout = ['ndc_code_rules_array', 'substance_list_rules_array', 'substance_rules_array']

    keysWeCareAbout.forEach(key => {
        record[key].forEach(subrecord => {
            console.log(subrecord) // instead of console.log, use the method to write each line to the DB here
        })
    })
})