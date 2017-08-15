stf = '[\u0591-\u05c7]*'
VERSION = '2'
_OFFSET = -100
console = new Object();
console.log = function(log) {
  var iframe = document.createElement("IFRAME");
  iframe.setAttribute("src", "ios-log:#iOS#" + log);
  document.documentElement.appendChild(iframe);
  iframe.parentNode.removeChild(iframe);
  iframe = null;    
}
console.debug = console.log;
console.info = console.log;
console.warn = console.log;
console.error = console.log;

mef = {
    85 : "אבן ישראל על סדר הרמב''ם",
    224 : "אהל יצחק",
    219 : "אהלי יצחק",
    86 : "אור גדול",
    70 : "אור הישר",
    162 : "אור יקרות",
    87 : "אור פני משה",
    279 : "אורח מישור",
    95 : "אמרי אמת",
    115 : "ארץ יהודה",
    282 : "אשדות הפסגה",
    182 : "אשר לשלמה",
    106 : "בגדי ישע",
    122 : "בד קודש",
    291 : "בית אברהם-אברהם אבלי",
    84 : "בית אב",
    107 : "בית לוי",
    210 : "בן הרמה",
    97 : "בן ידיד",
    256 : "בני אהובה",
    137 : "בני ולחם יהודה",
    228 : "בני שמואל",
    108 : "בנין הלכה",
    124 : "בנין שלמה",
    204 : "בתי כהונה",
    233 : "גירסא דינקותא",
    53 : "דברי ירמיהו",
    141 : "דעת ומחשבה ",
    280 : "דת אש",
    199 : "הגהות הרה''ג יוסף שאול נאטאנזאן - על שער המלך",
    147 : "הגהות עמק המלך",
    202 : "הדרך לתשובה",
    277 : "וזאת ליהודה",
    56 : "זיו משנה",
    208 : "זכור לאברהם",
    270 : "זכותא דאברהם",
    109 : "זכר ישעיהו",
    174 : "זרע אברהם",
    81 : "חדושים ומקורים מהרב צבי הירש חיות זצל",
    249 : "חדות יעקב",
    155 : "חוקי חיים ",
    235 : "חידושים מהגאון בעל מחנה אפרים",
    225 : "חלק יעקב",
    289 : "חסד לאברהם",
    187 : "חק נתן",
    75 : "יד איתן על היד החזקה",
    178 : "יוסף חי",
    284 : "יכהן פאר",
    164 : "ימי שלמה",
    188 : "ישועות מלכו",
    216 : "ישמח ישראל",
    189 : "יתר הבז",
    165 : "כפי אהרן",
    173 : "כרוב ממשח מוהר''ר חיים אלפסי",
    220 : "כרם חמד",
    223 : "כתר תורה-קאדני",
    149 : "לב מבין",
    76 : "לב שלם",
    101 : "לחם משנה",
    283 : "לחם שמים",
    131 : "לי לישועה",
    158 : "לשון ערומים",
    181 : "מאמר המלך",
    71 : "מאמר מרדכי",
    272 : "מגיד משנה על הלכות שחיטה",
    102 : "מגן שאול",
    142 : "מדות ודעות",
    145 : "מוסר ודעת",
    205 : "מחנה ישראל מוה''ר משה ישראל",
    276 : "מחנה ישראל מוהר''ר אליהו ישראל",
    203 : "מירא דכייא",
    171 : "מלך שלם",
    128 : "מעשה חושב - על שער המלך",
    111 : "מעשה נסים",
    72 : "מעשה רב",
    60 : "מעשה רקח",
    83 : "מראה הנוגה",
    61 : "מרכבת המשנה - אלפנדארי",
    267 : "משנה לחם",
    73 : "משנת יעקב",
    62 : "משרת משה-עטייה",
    258 : "משרת משה-נבר",
    274 : "נאם דוד",
    129 : "נחל איתן",
    227 : "נר שמואל ח''א",
    240 : "ספר המנוחה",
    268 : "עבודת הלוי",
    63 : "עבודת המלך",
    247 : "עין אליעזר",
    248 : "עין ימין",
    264 : "עין מאיר",
    118 : "עיני דוד",
    185 : "עץ החיים",
    262 : "פארי הלכות",
    213 : "פני המלך",
    255 : "פקודת המלך",
    64 : "פרי האדמה",
    192 : "צמח דוד",
    156 : "צרור החיים",
    114 : "צרור הכסף",
    263 : "קדושת יום טוב",
    234 : "קהלת יעקב",
    236 : "קול יעקב",
    250 : "קרבן חגיגה",
    133 : "ראשון לציון",
    269 : "רדבז",
    177 : "רוח אליהו",
    229 : "שארית יעקב",
    206 : "שדה הארץ",
    194 : "שו''ת ברוך השם",
    66 : "שו''ת הרדב''ז",
    159 : "שו''ת הרמב''ם",
    176 : "שו''ת ר' יהושע הנגיד",
    232 : "שופריה דיעקב",
    217 : "שי למלך",
    93 : "שלל דוד",
    167 : "שלמי תודה",
    104 : "שם יוסף",
    105 : "שמן המשחה",
    136 : "שער המלך",
    193 : "שער יאודה",
    222 : "שתי ידות",
    243 : "תבואת שמש",
    94 : "תורת ישראל",
    226 : "אבני שהם",
    190 : "אברהם יגל",
    221 : "אדמת יהודה",
    50 : "אדני יד החזקה",
    242 : "אהל יוסף",
    197 : "אהל משה",
    153 : "אהלי יאודה",
    121 : "אהלי יהודה",
    51 : "אוצר המלך",
    281 : "אור פני מלך",
    67 : "אור שמח",
    230 : "אורה ושמחה",
    74 : "אם הבנים",
    52 : "אמונה ותורה",
    135 : "אמר יוסף",
    195 : "אפריון שלמה - על שער המלך",
    77 : "באר אליעזר",
    160 : "בארת המים",
    244 : "בינה לעתים",
    261 : "בית אבי-גדר",
    163 : "בית המלך",
    246 : "בית הראה",
    123 : "בית ישחק",
    184 : "בית מועד",
    96 : "בן אברהם",
    245 : "בן שלמה",
    78 : "בני בנימין",
    140 : "בני דוד",
    168 : "בני חיי",
    201 : "בני יוסף",
    154 : "בנין יהושע",
    238 : "בקע לגלגלת ",
    211 : "ברכת אברהם",
    215 : "גופי הלכות",
    88 : "גור אריה",
    146 : "גושפנקא דמלכא",
    54 : "דברים נחמדים",
    209 : "דבש תמר",
    285 : "דין אמת",
    89 : "דרך המלך פירוש הקצר",
    98 : "הגהות וחדושים ר' עקיבא אייגר",
    241 : "הד משה",
    148 : "הלכות עולם",
    69 : "המאיר לארץ",
    251 : "הר המר",
    55 : "ויקח אברהם",
    271 : "זבחים שלמים",
    150 : "זכרון יעקב",
    260 : "זכרון מלך",
    99 : "חידושי מהרא''ך",
    196 : "חידושים ומקורים מהרב זלמן מווילנא זצ''ל",
    90 : "חיים ומלך",
    273 : "חיל המלך",
    266 : "חסדי יהונתן",
    292 : "טהרת ישראל",
    125 : "טעם המלך - על שער המלך",
    100 : "יד המלך - פאלומבו",
    68 : "יד יעב''ץ",
    175 : "יד יצחק",
    139 : "יד שלמה",
    170 : "ידי אליהו",
    183 : "ידיו של משה",
    57 : "יצחק ירנן",
    82 : "ישועה בישראל",
    58 : "כסף משנה",
    172 : "כרוב ממשח מוהר''ר שלמה אלפסי",
    287 : "כתונת יוסף",
    218 : "כתר תורה-בן הקדושת לוי",
    257 : "לבב דוד",
    126 : "לחם אבירים",
    138 : "לחם יהודה",
    253 : "לחקרי הלכות",
    80 : "ליקוטי חבר בן חיים",
    119 : "לקוטי שלמה",
    110 : "לשד השמן",
    212 : "מגדל חננאל",
    59 : "מגדל עוז",
    231 : "מגיד משנה",
    143 : "מוסר השכל - לשון הזהב",
    144 : "מוסר השכל - לשון חכמים ",
    275 : "מזל שעה",
    207 : "מחנה דן",
    116 : "מחנה יהודה",
    286 : "מטה אשר",
    91 : "מים חיים",
    200 : "מים שאל",
    132 : "מכתם לדוד",
    127 : "מלאכת שלמה",
    152 : "מצא חן",
    79 : "מקורי הרמב''ם לרש''ש",
    92 : "מרכבת המשנה",
    191 : "מרפא לשון",
    103 : "משנה למלך",
    254 : "נאוה קודש",
    151 : "נוה צדק",
    186 : "נוה שלום",
    120 : "נוה שלום-איזראעלסאן",
    117 : "נתיב מאיר",
    130 : "נתיבות חיים",
    169 : "סוכת דוד",
    179 : "עדות ביהוסף",
    180 : "עין תרשיש",
    288 : "עיני אברהם",
    112 : "פרי הארץ",
    113 : "פרי עץ חיים",
    198 : "צדקה לחיים",
    65 : "קובץ על יד החזקה",
    252 : "קונטרס דרך המלך-לוין",
    166 : "קרבן אשה",
    265 : "ראש פינה",
    239 : "שביתת יום טוב",
    157 : "שהם וישפה",
    214 : "שערי שמים",
    134 : "תבואת יקב",
    278 : "תורת הנזיר",
    161 : "תורת משה",
    259 : "תפארת מנחם",
    290 : "תקנת עזרא",
    237 : "תשובות חד מקמאי",
}

global_nid = 0;
console.log("start")
wcolor = {
"t1" : "#cc6600", "t2" : "#3399cc", "t3" : "#cc66ff", "t4" : "#32ff32", "t5" : "#999933", "t6" : "#42C9CC", "t7" : "#996699", "t8" : "#993333", "t9" : "#ff9999", "t10" : "#cc0000", "t11" : "#6600ff", "t12" : "#ff3300", "t14" : "#cc6600", "t15" : "#3399cc", "t17" : "#cc6600", "t18" : "#3399cc", "t20" : "#cc6600", "t21" : "#3399cc", "t23" : "#3399cc", "t28" : "#999933", "t29" : "#42C9CC", "t30" : "#996699", "t31" : "#993333", 
}

bcolor = {
"t1" : "#cc6600", "t2" : "#3399cc", "t3" : "#cc66ff", "t4" : "#00ff00", "t5" : "#999933", "t6" : "#66ffcc", "t7" : "#996699", "t8" : "#993333", "t9" : "#ff9999", "t10" : "#cc0000", "t11" : "#6600ff", "t12" : "#ff3300", "t14" : "#cc0000", "t15" : "#6600ff", "t17" : "#cc0000", "t18" : "#6600ff", "t20" : "#cc0000", "t21" : "#6600ff", "t23" : "#6600ff", "t28" : "#999933", "t29" : "#66ffcc", "t30" : "#996699", "t31" : "#993333", 
}


bgcolor = {
"s1": "#cc6600", "s2": "#3399cc", "s3": "#cc66ff", "s4": "#00ff00", "s5": "#999933", "s6": "#66ffcc", "s7": "#996699", "s8": "#993333", "s9": "#ff9999", "s10": "#cc0000", "s11": "#6600ff", "s12": "#ff3300", "s14": "#ff3300", "s15": "#6600ff", "s17": "#ff3300", "s18": "#6600ff", "s20": "#ff3300", "s21": "#6600ff", "s23": "#6600ff", "s28": "#999933", "s29": "#66ffcc", "s30": "#996699", "s31": "#993333", 
}


// First, checks if it isn't implemented yet.
if (!String.prototype.format) {
    String.prototype.format = function() {
        var args = arguments;
        return this.replace(/{(\d+)}/g, function(match, number) {
                            return typeof args[number] != 'undefined'
                            ? args[number]
                            : match
                            ;
                            });
    };
}


function fname(args) 
{
   var myName = args.callee.toString();
   myName = myName.substr('function '.length);
   myName = myName.substr(0, myName.indexOf('('));
   return myName
}

pname = ["", "אונק'", "ת' יהונתן", "רש''י", "רמב''ן", "אבן עזרא", "ספורנו", "בעל הטורים", "אור החיים", "תורה תמימה", "מ' דוד", "מ' ציון", "רלב'ג","","רע'ב","תוי'ט","","רש''י","תוס'","","מ''ב","ביאור הלכה","","תרגום","","","הכפלת פסוקים","","שפתי חכמים","כלי יקר","מלבים תוכן","מלבים פ' מילות",""];

function setnifname(){
    d=new String('אבגדהוזחטיךכלםמןנסעףפץצקרשת')
    s=new String($("#nifname")[0].value);
    $(".ot").hide();
    $("#shem").html()
    for (i=0; i < s.length; i++){
        c = s.charAt(i);
        if(d.search(c)>-1){
            c=c.replace("ם","מ")
            c=c.replace("ן","נ")
            c=c.replace("ץ","צ")
            c=c.replace("ף","פ")
            c=c.replace("ך","כ")
            $("#shem").append($("#ot"+d.search(c)).html()+'<br/>');
        }
        //Process char
    }
}

/*
(C) www.dhtmlgoodies.com, September 2005

This is a script from www.dhtmlgoodies.com. You will find this and a lot of other scripts at our website.	

Terms of use:
You are free to use this script as long as the copyright message is kept intact. However, you may not
redistribute, sell or repost it without our permission.

Thank you!

www.dhtmlgoodies.com
Alf Magne Kalleland

*/	
function showHideAnswer()
{
	var numericID = this.id.replace(/[^\d]/g,'');
	var obj = document.getElementById('a' + numericID);
	if(obj.style.display=='block'){
		obj.style.display='none';
	}else{
		obj.style.display='block';
	}

}


function initShowHideContent()
{
    $(".expander").click(function() {
        if ($(this).hasClass("expander")) {
            $(this).removeClass("expander");
        }
        else {
             $(this).addClass("expander");
        }
    });
	var divs = document.getElementsByTagName('DIV');
	for(var no=0;no<divs.length;no++){
		if(divs[no].className=='question'){
			divs[no].onclick = showHideAnswer;
		}	
		if(divs[no].className=='rashiq'){
			divs[no].onclick = showHideAnswer;
		}	
		if(divs[no].className=='tosfotq'){
			divs[no].onclick = showHideAnswer;
		}	
		if(divs[no].className=='bothq'){
			divs[no].onclick = showHideAnswer;
		}	
		if(divs[no].className=='answer'){
			divs[no].onclick = showHideAnswer;
		}	
		if(divs[no].className=='fq'){
			divs[no].onclick = showHideAnswer;
		}	
		if(	divs[no].className=='tfilaq'){
			divs[no].onclick = showHideAnswer;
		}	
		
	}
}

function isnightmode() {
    return $("d").css('background-color')=='rgb(0, 0, 0)';
}

function initcolor() {
	$(".al").css("color","blue");
    if(is_color_mode()) {
        d=wcolor;
        if (isnightmode()) {
            d=bcolor;
        }
        else {
            $.each( bgcolor, function( key, value ) {
                $(key).css("background-color", value );
            });

        }
        $.each( d, function( key, value ) {
            $(key).css("color", value );
        });
   }
   else {
        d=wcolor;
        if (isnightmode()) {
            $.each( d, function( key, value ) {
                $(key).css("color", '#FFFF00' );
            });
            
        }   
        else {
            $.each( d, function( key, value ) {
                $(key).css("color", '#000000' );
            });
            $.each( bgcolor, function( key, value ) {
                $(key).css("background-color", "#000000" );
            });
        }
   }
}

function is_color_mode() {
    color = false;
    try {
        color = $.storage.get('color_mode');
    }
    catch(error){
        color = false;
    }
    //alert(color);

    return color;
}

function toggle_color_mode() {
    color = is_color_mode();
    $.storage.set('color_mode', !color);
    initcolor();
}

function get_mefaresh_show(mef_id) {
    show = true;
    try {
        show = $.storage.get('mef'+mef_id);
    }
    catch(error){
        show = false;
    }
    return show;
}

function toggle_mefaresh_show(mef_id) {
    show = get_mefaresh_show(mef_id);
    $.storage.set('mef'+mef_id, !show)
    if(show) {
        $('s'+mef_id).hide()
        $('t'+mef_id).hide()
        $('.t'+mef_id).hide()
    }
    else {
        $('s'+mef_id).show()
        $('t'+mef_id).show()
        $('.t'+mef_id).show()
    }
}

function initmef() {
    $(".pid").each(function(){
                    i=($(this).attr('id'));
                    show = get_mefaresh_show(i);
                    if(!show) {
                        $('s'+i).hide()
                        $('t'+i).hide()
                        $('.t'+i).hide();
                    }
                   })
    $( "ps" ).click(function() {
        $( this ).parent().find('*').show();
    }); 
    $( "ps" ).css('text-decoration', 'underline');
    $( "ps" ).css('border-bottom-color', 'blue');
}

function showall(show) {
    $(".pid").each(function(){
                   i=($(this).attr('id'));
                   if(!show) {
                    $('s'+i).hide()
                    $('t'+i).hide()
                   }
                   else {
                   $('s'+i).show()
                   $('t'+i).show()
                   
                   }
                   })
    
}

function openmenu() {
    menu();
    $('#mypanel').panel( "open");
}

function closemenu() {
    $('#mypanel').panel( "close");
}

function menu() {
    s='<ul data-role="listview"><li><input id="btn0" type="button" value="Close menu" onclick=closemenu()></li><li><input id="btn1" type="button" value="Show All" onclick=showall(1)></li><li><input id="btn2" type="button" value="Hide All" onclick=showall(0)></li>';
    $(".pid").each(function(){
                   i=($(this).attr('id'));
                   show = get_mefaresh_show(i);
                   if(show) {
                    h_sel = ''
                    s_sel = 'selected'
                   }
                   else {
                   h_sel = 'selected'
                   s_sel = ''
                   
                   }
                   p = pname[parseInt(i)];
                   s+='<li style="height:150px"><div class="f" data-role="fieldcontain"><label class="mmm" for="flip-{0}">{1}</label><select name="slider" id="flip-{0}" data-role="slider" onchange="toggle_mefaresh_show({0});"><option value="off" {2}>Hide</option><option value="on" {3}>Show</option></select></div></li>'.format(i,p,h_sel,s_sel);
                   
                   })
                   color = is_color_mode();
                   if(color) {
                    b_sel = ''
                    c_sel = 'selected'
                   }
                   else {
                   b_sel = 'selected'
                   c_sel = ''
                   
                   }
                   s+='<li style="height:150px"><div class="f" data-role="fieldcontain"><label class="mmm" for="flip-color">צביעת פרשנים</label><select name="slider" id="flip-color" data-role="slider" onchange="toggle_color_mode();"><option value="off" {0}>שחור</option><option value="on" {1}>צבע</option></select></div></li>'.format(b_sel,c_sel);
    
    s+='</ul>'
    $('#mypanel').panel();
    $('#mypanel').html(s);
    $('label').css('font-size', '50px')
    $("#btn1").css('font-size','150px');
    $('body').trigger('create');
    //alert($('#mypanel').html());
}

function initver() {
    ver = '1'
    try {
        ver = $.storage.get('version');
    }
    catch(error){
        ver = '1'
    }
    if(!ver) {
        ver = '1'    
    }
    if (ver!=VERSION) {
        for (i=0;i<pname.length; i++) {
            $.storage.set('mef'+i, true)
        }
        $.storage.set('version', VERSION)
    }
}


function init(nid) {
	$.srch_ind=0;
    global_nid = nid;
    console.log("nid: "+global_nid);
    $.storage = new $.store();
    //initver();
	initShowHideContent();
	//initcolor();
    //initmef();
    //menu();
    //initjump();
    return 1;
}

function getnid() {
    return global_nid;
}

function lnn(nid,l,p){
	window.location = 'myapp:lnn:'+nid+':'+l+':'+p;
}

function lnns(nid,l,p){
	window.location = 'myapp:lnns:'+nid+':'+l+':'+p;
}

function disableselection() {
	console.log(fname(arguments));
    $(".d").attr('unselectable','on')
        .css({'-moz-user-select':'-moz-none',
           '-moz-user-select':'none',
           '-o-user-select':'none',
           '-khtml-user-select':'none', /* you could also put this in a class */
           '-webkit-user-select':'none',/* and add the CSS class here instead */
           '-ms-user-select':'none',
           'user-select':'none'
        }).bind('selectstart', function(){ return false; });
}

function performSearch(sers) {
	//console.log(fname(arguments));
	$.srch_ind=0;
	$(".srcc").contents().unwrap();
    if(sers=='') {
        return;
    }
    revowels = sers.split('').join(stf)+stf
	var textToReplace =  $('body').html();
	var re = new RegExp('('+revowels+')', 'g');
    textToReplace = textToReplace.replace(re,'<span class="srcc" style="background-color:yellow;">$1</span>');
    $('body').html(textToReplace);
    offset = $(".srcc").first().offset().top + (_OFFSET);
    console.log(offset);
	if($(".srcc").length){
        alert("bb");
		$('html, body').animate({
                        scrollTop: offset
        });
	}
}

function performSearchns(sers) {
	//console.log(fname(arguments));
    if(sers=='') {
        return;
    }
    revowels = sers.split('').join(stf)+stf
	var textToReplace =  $('body').html();
	var re = new RegExp('('+revowels+')', 'g');
    textToReplace = textToReplace.replace(re,'<span class="srcc" style="background-color:yellow;">$1</span>');
    $('body').html(textToReplace);
    }

function sprev() {
	//console.log(fname(arguments));
	if($.srch_ind==0) {
		$.srch_ind=$(".srcc").length-1
	}
	else {
		$.srch_ind-=1;
	}
    offset = $(".srcc").eq($.srch_ind).offset().top + (_OFFSET);
    console.log(offset);
	$('html, body').animate({
					scrollTop: offset
	});
}

function snext() {
	//console.log(fname(arguments));
	if($.srch_ind==$(".srcc").length-1) {
		$.srch_ind=0
	}
	else {
		$.srch_ind+=1;
	}
    offset = $(".srcc").eq($.srch_ind).offset().top + (_OFFSET);
    console.log(offset);
	$('html, body').animate({
					scrollTop: offset
	});
}

/*
function addserelem(place, , searchstr, content, nid, chap, pasuk) {
    alert(place);
	console.log(fname(arguments));
    $.numser += 1;
    $('#seruld ul').append("<li><a onclick='lnns("+nid+","+chap+","+pasuk+",\""+searchstr+"\")'><p><i>+place+</i></p><p><strong>"+content+"</strong></p></a></li>");$("#seruld ul").listview('refresh');$('#one').trigger('create');
    $('#scount').html("נמצאו "+$.numser+" תוצאות");
}
*/
$._s=false;

function stopsearch() {
	console.log($._s);
    $._s=true;
    $("#bb").text("החיפוש נעצר")
}

function sercount(n,c) {
	console.log(fname(arguments));
    $('#scount').html("נמצאו "+n+" תוצאות");
	console.log(c);
    if($._s)
    {
        return;
    }
    setTimeout(function() {window.location = 'myapp:contser:'+c+':'+n},10)
	
}

