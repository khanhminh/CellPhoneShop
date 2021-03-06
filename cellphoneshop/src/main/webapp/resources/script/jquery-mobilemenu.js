jQuery(function ($) {
    // Create the dropdown base
    $("<form id='mobilemenu'><select /></form>").appendTo("#topnav");
    // Create default option "Go to..." 
    $("<option />", {
        "selected": "selected",
        "value": "",
        "text": "Menu"
    }).appendTo("#topnav select");
    //Populate dropdown with menu items
    $("#topnav a").each(function () {
        var el = $(this);
        var prefix = '';
        switch (el.parents().length) {
            case (6):
                prefix = '';
                break;
            case (8):
                prefix = '- - - ';
                break;
            case (10):
                prefix = '- - - - - ';
                break;
            case (12):
                prefix = '- - - - - - - ';
                break;
            default:
                prefix = '';
                break;
        }
        $("<option />", {
            "value": el.attr("href"),
            "text": prefix + el.text()
        }).appendTo("#topnav select");
        $("#topnav select").change(function () {
            window.location = $(this).find("option:selected").val();
        });
    });
});