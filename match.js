
var all_patern = /([\u0591-\u05f4\,\"\']+\s){0,2}\([\u0591-\u05f4\s\,\"\'\.\:\-]+\)/g;
var first_word_pattern = /([\u0591-\u05f4\,\"\']+\s){0,2}\(/
var inside_pattern = /\([\u0591-\u05f4\s\,\"\'\.\:\-]+\)/;

var selector = 'body'

gim = {"א":1, "ב":2, "ג":3, "ד":4, "ה":5, "ו":6, "ז":7, "ח":8, "ט":9, "י":10, "כ":20, "ל":30, "מ":40, "נ":50, 
       "ס":60, "ע":70, "פ":80, "צ":90, "ק":100, "ר":200, "ש":300, "ת":400 }

function get_gimatria(s) {
    //console.log(s)
    s = s.split("-")[0];
    s = s.replace(/\'/g, "");
    s = s.replace(/\"/g, "");
    s = s.replace(/\,/g, "");
    s = s.replace(/\:/g, "");
    s = s.replace(/\./g, "");
    s = s.replace("טו", "יה");
    s = s.replace("טז", "יו");
    tmp_str=s;
    g=1000;
    while (tmp_str.length) {
        c = tmp_str.charAt(0);
        tmp_str = tmp_str.substring(1)
        if("קרשת".search(c) > -1)
        {
            if (g<=100){
                return -1;
            }
            g=100;
        }
        if("יכלמנסעפצ".search(c) > -1)
        {
            if (g<=10){
                return -1;
            }
            g=10;
        }
        if("אבגדהוזחט".search(c) > -1)
        {
            if (g<=1){
                return -1;
            }
            g=1;
        }    
    }
    g = 0;
    $.each(s.split(''), function( indexa, valuea ) {
         g+=gim[valuea];
        }
    );
    return g;
}       
       
yerushalmi = {"ברכות":490039,"פיאה":490207,"דמאי":490057,"כלאיים":490098,"שביעית":490241,"תרומות":490287,"מעשרות":490135,"מעשר שני":490130,"חלה":490070,"עורלה":490194,"ביכורים":490031,"שבת":490251,"עירובין":490197,"פסחים":490215,"יומא":490090,"שקלים":490275,"ראש השנה":490229,"סוכה":490173,"ביצה":490034,"תענית":490283,"מגילה":490120,"חגיגה":490067,"מועד קטן":490124,"יבמות":490074,"כתובות":490107,"נדרים":490140,"נזיר":490151,"גיטין":490048,"סוטה":490164,"קידושין":490225,"בבא קמא":490021,"בבא מציעא":490011,"בבא בתרא":490001,"שבועות":490233,"מכות":490127,"סנהדרין":490178,"עבודה זרה":490189,"הוריות":490064,"נידה":490160,"ביכורים":490031,
}

bavli = {"ברכות" : 1450001,"שבת" : 1450002,"עירובין" : 450003,"פסחים" : 450004,"שקלים" : 450005,"יומא" : 450006,"סוכה" : 450007,"ביצה" : 450008,"ראש השנה" : 450009,"תענית" : 450010,"מגילה" : 450011,"מועד קטן" : 450012,"חגיגה" : 450013,"יבמות" : 450014,"כתובות" : 450015,"נדרים" : 450016,"נזיר" : 450017,"סוטה" : 450018,"גיטין" : 450019,"קידושין" : 450020,"בבא קמא" : 450021,"בבא מציעא" : 450022,"בבא בתרא" : 450023,"סנהדרין" : 450024,"מכות" : 450025,"שבועות" : 450026,"עבודה זרה" : 450027,"הוריות" : 450028,"עדיות" : 450029,"זבחים" : 450030,"מנחות" : 450031,"חולין" : 450032,"בכורות" : 450033,"ערכין" : 450034,"תמורה" : 450035,"כריתות" : 450036,"מעילה" : 450037,"תמיד" : 450038,"נדה" : 450039,'מו"ק': 450012,"ב''ב":450023,"ע''ז":450027,"קדושין" : 450020,'ר"ה' : 450009,"ר''ה" : 450009
}

mishna = {"ברכות" :2001,"פיאה" :2002,"דמאי" :2003,"כלאיים" :2004,"שביעית" :2005,"תרומות" :2006,"מעשרות" :2007,"מעשר שני" :2008,"חלה" :2009,"ערלה" :2010,"ביכורים" :2011,"שבת" :2012,"עירובין" :2013,"פסחים" :2014,"שקלים" :2015,"יומא" :2016,"סוכה" :2017,"ביצה" :2018,"ראש השנה" :2019,"תענית" :2020,"מגילה" :2021,"מועד קטן" :2022,"חגיגה" :2023, "יבמות" :2024,"כתובות" :2025,"נדרים" :2026,"נזיר" :2027,"סוטה" :2028,"גיטין" :2029,"קידושין" :2030,"בבא קמא" :2031,"בבא מציעא" :2032,"בבא בתרא" :2033,"סנהדרין" :2034,"מכות" :2035,"שבועות" :2036,"עדיות" :2037,"עבודה זרה" :2038,"אבות" :2039,"הוריות" :2040,"זבחים" :2041,"מנחות" :2042,"חולין" :2043,"בכורות" :2044,"ערכין" :2045,"תמורה" :2046,"כריתות" :2047,"מעילה" :2048,"תמיד" :2049,"מידות" :2050,"קינים" :2051,"כלים" :2052,"אהלות" :2053,"נגעים" :2054,"פרה" :2055,"טהרות" :2056,"מקואות" :2057,"נידה" :2058,"מכשירין" :2059,"זבים" :2060,"טבול יום" :2061,"ידיים" :2062,"עוקצים" :2063,"בכורים" :2011,}

books = [["בראשית"] , ["שמות"] , ["ויקרא", "ויק'"] , ["במדבר"] , ["דברים","דברי'"] , ["יהושע"] , ["שופטים"] , ["שמואל א", "ש''א", 'ש"א'] , ["שמואל ב", "ש''ב", 'ש"ב'] , ["מלכים א", "מ''א", "מלכים א'"] , ["מלכים ב", "מ''ב", "מלכים ב'"] , ["ישעיהו","ישעיה", "ישעי'"] , ["ירמיהו", "ירמיה"] , ["יחזקאל"] , ["הושע"] , ["יואל"] , ["עמוס"] , ["עבדיה","עובדיה"] , ["יונה"] , ["מיכה"] , ["נחום"] , ["חבקוק"] , ["צפניה"] , ["חגי"] , ["זכריה"] , ["מלאכי"] , ["תהלים", "תהילים"]  , ["משלי"] , ["איוב"], ["שיר השירים", "שה''ש"] , ["רות"] , ["איכה"] , ["קהלת", "קהל'"] , ["אסתר"] , ["דניאל"] , ["עזרא"] , ["נחמיה"] , ["דברי הימים א", 'דהי"א', "דה''א"] , ["דברי הימים ב", 'דהי"ב', "דה''ב"]]

function get_book(name) {
    found = false
    bnid = 0
    book_res = ''
    $.each(books, function( index, value ) {
        $.each(value, function( index2, book ) {                
            var re = new RegExp("(\\s|^|\\()"+book+"[\\s]|[\\$]");
            if((b_index = name.search(re))>-1) {
                book_res = book;
                bnid = index + 1;
                found = true;
                return false;
            }
        })
        if(found) {
            return false;
        }
    })
    return [bnid, book_res];
}

function get_bavli(name){ 
    found = false
    nid = 0
    book_res = ''
    $.each(bavli, function(key, value) { 
        if(name.search(key)>-1) {
            nid = value
            book_res = key
            return false;
        }
    });
    return [nid, book_res];
}

String.prototype.replaceAll = function (find, replace) {
    var str = this;
    return str.replace(new RegExp(find.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&'), 'g'), replace);
};


function set_match(match, first, nid, p, ps) {
    //console.log(first+match + " " + nid + " " + p + " " + ps)
//    var match_re = new RegExp('[>]'+match);
//    if ($(selector).html().search(match_re)>-1) {
//        return false;
//    }
    s = "<span class='al' style='color:#0000ff;' onclick='lnn("+nid+","+p+","+ps+")'>"+match+"</span>"
    $.match_page = $.match_page.replaceAll(first+match, first+s)
    return true;
}

function check_internal(word) {
    if (!word) {
        return false;
    }
    if (word.search('לעיל')>-1 || word.search('להלן')>-1 || word.search('לקמן')>-1 || word.search('למעלה')>-1 || word.search('למטה')>-1 ) {    
        return true;
    }
    return false;
}

function scrollToAnchor(aid){    
    var aTag = $("[name='aaa"+aid+"']");
    $('html,body').animate({scrollTop: aTag.offset().top-90},'fast');
}

function set_match_pasuk(match, ps) {
    //console.log(match + " " + ps)
    s = "<a class='al' onclick='scrollToAnchor("+ps+")'>"+match+"</a>"
    $.match_page = $.match_page.replaceAll(match, s)
}

function check_match(match) {
//   try{
        first_word = match.match(first_word_pattern);
        if (first_word) {
            first_word = first_word[0]
        }
        else {
            first_word = "";
        }
        match = match.match(inside_pattern)[0];
        orig_match = match
        orig_first_word = first_word.slice(0,first_word.length-1)
        match = match.replace("(עי' ", '(');
        match = match.replace("דף ", '');
        match = match.replace("בספר ", '');
        //console.log(match + " - " + first_word);
        found = false;
        match = match.replace(/\(\s*/gi,'');
        match = match.replace(/\s*\)/gi,'');
        match = match.trim() 

        // mishna
        if((match.search('פ"')>-1 && match.search('מ"')>-1) || (match.search("פ'")>-1 && match.search("מ'")>-1)){
            match = match.replace('משנה ','');
            arr = match.split(" ");
            if (!(arr[0] in mishna)) {
                console.log("not in mishna "+arr[0]);
            }
            rnid = mishna[arr[0]];
            p = -1;
            m = -1
            perek = arr[1].replace('פ"',"");
            perek = perek.replace("פ''","");
            p = get_gimatria(perek)-1;
            if (p==-2)
            {
                console.log("bad gimatria: "+ perek+" --- "+match)
                return true;
            }
            halacha = arr[2].replace("מ''","");
            halacha = halacha.replace('מ"',"");
            m = get_gimatria(halacha)-1;
            if (m==-2)
            {
                console.log("bad gimatria: "+ halacha+" --- "+match)
                return true;
            }
            set_match(orig_match, orig_first_word, rnid, p, m);
            return true;
        }
        
        // yerushalmi
        if(match.search('פ"')>-1 && match.search('ה"')>-1){
            //console.log(match);
            match = match.replace('ירושלמי ','');
            arr = match.split(" ");
            rnid = yerushalmi[arr[0]];
            p = -1;
            h = -1
            perek = arr[1].replace('פ"',"");
            p = get_gimatria(perek)-1;
            if (p==-2)
            {
                console.log("bad gimatria: "+ perek+" --- "+match)
                return true;
            }
            halacha = arr[2].replace('ה"',"");
            h = get_gimatria(halacha)-1;
            if (h==-2)
            {
                console.log("bad gimatria: "+ halacha+" --- "+match)
                return true;
            }
            //console.log(rnid+' '+p+' '+h);
            rnid=rnid+p
            set_match(orig_match, orig_first_word, rnid, h, 0);
            return true;
        }
        arr = match.split(" ");
        //שם
        if (arr[0].search('שם')==0 && $.last_nid) {
            match = match.replace(/\./g, " ");
            match = match.replace("  ",' ');
            arr = match.split(" ");
            p = ps = 0;
            if (arr.length > 1) {
                if (arr[1].search('פסוק')>-1) {
                    if (arr.length > 2) {
                        p = get_gimatria(arr[2])-1;
                        if (p==-2)
                        {
                            console.log("bad gimatria: "+ arr[2]+" --- "+match)
                            return true;
                        }            
                        $.last_pasuk = p
                    }
                    else {
                        $.last_pasuk = $.last_perek = -1
                        $.last_nid = -1;
                        return true;
                    }
                }
                else if (!arr[1].search('שם')==0) {
                    p = get_gimatria(arr[1])-1;
                    if (p==-2)
                    {
                        console.log("bad gimatria: "+ arr[1]+" --- "+match)
                        return true;
                    }
                    if (($.last_nid >450000 && $.last_nid <450100) || ($.last_nid >1450000&&$.last_nid <1450100)) {
                        p = (p-2) * 2;
                        if (arr[0].match(':')) {
                            p = p + 1;
                        }
                        else if (arr[0].match(',') && arr.length > 1 && arr[1].match('ב')) {
                            p = p + 1;
                        }                    
                    }
                    $.last_perek = p
                    if (arr.length > 2) {
                        if (!(arr[2].search('שם')==0)) {
                            p = get_gimatria(arr[2])-1;
                            if (p==-2)
                            {
                                console.log("bad gimatria: "+ arr[2]+" --- "+match)
                                return true;
                            }            
                            $.last_pasuk = p
                        }
                    }
                    else {
                        $.last_pasuk = p = 0;
                    }
                }
                else {
                    if (arr.length > 2) {
                        if (!(arr[2].search('שם')==0)) {
                            p = get_gimatria(arr[2])-1;
                            if (p==-2)
                            {
                                console.log("bad gimatria: "+ arr[2]+" --- "+match)
                                return true;
                            }            
                            $.last_pasuk = p
                        }
                    }
                    else {
                        $.last_pasuk = p = 0;
                    }                
                }
            }
            if ($.last_nid && $.last_perek > -1 && $.last_pasuk > -1) {
                set_match(orig_match, orig_first_word, $.last_nid, $.last_perek, $.last_pasuk);
                return true;
            }
            else {
                console.log("error in set match: "+ orig_match +" - "+ $.last_nid +"  "+ $.last_perek +" "+$.last_pasuk)

            }
        }
        // bavli 
        r = get_bavli(first_word +' '+match)
        if (r[0]) {
            match = match.replace(r[1]+" ","")
            arr = match.split(" ");
            if(!arr.length) {
                return true;
            }
            p = get_gimatria(arr[0]);
            if (p==-1)
            {
                console.log("bad gimatria: "+ arr[1]+" --- "+match);
                return true;
            }            
            p = (p-2) * 2;
            if (arr[0].match(':')) {
                p = p + 1;
            }
            else if (arr[0].match(',') && arr.length > 1 && arr[1].match('ב')) {
                p = p + 1;
            }
            set_match(orig_match, orig_first_word, r[0], p, 0);
            $.last_nid = r[0];
            $.last_perek = p;
            $.last_pasuk = 0;
            return true;
        }
        
        r = get_book(first_word +' '+match);
        if(r[0]) {
            match = match.replace(r[1]+" ","")
            match = match.replace(/\./gi,' ');
            match = match.replace("  ",' ');
            arr = match.split(" ");
            found = true;
            p=ps=1;
            p = get_gimatria(arr[0]) - 1;
            if (p==-2)
            {
                console.log("bad gimatria: "+ arr[1]+" --- "+match)
                return true;
            }
            if(arr.length > 1) {
                ps = get_gimatria(arr[1]) - 1;
                if (ps==-2)
                {
                    console.log("bad gimatria: "+ arr[2]+" --- "+match)
                    return true;
                }
            }
            set_match(orig_match, orig_first_word, r[0], p, ps);
            $.last_nid = r[0];
            $.last_perek = p;
            $.last_pasuk = ps;
            return true;
        }
        arr = match.split(" ");
        if(check_internal(first_word)){
            arr.unshift(first_word);
        }
        if (check_internal(arr[0])) {
            $.last_pasuk = 0;
            if (arr[1].search('פסוק')>-1) {
                $.last_pasuk = get_gimatria(arr[2]) - 1;
                if ($.last_pasuk==-2)
                {
                    $.last_pasuk=0;
                    console.log("bad gimatria: "+ arr[2]+" --- "+match)
                    return true;
                }

                set_match_pasuk(orig_match, $.last_pasuk)
                return true;                    
            }
            $.last_perek = get_gimatria(arr[1]) - 1;
            if ($.last_perek==-2)
            {
                $.last_perek=0;
                console.log("bad gimatria: "+ arr[1]+" --- "+match)
                return true;
            }
            if ((getnid() >450000 && getnid() <450100) || (getnid() >1450000&&getnid() <1450100)) {
                $.last_perek = ($.last_perek-2) * 2;
                if (arr[1].match(':')) {
                    $.last_perek = $.last_perek + 1;
                }
                else if (arr[1].match(',') && arr.length > 2 && arr[2].match('ב')) {
                    $.last_perek = $.last_perek + 1;
                }                    
            }

            if (arr.length > 2) {
                $.last_pasuk = get_gimatria(arr[2]) - 1;
                if ($.last_pasuk==-2)
                {
                    $.last_pasuk=0;
                    console.log("bad gimatria: "+ arr[2]+" --- "+match)
                    return true;
                }
            }
            set_match(orig_match, orig_first_word, getnid(), $.last_perek, $.last_pasuk);
            return true;
        }
        $.last_nid = 0;
        $.last_perek = 0;
        $.last_pasuk = 0;
        
//       }
//        catch(err)
//        {
//            console.log(err);
//        }    
}

function initjump () {
    if($.jinit) {return}
    $.jinit = true;
    $.match_page = $(selector).html()
    //rep = RegExp( /\<span\s.*lnn.*\"\>(.*)\<\/span\>/gi)    
    //$.match_page = $.match_page.replace(rep, '$1')
    //rep = RegExp( /\<!--.*--\>/gi)
    //$.match_page = $.match_page.replace(rep, '')
    //$.match_page = $.match_page.replaceAll('{','(')
    //$.match_page = $.match_page.replaceAll('}',')')
    $.last_nid = 0;
    $.last_perek = 0;
    $.last_pasuk = 0;
    res = $.match_page.match(all_patern)
    $.each(res, function( index, match ) {     
        //console.log(match);
        return check_match(match);
    })
    $(selector).html($.match_page)
}
