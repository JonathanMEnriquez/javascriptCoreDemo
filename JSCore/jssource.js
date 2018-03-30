var helloWorld = "Hello World!"

function getFullName(firstname, lastname) {
    return firstname + " " + lastname;
}

function maxMinAverage(values) {
    var max = Math.max.apply(null, values);
    var min = Math.min.apply(null, values);
    var sum = 0;
    for (var i = 0; i < values.length; i++) {
        sum += values[i];
    }
    var average = sum / values.length;
    
    return {
        "max": max,
        "min": min,
        "average": average
    };
}
