@STATIC;1.0;p;6;main.jt;529;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;10;CPBundle.ji;20;CPView+Transitions.ji;18;CPView+sizeToFit.ji;21;CPNumber+Formatting.ji;15;AppController.jt;354;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("CPBundle.j",YES);
objj_executeFile("CPView+Transitions.j",YES);
objj_executeFile("CPView+sizeToFit.j",YES);
objj_executeFile("CPNumber+Formatting.j",YES);
objj_executeFile("AppController.j",YES);
main=function(_1,_2){
CPApplicationMain(_1,_2);
};
p;10;CPBundle.jt;2970;@STATIC;1.0;I;22;AppKit/CPApplication.jt;2924;
objj_executeFile("AppKit/CPApplication.j",NO);
var _1;
CPLocalizedString=function(_2,_3){
return CPLocalizedStringFromTable(_2,nil,_3);
};
CPLocalizedStringFromTable=function(_4,_5,_6){
return CPLocalizedStringFromTableInBundle(_4,_5,objj_msgSend(CPBundle,"mainBundle"),_6);
};
CPLocalizedStringFromTableInBundle=function(_7,_8,_9,_a){
return objj_msgSend(_9,"localizedStringForKey:value:table:",_7,_7,_8);
};
var _b=objj_getClass("CPBundle");
if(!_b){
throw new SyntaxError("*** Could not find definition for class \"CPBundle\"");
}
var _c=_b.isa;
class_addMethods(_b,[new objj_method(sel_getUid("bundleLocale"),function(_d,_e){
with(_d){
return objj_msgSend(_d,"objectForInfoDictionaryKey:","CPBundleLocale")||objj_msgSend(_d,"bundleLocaleWithUserLanguage:",nil);
}
}),new objj_method(sel_getUid("localizedStringForKey:value:table:"),function(_f,_10,_11,_12,_13){
with(_f){
if(!_1){
_1=objj_msgSend(CPDictionary,"dictionary");
}
if(!_13){
_13="Localizable";
}
var _14=objj_msgSend(_1,"objectForKey:",_13);
if(!_14){
_14=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_1,"setObject:forKey:",_14,_13);
}
var _15=objj_msgSend(_14,"objectForKey:",_11);
if(!_15){
_15=_12;
objj_msgSend(_14,"setObject:forKey:",_15,_11);
}
return _15;
}
}),new objj_method(sel_getUid("setDictionary:forTable:"),function(_16,_17,_18,_19){
with(_16){
if(!_1){
_1=objj_msgSend(CPDictionary,"dictionary");
}
objj_msgSend(_1,"setObject:forKey:",_18,_19);
}
}),new objj_method(sel_getUid("bundleLocaleWithUserLanguage:"),function(_1a,_1b,_1c){
with(_1a){
var _1d=objj_msgSend(_1a,"objectForInfoDictionaryKey:","CPBundleDevelopmentRegion");
var _1e=objj_msgSend(_1a,"objectForInfoDictionaryKey:","CPBundleLocalizedResourceKeys");
var _1f,_20=nil;
if(objj_msgSend(_1e,"containsObject:",_1c)){
return _1c;
}
var _21=window.location.search,_22=_21&&_21.replace(/^.*lang=([^&]+)/i,"$1");
if(objj_msgSend(_1e,"containsObject:",_22)){
return _22;
}
if(objj_msgSend(_1e,"containsObject:",_22.substring(0,2))){
return _22.substring(0,2);
}
if(objj_msgSend(_1e,"containsObject:",objj_msgSend(_1a,"browserLanguage"))){
return objj_msgSend(_1a,"browserLanguage");
}
return objj_msgSend(_1d,"length")?_1d:"en";
}
}),new objj_method(sel_getUid("browserLanguage"),function(_23,_24){
with(_23){
return (navigator.language||navigator.userLanguage).substring(0,2);
}
})]);
window.LocaleCPApplicationMain=CPApplicationMain;
CPApplicationMain=function(_25,_26){
var _27=objj_msgSend(CPBundle,"mainBundle"),_28=objj_msgSend(_27,"bundleLocale");
if(_28){
var _29=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_27,"pathForResource:",_28+".lproj/Localizable.xstrings")),_2a=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_29,_2a);
var _2b=objj_msgSend(CPPropertyListSerialization,"propertyListFromData:format:",_2a,nil);
objj_msgSend(_27,"setDictionary:forTable:",_2b,"Localizable");
}
window.LocaleCPApplicationMain(_25,_26);
};
p;20;CPView+Transitions.jt;4033;@STATIC;1.0;I;15;AppKit/CPView.jI;20;AppKit/CPAnimation.jt;3969;
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("AppKit/CPAnimation.j",NO);
CPViewWillTransitionToSubview="CPViewWillTransitionToSubview";
CPViewDidTransitionToSubview="CPViewDidTransitionToSubview";
var _1=objj_getClass("CPView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("transitionFromSubview:toSubview:"),function(_3,_4,_5,_6){
with(_3){
objj_msgSend(_3,"transitionFromSubview:toSubview:adjustWidth:adjustHeight:animated:",_5,_6,YES,YES,YES);
}
}),new objj_method(sel_getUid("transitionFromSubview:toSubview:adjustWidth:adjustHeight:animated:"),function(_7,_8,_9,_a,_b,_c,_d){
with(_7){
if(_9===nil||_a===nil||objj_msgSend(_9,"isEqual:",_a)){
return;
}
var _e=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_a,"toSubview",_9,"fromSubview");
objj_msgSend(_7,"willTransitionFromSubview:toSubview:",_9,_a);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPViewWillTransitionToSubview,_7,_e);
if(!objj_msgSend(_7,"window")){
_d=NO;
}
var _f=objj_msgSend(_7,"window"),_10=_b?CGRectGetWidth(objj_msgSend(_a,"frame"))-CGRectGetWidth(objj_msgSend(_9,"frame")):0,_11=_c?CGRectGetHeight(objj_msgSend(_a,"frame"))-CGRectGetHeight(objj_msgSend(_9,"frame")):0,_12=_f&&objj_msgSend(_f,"frame").size,_13=_12&&CGSizeMake(_12.width+_10,_12.height+_11),_14=_f&&objj_msgSend(_f,"frame"),_15=_14&&CGRectMake(CGRectGetMidX(_14)-_13.width/2,CGRectGetMinY(_14),_13.width,_13.height);
if(_d){
var _16=objj_msgSend(_f,"animationResizeTime:",_15),_17=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithDuration:animationCurve:",_16,CPAnimationLinear);
var _18=objj_msgSend(CPMutableArray,"arrayWithObjects:",objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_9,CPViewAnimationTargetKey,objj_msgSend(_9,"frame"),CPViewAnimationStartFrameKey,objj_msgSend(_9,"frame"),CPViewAnimationEndFrameKey,CPViewAnimationFadeOutEffect,CPViewAnimationEffectKey),objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_a,CPViewAnimationTargetKey,objj_msgSend(_a,"frame"),CPViewAnimationStartFrameKey,objj_msgSend(_a,"frame"),CPViewAnimationEndFrameKey,CPViewAnimationFadeInEffect,CPViewAnimationEffectKey));
if(objj_msgSend(_a,"superview")===objj_msgSend(_9,"superview")){
var _19=_a;
while(_19=objj_msgSend(_19,"superview")){
var _1a=objj_msgSend(_19,"frame");
_1a.size=CGSizeMake(CGRectGetWidth(_1a)+_10,CGRectGetHeight(_1a)+_11);
objj_msgSend(_18,"addObject:",objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_19,CPViewAnimationTargetKey,objj_msgSend(_19,"frame"),CPViewAnimationStartFrameKey,_1a,CPViewAnimationEndFrameKey));
}
}
objj_msgSend(_17,"setViewAnimations:",_18);
objj_msgSend(_17,"startAnimation");
objj_msgSend(_f,"setFrame:display:animate:",_15,YES,YES);
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_16,_7,sel_getUid("_didTransitionWithTimer:"),_e,NO);
}else{
objj_msgSend(_9,"setHidden:",YES);
objj_msgSend(_a,"setHidden:",NO);
objj_msgSend(_f,"setFrame:display:animate:",_15,YES,NO);
objj_msgSend(_7,"_didTransitionWithUserInfo:",_e);
}
}
}),new objj_method(sel_getUid("_didTransitionWithTimer:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1b,"_didTransitionWithUserInfo:",objj_msgSend(_1d,"userInfo"));
}
}),new objj_method(sel_getUid("_didTransitionWithUserInfo:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(_1e,"didTransitionFromSubview:toSubview:",objj_msgSend(_20,"objectForKey:","fromSubview"),objj_msgSend(_20,"objectForKey:","toSubview"));
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",CPViewDidTransitionToSubview,_1e,_20);
}
}),new objj_method(sel_getUid("willTransitionFromSubview:toSubview:"),function(_21,_22,_23,_24){
with(_21){
}
}),new objj_method(sel_getUid("didTransitionFromSubview:toSubview:"),function(_25,_26,_27,_28){
with(_25){
}
})]);
p;18;CPView+sizeToFit.jt;2269;@STATIC;1.0;I;15;AppKit/CPView.jt;2230;
objj_executeFile("AppKit/CPView.j",NO);
CPViewInsetDefault="CPViewInsetDefault";
var _1=objj_getClass("CPView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("sizeToFit"),function(_3,_4){
with(_3){
objj_msgSend(_3,"sizeToFitWithInset:",CPViewInsetDefault);
}
}),new objj_method(sel_getUid("sizeToFitWithInset:"),function(_5,_6,_7){
with(_5){
objj_msgSend(_5,"sizeToFitWithInset:adjustWidth:adjustHeight:",_7,YES,YES);
}
}),new objj_method(sel_getUid("sizeToFitWithInset:adjustWidth:adjustHeight:"),function(_8,_9,_a,_b,_c){
with(_8){
if(!_b&&!_c){
return;
}
var _d=CGRectGetWidth(objj_msgSend(_8,"frame")),_e=CGRectGetHeight(objj_msgSend(_8,"frame"));
if(_a===CPViewInsetDefault){
_a=objj_msgSend(_8,"hasThemeAttribute:","content-inset")&&objj_msgSend(_8,"currentValueForThemeAttribute:","content-inset");
}
if(!_a){
_a=CGInsetMakeZero();
}
var _f=CGSizeMake(_a.left,_a.top),_10={origin:CGPointMakeZero(),size:_f},_11=CGSizeMakeZero();
for(var i=0,_12=objj_msgSend(_subviews,"count");i<_12;i++){
var _13=_subviews[i],_14=objj_msgSend(_13,"autoresizingMask");
if(objj_msgSend(_13,"isHidden")){
continue;
}
if(_14&CPViewMinYMargin){
var _15=CGRectIntersection(_10,objj_msgSend(_13,"frame"));
if(!CGRectIsEmpty(_15)){
_11.height+=CGRectGetHeight(_15);
}else{
_11.height+=CGRectGetHeight(objj_msgSend(_13,"frame"));
}
}else{
if(_14&CPViewMinXMargin){
var _15=CGRectIntersection(_10,objj_msgSend(_13,"frame"));
if(!CGRectIsEmpty(_15)){
_11.width+=CGRectGetWidth(_15);
}else{
_11.width+=CGRectGetWidth(objj_msgSend(_13,"frame"));
}
}else{
var _16=objj_msgSend(_13,"frame"),_17=CGRectGetMaxX(_16),_18=CGRectGetMaxY(_16);
if(_f.width<_17){
_f.width=_17;
}
if(_f.height<_18){
_f.height=_18;
}
}
}
objj_msgSend(_8,"setFrameSize:",CGSizeMake(_b?_f.width+_11.width:_d,_c?_f.height+_11.height:_e));
}
_f.width+=_11.width+_a.right;
_f.height+=_11.height+_a.bottom;
if(!_b){
_f.width=_d;
}
if(!_c){
_f.height=_e;
}
objj_msgSend(_8,"setFrameSize:",_f);
}
}),new objj_method(sel_getUid("hasThemeAttribute:"),function(_19,_1a,_1b){
with(_19){
return !!objj_msgSend(objj_msgSend(_19,"_themeAttributeDictionary"),"objectForKey:",_1b);
}
})]);
p;21;CPNumber+Formatting.jt;1212;@STATIC;1.0;t;1193;
var _1=1000;
var _2=objj_getClass("CPNumber");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPNumber\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("timeString"),function(_4,_5){
with(_4){
var _6=_4,_7=0,_8=0;
_8=FLOOR(_6/3600);
_6-=_8*3600;
_7=FLOOR(_6/60);
_6-=_7*60;
if(_8==0){
return objj_msgSend(CPString,"stringWithFormat:","%d:%02d",_7,_6);
}
return objj_msgSend(CPString,"stringWithFormat:","%d:%02d:%02d",_8,_7,_6);
}
}),new objj_method(sel_getUid("filesizeString"),function(_9,_a){
with(_9){
var _b=["B","KB","MB","GB","TB","PB"],_c=0,_d=_9,_e=nil;
if(_9>0){
_c=FLOOR(Math.log(_9)/Math.log(_1));
_d=FLOOR(10*_9/POW(_1,_c))/10;
}
_e=_b[_c]||objj_msgSend(_b,"lastObject");
return objj_msgSend(CPString,"stringWithFormat:","%@ %@",objj_msgSend(_d,"delimitedString"),_e);
}
}),new objj_method(sel_getUid("delimitedString"),function(_f,_10){
with(_f){
var _11=[],_12=_f;
while(_12>=1000){
var _13=FLOOR(_12/1000),_14=_12-(_13*1000);
_11.unshift(objj_msgSend(CPString,"stringWithFormat:","%03d",_14));
_12=_13;
}
if(_12||!objj_msgSend(_11,"count")){
_11.unshift(_12);
}
return objj_msgSend(_11,"componentsJoinedByString:",",");
}
})]);
p;15;AppController.jt;4696;@STATIC;1.0;I;21;Foundation/CPObject.ji;29;CPPlatformString+FirefoxFix.ji;44;LPLocationController-setLocationForObjects.ji;33;Controllers/MMManagerController.jt;4530;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("CPPlatformString+FirefoxFix.j",YES);
objj_executeFile("LPLocationController-setLocationForObjects.j",YES);
objj_executeFile("Controllers/MMManagerController.j",YES);
var _1=objj_allocateClassPair(CPObject,"AppController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("appWindow"),new objj_ivar("managerController")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_3,_4,_5){
with(_3){
CPLog.trace("[%@ -applicationDidFinishLaunching:] START",objj_msgSend(_3,"class"));
var _6=window.location.search,_7;
var _8=_6&&_6.match(/^.*X-Plex-Token=([^&]+)/i);
_7=_8&&_8[1];
if(_7){
var _9=objj_msgSend(PMSSecurity,"sharedSecurity");
objj_msgSend(_9,"setShouldPersistCredentials:",YES);
objj_msgSend(_9,"setToken:",_7);
var _a=window.location.href.replace(/[?&]X-Plex-Token=[^&]+/i,"");
if(window.history.replaceState){
window.history.replaceState({},null,_a);
}else{
window.location.replace(_a);
return;
}
}
appWindow=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessBridgeWindowMask);
objj_msgSend(objj_msgSend(appWindow,"contentView"),"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",34/255,1));
managerController=objj_msgSend(objj_msgSend(MMManagerController,"alloc"),"init");
objj_msgSend(objj_msgSend(managerController,"view"),"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(objj_msgSend(managerController,"view"),"setFrame:",objj_msgSend(objj_msgSend(appWindow,"contentView"),"bounds"));
objj_msgSend(objj_msgSend(appWindow,"contentView"),"addSubview:",objj_msgSend(managerController,"view"));
objj_msgSend(appWindow,"orderFront:",_3);
if(CPBrowserIsEngine(CPInternetExplorerBrowserEngine)&&(InternetExplorerVersion<9)&&(objj_msgSend(objj_msgSend(objj_msgSend(CPCookie,"alloc"),"initWithName:","suppress-ie-warning"),"value")!="YES")){
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",4,_3,sel_getUid("issueInternetExplorerWarning"),nil,NO);
}
CPLog.trace("[%@ -applicationDidFinishLaunching:] END",objj_msgSend(_3,"class"));
}
}),new objj_method(sel_getUid("issueInternetExplorerWarning"),function(_b,_c){
with(_b){
var _d=objj_msgSend(MMInternetExplorerNotificationBar,"installBarWithTitle:aboveView:animated:",CPLocalizedString("This site does not support Internet Explorer. For the best experience, click here to install Google Chrome Frame.","Warning for IE users"),objj_msgSend(managerController,"view"),YES);
objj_msgSend(_d,"setTarget:",_b);
objj_msgSend(_d,"setAction:",sel_getUid("installGoogleChromeFrame:"));
objj_msgSend(_d,"setDismissAction:",sel_getUid("dismissInternetExplorerWarning:"));
}
}),new objj_method(sel_getUid("installGoogleChromeFrame:"),function(_e,_f,_10){
with(_e){
objj_msgSend(_e,"hideInternetExplorerWarning:",_10);
CFInstall.check({mode:"overlay",destination:objj_msgSend(objj_msgSend(PMSURL,"URLWithPath:","/manage"),"absoluteString")});
}
}),new objj_method(sel_getUid("dismissInternetExplorerWarning:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_11,"hideInternetExplorerWarning:",_13);
objj_msgSend(objj_msgSend(objj_msgSend(CPCookie,"alloc"),"initWithName:","suppress-ie-warning"),"setValue:expires:domain:","YES",objj_msgSend(CPDate,"distantFuture"),nil);
}
}),new objj_method(sel_getUid("hideInternetExplorerWarning:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_16,"removeFromSuperview");
objj_msgSend(objj_msgSend(managerController,"view"),"setFrame:",objj_msgSend(objj_msgSend(appWindow,"contentView"),"bounds"));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("notifyUserOfError:withTitle:"),function(_17,_18,_19,_1a){
with(_17){
var _1b=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"init");
objj_msgSend(_1b,"setAlertStyle:",CPCriticalAlertStyle);
objj_msgSend(_1b,"setTitle:",_1a);
objj_msgSend(_1b,"setMessageText:",_19);
objj_msgSend(_1b,"runModal");
}
}),new objj_method(sel_getUid("notifyUserOfConnectionError:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(_1c,"notifyUserOfError:withTitle:",objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Connecting to Plex Media Server failed with this error: %@.\n\nAre you sure it's running?","Error message for when we cannot connect to PMS or when the response is invalid"),_1e),CPLocalizedString("Unable to connect to Plex Media Server","Error title for when we cannot connect to PMS or when the response is invalid"));
}
})]);
p;29;CPPlatformString+FirefoxFix.jt;583;@STATIC;1.0;I;25;AppKit/CPPlatformString.jt;535;
objj_executeFile("AppKit/CPPlatformString.j",NO);
if(CPBrowserIsEngine(CPGeckoBrowserEngine)){
var _1=class_getClassMethod(CPPlatformString,sel_getUid("sizeOfString:withFont:forWidth:")).method_imp;
var _2=objj_getClass("CPPlatformString");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"CPPlatformString\"");
}
var _3=_2.isa;
class_addMethods(_3,[new objj_method(sel_getUid("sizeOfString:withFont:forWidth:"),function(_4,_5,_6,_7,_8){
with(_4){
var _9=_1(_4,_5,_6,_7,_8);
_9.width+=1;
return _9;
}
})]);
}
p;44;LPLocationController-setLocationForObjects.jt;900;@STATIC;1.0;I;28;LPKit/LPLocationController.jt;849;
objj_executeFile("LPKit/LPLocationController.j",NO);
var _1=objj_getClass("LPLocationController");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"LPLocationController\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setLocationForObjects:"),function(_3,_4,_5){
with(_3){
objj_msgSend(_3,"setLocation:",objj_msgSend.apply(this,[objj_msgSend(_3,"class"),sel_getUid("locationForObjects:")].concat(Array.prototype.slice.call(arguments,2))));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("locationForObjects:"),function(_6,_7,_8){
with(_6){
var _9=[];
for(var i=2;i<arguments.length;i++){
var _a=arguments[i];
objj_msgSend(_9,"addObject:",objj_msgSend(_a,"respondsToSelector:",sel_getUid("path"))?objj_msgSend(_a,"path"):_a);
}
return objj_msgSend(_9,"componentsJoinedByString:",";");
}
})]);
p;39;Frameworks/LPKit/LPLocationController.jt;1864;@STATIC;1.0;I;21;Foundation/CPObject.jt;1819;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"LPLocationController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("currentHash"),new objj_ivar("observers")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("LPLocationController").super_class},"init")){
observers=objj_msgSend(CPArray,"array");
currentHash=window.location.hash;
if(typeof window.onhashchange!=="undefined"){
window.onhashchange=function(){
objj_msgSend(_4,"updateLocation:",nil);
};
}else{
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.1,_4,sel_getUid("updateLocation:"),nil,YES);
}
}
return _4;
}
}),new objj_method(sel_getUid("formattedHash"),function(_6,_7){
with(_6){
return objj_msgSend(window.location.hash,"substringFromIndex:",1);
}
}),new objj_method(sel_getUid("setLocation:"),function(_8,_9,_a){
with(_8){
window.location.hash=_a;
objj_msgSend(_8,"updateLocation:",nil);
}
}),new objj_method(sel_getUid("updateLocation:"),function(_b,_c,_d){
with(_b){
if(currentHash!==window.location.hash){
currentHash=window.location.hash;
var _e=objj_msgSend(_b,"formattedHash");
for(var i=0,_f=observers.length;i<_f;i++){
objj_msgSend(observers[i][0],"performSelector:withObject:",observers[i][1],_e);
}
}
}
}),new objj_method(sel_getUid("addObserver:selector:"),function(_10,_11,_12,_13){
with(_10){
objj_msgSend(observers,"addObject:",[_12,_13]);
objj_msgSend(_12,"performSelector:withObject:",_13,objj_msgSend(_10,"formattedHash"));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedLocationController"),function(_14,_15){
with(_14){
if(!_1){
_1=objj_msgSend(objj_msgSend(_14,"alloc"),"init");
}
return _1;
}
})]);
p;33;Controllers/MMManagerController.jt;27107;@STATIC;1.0;I;25;AppKit/CPViewController.jI;27;AppKit/CPSegmentedControl.jI;28;LPKit/LPLocationController.ji;30;../CPCheckBox+ObjectValueFix.ji;32;../CPURLConnection+XMLResponse.ji;34;../Controllers/MMAlbumController.ji;40;../Controllers/MMSidebarViewController.ji;34;../Controllers/MMPrefsController.ji;35;../Controllers/MMSeasonController.ji;34;../DataSources/MMAgentDataSource.ji;41;../DataSources/MMLibraryMediaDataSource.ji;41;../DataSources/MMMetadataItemDataSource.ji;44;../DataSources/MMLibrarySectionsDataSource.ji;44;../DataSources/MMLibraryTimelineDataSource.ji;26;../Models/LanguageConfig.ji;23;../Models/SectionType.ji;26;../Models/MMMetadataItem.ji;27;../Models/PMSCapabilities.ji;36;../Controllers/MMContentController.ji;37;../Controllers/MMRootViewController.ji;41;../Controllers/MMMetadataItemController.ji;30;../Views/MMActionPopUpButton.ji;27;../Views/MMCollectionView.ji;22;../Views/MMContainer.ji;21;../Views/MMHomeView.ji;44;../Views/MMInternetExplorerNotificationBar.ji;35;../Views/MMMetadataItemDetailView.ji;23;../Views/MMScrollView.ji;33;../Views/MMSectionSettingsSheet.ji;29;../Views/MMPreferencesPanel.ji;20;../Views/MMToolbar.ji;20;../Views/MMSpinner.jt;25918;
objj_executeFile("AppKit/CPViewController.j",NO);
objj_executeFile("AppKit/CPSegmentedControl.j",NO);
objj_executeFile("LPKit/LPLocationController.j",NO);
objj_executeFile("../CPCheckBox+ObjectValueFix.j",YES);
objj_executeFile("../CPURLConnection+XMLResponse.j",YES);
objj_executeFile("../Controllers/MMAlbumController.j",YES);
objj_executeFile("../Controllers/MMSidebarViewController.j",YES);
objj_executeFile("../Controllers/MMPrefsController.j",YES);
objj_executeFile("../Controllers/MMSeasonController.j",YES);
objj_executeFile("../DataSources/MMAgentDataSource.j",YES);
objj_executeFile("../DataSources/MMLibraryMediaDataSource.j",YES);
objj_executeFile("../DataSources/MMMetadataItemDataSource.j",YES);
objj_executeFile("../DataSources/MMLibrarySectionsDataSource.j",YES);
objj_executeFile("../DataSources/MMLibraryTimelineDataSource.j",YES);
objj_executeFile("../Models/LanguageConfig.j",YES);
objj_executeFile("../Models/SectionType.j",YES);
objj_executeFile("../Models/MMMetadataItem.j",YES);
objj_executeFile("../Models/PMSCapabilities.j",YES);
objj_executeFile("../Controllers/MMContentController.j",YES);
objj_executeFile("../Controllers/MMRootViewController.j",YES);
objj_executeFile("../Controllers/MMMetadataItemController.j",YES);
objj_executeFile("../Views/MMActionPopUpButton.j",YES);
objj_executeFile("../Views/MMCollectionView.j",YES);
objj_executeFile("../Views/MMContainer.j",YES);
objj_executeFile("../Views/MMHomeView.j",YES);
objj_executeFile("../Views/MMInternetExplorerNotificationBar.j",YES);
objj_executeFile("../Views/MMMetadataItemDetailView.j",YES);
objj_executeFile("../Views/MMScrollView.j",YES);
objj_executeFile("../Views/MMSectionSettingsSheet.j",YES);
objj_executeFile("../Views/MMPreferencesPanel.j",YES);
objj_executeFile("../Views/MMToolbar.j",YES);
objj_executeFile("../Views/MMSpinner.j",YES);
var _1=24;
var _2=objj_allocateClassPair(CPViewController,"MMManagerController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_preventUpdates"),new objj_ivar("_wantedMetadataItemPath"),new objj_ivar("_showingHelp"),new objj_ivar("selectedObject"),new objj_ivar("_metadataItem"),new objj_ivar("_homeView"),new objj_ivar("librarySectionContextMenu"),new objj_ivar("collectionContextMenu"),new objj_ivar("_metadataItemsController"),new objj_ivar("_sidebarController"),new objj_ivar("rightView"),new objj_ivar("_librarySectionToolbar"),new objj_ivar("statusLabel"),new objj_ivar("_contentController"),new objj_ivar("_rootViewController")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("selectedObject"),function(_4,_5){
with(_4){
return selectedObject;
}
}),new objj_method(sel_getUid("setSelectedObject:"),function(_6,_7,_8){
with(_6){
selectedObject=_8;
}
}),new objj_method(sel_getUid("loadView"),function(_9,_a){
with(_9){
objj_msgSend(LanguageConfig,"initialize");
objj_msgSend(SectionType,"initialize");
objj_msgSend(MMPrefsController,"sharedPrefsController");
objj_msgSend(PMSCapabilities,"sharedPMSCapabilities");
objj_msgSend(objj_msgSend(MMAgentDataSource,"sharedDataSource"),"refreshRecordsWithContextInfo:",nil);
var _b=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_9,"setView:",_b);
objj_msgSend(_b,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _c=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(objj_msgSend(_b,"frame")),48));
objj_msgSend(_c,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_c,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","headerBackground.png"))));
var _d=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(9,0,117,48));
objj_msgSend(_d,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","splash.png")));
objj_msgSend(_d,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_c,"addSubview:",_d);
var _e=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("MEDIA MANAGER","Header title"));
objj_msgSend(_e,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",14));
objj_msgSend(_e,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_e,"sizeToFit");
objj_msgSend(_e,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(_d,"frame"))+10,(CGRectGetHeight(objj_msgSend(_c,"frame"))-CGRectGetHeight(objj_msgSend(_e,"frame")))/2));
objj_msgSend(_e,"setAutoresizingMask:",CPViewMaxXMargin|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_c,"addSubview:",_e);
var _f=objj_msgSend(HUDButton,"buttonWithTitle:",CPLocalizedString("Preferences","Preferences button in top-right"));
objj_msgSend(_f,"setTarget:",_9);
objj_msgSend(_f,"setAction:",sel_getUid("_settingsButtonWasClicked:"));
objj_msgSend(_f,"setKeyEquivalent:",",");
objj_msgSend(_f,"setKeyEquivalentModifierMask:",CPControlKeyMask);
objj_msgSend(_f,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_f,"setFrameOrigin:",CGPointMake(CGRectGetWidth(objj_msgSend(_c,"frame"))-10-CGRectGetWidth(objj_msgSend(_f,"frame")),(CGRectGetHeight(objj_msgSend(_c,"frame"))-CGRectGetHeight(objj_msgSend(_f,"frame")))/2));
objj_msgSend(_c,"addSubview:",_f);
objj_msgSend(_b,"addSubview:",_c);
_contentController=objj_msgSend(objj_msgSend(MMContentController,"alloc"),"init");
_metadataItemsController=objj_msgSend(objj_msgSend(CPArrayController,"alloc"),"init");
objj_msgSend(_metadataItemsController,"setSortDescriptors:",objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(CPSortDescriptor,"sortDescriptorWithKey:ascending:","titleSort",YES)));
var _10=objj_msgSend(objj_msgSend(MMContainer,"alloc"),"initWithFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(_b,"bounds"))-32,CGRectGetWidth(objj_msgSend(_b,"bounds")),32));
objj_msgSend(_10,"setAutoresizingMask:",CPViewMinYMargin|CPViewWidthSizable);
objj_msgSend(_b,"addSubview:",_10);
statusLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",objj_msgSend(_10,"bounds"));
objj_msgSend(statusLabel,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(statusLabel,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(statusLabel,"setVerticalAlignment:",CPCenterTextAlignment);
objj_msgSend(_10,"addSubview:",statusLabel);
var _11=objj_msgSend(MMActionPopUpButton,"button");
librarySectionContextMenu=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","");
collectionContextMenu=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","");
objj_msgSend(_11,"setFrameOrigin:",CGPointMake(15,(CGRectGetHeight(objj_msgSend(_10,"frame"))-_1)/2));
objj_msgSend(_11,"bind:toObject:withKeyPath:options:","menu",_9,"contextMenuForCurrentSelection",nil);
objj_msgSend(librarySectionContextMenu,"setAutoenablesItems:",NO);
objj_msgSend(collectionContextMenu,"setAutoenablesItems:",NO);
var _12=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",CPLocalizedString("Edit Section","Edit Section"),sel_getUid("editSection:"),nil);
objj_msgSend(_12,"setTarget:",_9);
objj_msgSend(_12,"bind:toObject:withKeyPath:options:","enabled",_9,"currentSelectionIsEditable",nil);
objj_msgSend(librarySectionContextMenu,"addItem:",_12);
var _13=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",CPLocalizedString("Empty Trash","Action menu item to remove trashed items"),sel_getUid("emptySectionTrash:"),nil);
objj_msgSend(_13,"setTarget:",_9);
objj_msgSend(_13,"bind:toObject:withKeyPath:options:","enabled",_9,"currentSelectionHasTrashedItems",nil);
objj_msgSend(librarySectionContextMenu,"addItem:",_13);
var _14=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",CPLocalizedString("Choose Icon","Choose Icon"),nil,nil);
objj_msgSend(_14,"setTarget:",_9);
objj_msgSend(_14,"setEnabled:",NO);
objj_msgSend(librarySectionContextMenu,"addItem:",_14);
var _15=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",CPLocalizedString("Choose Background Art","Choose Background Art"),nil,nil);
objj_msgSend(_15,"setTarget:",_9);
objj_msgSend(_15,"setEnabled:",NO);
objj_msgSend(librarySectionContextMenu,"addItem:",_15);
var _16=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",CPLocalizedString("Remove Section","Remove Section"),sel_getUid("removeSelection:"),nil);
objj_msgSend(_16,"setTarget:",_9);
objj_msgSend(_16,"bind:toObject:withKeyPath:options:","enabled",_9,"currentSelectionIsDeletable",nil);
objj_msgSend(librarySectionContextMenu,"addItem:",_16);
var _17=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",CPLocalizedString("Remove Collection","Remove Collection"),sel_getUid("removeSelection:"),nil);
objj_msgSend(_17,"setTarget:",_9);
objj_msgSend(_17,"bind:toObject:withKeyPath:options:","enabled",_9,"currentSelectionIsDeletable",nil);
objj_msgSend(collectionContextMenu,"addItem:",_17);
objj_msgSend(_10,"addSubview:",_11);
var _18=CGRectGetHeight(objj_msgSend(_b,"bounds"))-CGRectGetHeight(objj_msgSend(_10,"bounds"))-CGRectGetHeight(objj_msgSend(_c,"bounds"));
var _19=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(_c,"frame")),200,_18));
objj_msgSend(_19,"setAutoresizingMask:",CPViewHeightSizable);
objj_msgSend(_b,"addSubview:",_19);
_sidebarController=objj_msgSend(objj_msgSend(MMSidebarViewController,"alloc"),"initWithDelegate:",_9);
var _1a=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",objj_msgSend(_19,"bounds"));
objj_msgSend(_1a,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_1a,"setAutohidesScrollers:",YES);
objj_msgSend(_1a,"setDocumentView:",objj_msgSend(_sidebarController,"view"));
objj_msgSend(_19,"addSubview:",_1a);
var _1b=objj_msgSend(objj_msgSend(CPBox,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(_19,"frame")),CGRectGetMinY(objj_msgSend(_19,"frame")),1,_18));
objj_msgSend(_1b,"setBorderColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",180/255,1));
objj_msgSend(_1b,"setAutoresizingMask:",CPViewHeightSizable);
objj_msgSend(_b,"addSubview:",_1b);
rightView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(_1b,"frame")),CGRectGetMinY(objj_msgSend(_19,"frame")),CGRectGetWidth(objj_msgSend(_b,"bounds"))-CGRectGetMaxX(objj_msgSend(_1b,"frame")),_18));
objj_msgSend(_b,"addSubview:",rightView);
objj_msgSend(rightView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(objj_msgSend(_contentController,"view"),"setFrame:",objj_msgSend(rightView,"bounds"));
objj_msgSend(rightView,"addSubview:",objj_msgSend(_contentController,"view"));
objj_msgSend(_sidebarController,"addObserver:forKeyPath:options:context:",_9,"selectedObject",CPKeyValueObservingOptionInitial|CPKeyValueObservingOptionNew,nil);
_rootViewController=objj_msgSend(objj_msgSend(MMRootViewController,"alloc"),"init");
objj_msgSend(_rootViewController,"bind:toObject:withKeyPath:options:","content",_9,"selectedObject",nil);
objj_msgSend(_contentController,"pushViewController:animated:",_rootViewController,NO);
objj_msgSend(statusLabel,"bind:toObject:withKeyPath:options:",CPValueBinding,_contentController,"status",nil);
var _1c=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"initWithFrame:",CGRectMakeZero()),_1d=objj_msgSend(_1c,"currentValueForThemeAttribute:","help-image"),_1e=objj_msgSend(_1c,"currentValueForThemeAttribute:","help-image-pressed"),_1f=_1d?objj_msgSend(_1d,"size"):CGSizeMakeZero(),_20=CGRectMake(CGRectGetWidth(objj_msgSend(_10,"frame"))-5-_1f.width,(CGRectGetHeight(objj_msgSend(_10,"frame"))-_1f.height)/2,_1f.width,_1f.height);
var _21=CGSizeMake(32,25),_22=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(CGRectGetWidth(objj_msgSend(_10,"frame"))-_21.width-5,(CGRectGetHeight(objj_msgSend(_10,"frame"))-_21.height)/2,_21.width,_21.height)),_23=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","NSRefreshTemplate.png"),CGSizeMake(13,13));
objj_msgSend(_22,"bind:toObject:withKeyPath:options:","enabled",_9,"selectedObject",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPIsNotNilTransformerName,CPValueTransformerNameBindingOption));
objj_msgSend(_22,"setImage:",_23);
objj_msgSend(_22,"setImagePosition:",CPImageOnly);
objj_msgSend(_22,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_22,"setTarget:",_9);
objj_msgSend(_22,"setAction:",sel_getUid("refreshSection:"));
objj_msgSend(_10,"addSubview:",_22);
var _24=CGSizeMake(32,25),_25=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_10,"frame"))-_24.width-5,(CGRectGetHeight(objj_msgSend(_10,"frame"))-_24.height)/2,_24.width,_24.height)),_26=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","NSStopProgressTemplate.png"),CGSizeMake(11,11));
objj_msgSend(_25,"bind:toObject:withKeyPath:options:","hidden",_9,"refreshing",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPNegateBooleanTransformer,CPValueTransformerNameBindingOption));
objj_msgSend(_25,"setImage:",_26);
objj_msgSend(_25,"setImagePosition:",CPImageOnly);
objj_msgSend(_25,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_25,"setTarget:",_9);
objj_msgSend(_25,"setAction:",sel_getUid("stopRefresh:"));
objj_msgSend(_10,"addSubview:",_25);
objj_msgSend(objj_msgSend(PMSCapabilities,"sharedPMSCapabilities"),"addObserver:forKeyPath:options:context:",_9,"stopRefreshSupported",CPKeyValueObservingOptionNew|CPKeyValueObservingOptionInitial,{button:_25,container:_10});
objj_msgSend(objj_msgSend(LPLocationController,"sharedLocationController"),"addObserver:selector:",_9,sel_getUid("locationDidChange:"));
}
}),new objj_method(sel_getUid("setSelectedObject:"),function(_27,_28,_29){
with(_27){
if(selectedObject==_29){
return;
}
objj_msgSend(_contentController,"popToRootViewControllerAnimated:",NO);
selectedObject=_29;
if(selectedObject){
var _2a=objj_msgSend(objj_msgSend(LPLocationController,"sharedLocationController"),"formattedHash"),_2b=objj_msgSend(_2a,"componentsSeparatedByString:",";");
if(objj_msgSend(_2b,"count")===0||!objj_msgSend(objj_msgSend(selectedObject,"path"),"isEqualToString:",objj_msgSend(_2b,"objectAtIndex:",0))){
objj_msgSend(objj_msgSend(LPLocationController,"sharedLocationController"),"setLocationForObjects:",selectedObject);
}
}
}
}),new objj_method(sel_getUid("currentSelectionIsDeletable"),function(_2c,_2d){
with(_2c){
var _2e=NO;
if(objj_msgSend(selectedObject,"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"))){
_2e=YES;
}else{
if(objj_msgSend(selectedObject,"respondsToSelector:",sel_getUid("isCollection"))&&objj_msgSend(selectedObject,"isCollection")){
_2e=objj_msgSend(objj_msgSend(PMSCapabilities,"sharedPMSCapabilities"),"collectionDeletionSupported");
}
}
return _2e;
}
}),new objj_method(sel_getUid("contextMenuForCurrentSelection"),function(_2f,_30){
with(_2f){
if(objj_msgSend(selectedObject,"isKindOfClass:",objj_msgSend(PMCDirectoryObject,"class"))){
return objj_msgSend(selectedObject,"isCollection")?collectionContextMenu:librarySectionContextMenu;
}
return nil;
}
}),new objj_method(sel_getUid("currentSelectionIsEditable"),function(_31,_32){
with(_31){
return objj_msgSend(selectedObject,"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"));
}
}),new objj_method(sel_getUid("currentSelectionHasTrashedItems"),function(_33,_34){
with(_33){
var _35=objj_msgSend(_33,"selectedObject");
if(!objj_msgSend(_35,"respondsToSelector:",sel_getUid("trashedItems"))){
return NO;
}
return objj_msgSend(objj_msgSend(_35,"trashedItems"),"count")>0;
}
}),new objj_method(sel_getUid("refreshing"),function(_36,_37){
with(_36){
var _38=objj_msgSend(_36,"selectedObject");
try{
return objj_msgSend(_38,"valueForKey:","refreshing");
}
catch(ex){
return NO;
}
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_39,_3a,_3b,_3c,_3d,_3e){
with(_39){
if(_3c===_sidebarController&&objj_msgSend(_3b,"isEqualToString:","selectedObject")){
var _3f=objj_msgSend(_3d,"objectForKey:",CPKeyValueChangeNewKey);
if(objj_msgSend(_3f,"isEqual:",objj_msgSend(CPNull,"null"))){
_3f=nil;
}
objj_msgSend(_39,"setSelectedObject:",_3f);
}else{
if(_3c==objj_msgSend(PMSCapabilities,"sharedPMSCapabilities")&&objj_msgSend(_3b,"isEqualToString:","stopRefreshSupported")){
if(objj_msgSend(_3c,"stopRefreshSupported")){
objj_msgSend(_3e.container,"addSubview:",_3e.button);
}else{
objj_msgSend(_3e.button,"removeFromSuperview");
}
}
}
}
}),new objj_method(sel_getUid("locationDidChange:"),function(_40,_41,_42){
with(_40){
if(_preventUpdates){
return;
}
CPLog.info("[%@ %@] location=%@",objj_msgSend(_40,"class"),_41,_42);
var _43=objj_msgSend(_sidebarController,"librarySectionsController");
var _44=nil,_43=nil;
var _45=objj_msgSend(CPMutableArray,"arrayWithArray:",objj_msgSend(_42,"componentsSeparatedByString:",";"));
objj_msgSend(_45,"removeObjectIdenticalTo:","");
_preventUpdates=YES;
if(objj_msgSend(_45,"count")>=1){
objj_msgSend(_sidebarController,"selectItemWithPath:",objj_msgSend(_45,"objectAtIndex:",0));
}
objj_msgSend(objj_msgSend(objj_msgSend(_contentController,"viewControllers"),"objectAtIndex:",0),"restoreChildState");
_preventUpdates=NO;
}
}),new objj_method(sel_getUid("dataSource:didFailToReceiveRecordsWithError:contextInfo:"),function(_46,_47,_48,_49,_4a){
with(_46){
objj_msgSend(AppController,"notifyUserOfConnectionError:",_49);
}
}),new objj_method(sel_getUid("dataSource:didFailToDeleteRecord:withError:contextInfo:"),function(_4b,_4c,_4d,_4e,_4f,_50){
with(_4b){
objj_msgSend(AppController,"notifyUserOfError:withTitle:",objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Got this error: %@. Are you sure Plex Media Server is running?","Error message for when we cannot remove a library section"),_4f),objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Unable to remove section \"%@\"","Error title for when we cannot remove a library section"),objj_msgSend(_4e,"title")));
}
}),new objj_method(sel_getUid("selectedObject"),function(_51,_52){
with(_51){
return objj_msgSend(_sidebarController,"selectedObject");
}
}),new objj_method(sel_getUid("objectWasActivated:"),function(_53,_54,_55){
with(_53){
if(objj_msgSend(_55,"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"))){
objj_msgSend(_53,"_beginEditingSection:",_55);
}
}
}),new objj_method(sel_getUid("removeSelection:"),function(_56,_57,_58){
with(_56){
var _59=objj_msgSend(_56,"selectedObject"),_5a=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"init"),_5b=objj_msgSend(_59,"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"));
objj_msgSend(_5a,"setAlertStyle:",CPWarningAlertStyle);
objj_msgSend(_5a,"setDelegate:",_56);
if(_5b){
objj_msgSend(_5a,"setMessageText:",objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Are you sure you want to remove the section named \"%@\"?","Confirmation message for removing a section"),objj_msgSend(_59,"title")));
objj_msgSend(_5a,"setInformativeText:",CPLocalizedString("Any content in this section will no longer be available in your library. The files on your computer will not be removed.","Informative text for removing a section"));
objj_msgSend(_5a,"addButtonWithTitle:",CPLocalizedString("Remove Section","Remove section confirmation button"));
}else{
objj_msgSend(_5a,"setMessageText:",objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Are you sure you want to remove the collection named \"%@\"?","Confirmation message for removing a collection"),objj_msgSend(_59,"title")));
objj_msgSend(_5a,"setInformativeText:",CPLocalizedString("The collection will be removed. The media inside the collection will not be touched.","Informative text for removing a collection"));
objj_msgSend(_5a,"addButtonWithTitle:",CPLocalizedString("Remove Collection","Remove collection confirmation button"));
}
objj_msgSend(_5a,"addButtonWithTitle:",CPLocalizedString("Cancel","Cancel"));
objj_msgSend(objj_msgSend(objj_msgSend(_5a,"buttons"),"objectAtIndex:",0),"setKeyEquivalent:",CPEscapeFunctionKey);
objj_msgSend(_5a,"beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:",objj_msgSend(objj_msgSend(_56,"view"),"window"),_56,_5b?sel_getUid("removeSectionConfirmationDidEnd:returnCode:contextInfo:"):sel_getUid("destroyCollectionConfirmationSheetDidEnd:returnCode:contextInfo:"),_59);
}
}),new objj_method(sel_getUid("_addDidEnd:returnCode:contextInfo:"),function(_5c,_5d,_5e,_5f,_60){
with(_5c){
}
}),new objj_method(sel_getUid("_editDidEnd:returnCode:contextInfo:"),function(_61,_62,_63,_64,_65){
with(_61){
}
}),new objj_method(sel_getUid("editSection:"),function(_66,_67,_68){
with(_66){
objj_msgSend(_66,"_beginEditingSection:",objj_msgSend(_66,"selectedObject"));
}
}),new objj_method(sel_getUid("refreshSection:"),function(_69,_6a,_6b){
with(_69){
var _6c=objj_msgSend(_69,"selectedObject");
if(!objj_msgSend(_6c,"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"))){
return;
}
var _6d=objj_msgSend(CPApp,"currentEvent");
var _6e=false,_6f=false;
if(objj_msgSend(_6d,"modifierFlags")&CPShiftKeyMask){
_6e=true;
}
if(objj_msgSend(_6d,"modifierFlags")&CPAlternateKeyMask){
_6f=true;
}
objj_msgSend(objj_msgSend(MMLibrarySectionsDataSource,"sharedDataSource"),"refreshSection:forceUpdate:withDeepScan:",_6c,_6e,_6f);
objj_msgSend(_6c,"setRefreshing:",YES);
}
}),new objj_method(sel_getUid("stopRefresh:"),function(_70,_71,_72){
with(_70){
var _73=objj_msgSend(_70,"selectedObject");
if(!objj_msgSend(_73,"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"))){
return;
}
objj_msgSend(objj_msgSend(MMLibrarySectionsDataSource,"sharedDataSource"),"stopRefresh:",_73);
objj_msgSend(_73,"setRefreshing:",NO);
}
}),new objj_method(sel_getUid("editSectionButtonClicked:"),function(_74,_75,_76){
with(_74){
objj_msgSend(_74,"_beginEditingSection:",objj_msgSend(_74,"selectedObject"));
}
}),new objj_method(sel_getUid("_beginEditingSection:"),function(_77,_78,_79){
with(_77){
var _7a=objj_msgSend(objj_msgSend(MMSectionSettingsSheet,"alloc"),"initWithDataSource:",objj_msgSend(MMLibrarySectionsDataSource,"sharedDataSource"));
objj_msgSend(_7a,"beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:",objj_msgSend(objj_msgSend(_77,"view"),"window"),_77,sel_getUid("_editDidEnd:returnCode:contextInfo:"),_79);
}
}),new objj_method(sel_getUid("_settingsButtonWasClicked:"),function(_7b,_7c,_7d){
with(_7b){
var _7e=objj_msgSend(objj_msgSend(MMPreferencesPanel,"alloc"),"initWithFrame:",CGRectMake(0,0,520,200));
objj_msgSend(_7e,"sizeToFit");
objj_msgSend(_7e,"presentSheetInWindow:",objj_msgSend(objj_msgSend(_7b,"view"),"window"));
}
}),new objj_method(sel_getUid("emptySectionTrash:"),function(_7f,_80,_81){
with(_7f){
setTimeout(function(){
var _82=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"init"),_83=objj_msgSend(_7f,"selectedObject");
objj_msgSend(_82,"setAlertStyle:",CPWarningAlertStyle);
objj_msgSend(_82,"setMessageText:",objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Are you sure you want to empty the trash in \"%@\"?","Confirmation text for the empty trash confirmation dialog"),objj_msgSend(_83,"title")));
objj_msgSend(_82,"setInformativeText:",CPLocalizedString("All deleted items will be permanently removed from your library. No files on your computer will be removed.","Explanation text for the empty trash confirmation dialog"));
objj_msgSend(_82,"setDelegate:",_7f);
objj_msgSend(_82,"addButtonWithTitle:",CPLocalizedString("Empty Trash","Confirmation button for the empty trash confirmation dialog"));
objj_msgSend(_82,"addButtonWithTitle:",CPLocalizedString("Cancel","Cancel"));
objj_msgSend(objj_msgSend(objj_msgSend(_82,"buttons"),"objectAtIndex:",0),"setKeyEquivalent:",CPEscapeFunctionKey);
objj_msgSend(_82,"beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:",objj_msgSend(objj_msgSend(_7f,"view"),"window"),_7f,sel_getUid("emptyTrashConfirmationSheetDidEnd:returnCode:contextInfo:"),_83);
},10);
}
}),new objj_method(sel_getUid("removeSectionConfirmationDidEnd:returnCode:contextInfo:"),function(_84,_85,_86,_87,_88){
with(_84){
if(_87===0){
objj_msgSend(objj_msgSend(MMLibrarySectionsDataSource,"sharedDataSource"),"deleteRecord:",_88);
}
}
}),new objj_method(sel_getUid("destroyCollectionConfirmationSheetDidEnd:returnCode:contextInfo:"),function(_89,_8a,_8b,_8c,_8d){
with(_89){
if(_8c===0){
objj_msgSend(objj_msgSend(MMLibraryMediaDataSource,"sharedDataSource"),"deleteRecord:",_8d);
}
}
}),new objj_method(sel_getUid("emptyTrashConfirmationSheetDidEnd:returnCode:contextInfo:"),function(_8e,_8f,_90,_91,_92){
with(_8e){
if(_91==0&&objj_msgSend(_92,"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"))){
objj_msgSend(_92,"emptyTrash");
objj_msgSend(_sidebarController,"reloadLibrarySections");
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("keyPathsForValuesAffectingCurrentSelectionIsDeletable"),function(_93,_94){
with(_93){
return objj_msgSend(CPSet,"setWithObjects:","selectedObject");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingContextMenuForCurrentSelection"),function(_95,_96){
with(_95){
return objj_msgSend(CPSet,"setWithObjects:","selectedObject");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingCurrentSelectionIsEditable"),function(_97,_98){
with(_97){
return objj_msgSend(CPSet,"setWithObjects:","selectedObject");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingCurrentSelectionHasTrashedItems"),function(_99,_9a){
with(_99){
return objj_msgSend(CPSet,"setWithObjects:","selectedObject","selectedObject.trashedItems");
}
})]);
p;27;CPCheckBox+ObjectValueFix.jt;395;@STATIC;1.0;t;377;
var _1=objj_getClass("CPCheckBox");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPCheckBox\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setObjectValue:"),function(_3,_4,_5){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPCheckBox").super_class},"setObjectValue:",_5?CPOnState:CPOffState);
}
})]);
p;29;CPURLConnection+XMLResponse.jt;433;@STATIC;1.0;t;415;
var _1=objj_getClass("CPURLConnection");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPURLConnection\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("responseXML"),function(_3,_4){
with(_3){
return _HTTPRequest.responseXML();
}
}),new objj_method(sel_getUid("locationHeader"),function(_5,_6){
with(_5){
return _HTTPRequest.getResponseHeader("Location");
}
})]);
p;31;Controllers/MMAlbumController.jt;4715;@STATIC;1.0;i;18;MMViewController.ji;33;MMMetadataItemToolbarController.ji;28;../Views/MMAlbumDetailView.jt;4602;
objj_executeFile("MMViewController.j",YES);
objj_executeFile("MMMetadataItemToolbarController.j",YES);
objj_executeFile("../Views/MMAlbumDetailView.j",YES);
var _1=objj_allocateClassPair(MMViewController,"MMAlbumController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("content"),new objj_ivar("childrenController"),new objj_ivar("mediaDataSource"),new objj_ivar("toolbarController"),new objj_ivar("detailView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("content"),function(_3,_4){
with(_3){
return content;
}
}),new objj_method(sel_getUid("setContent:"),function(_5,_6,_7){
with(_5){
content=_7;
}
}),new objj_method(sel_getUid("init"),function(_8,_9){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("MMAlbumController").super_class},"init")){
mediaDataSource=objj_msgSend(objj_msgSend(MMLibraryMediaDataSource,"alloc"),"initWithDelegate:",_8);
childrenController=objj_msgSend(objj_msgSend(CPArrayController,"alloc"),"init");
}
return _8;
}
}),new objj_method(sel_getUid("loadView"),function(_a,_b){
with(_a){
toolbarController=objj_msgSend(objj_msgSend(MMMetadataItemToolbarController,"alloc"),"init");
var _c=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,800,800)),_d=objj_msgSend(toolbarController,"view"),_e=CGRectGetHeight(objj_msgSend(_d,"frame")),_f=objj_msgSend(objj_msgSend(MMAlbumDetailView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_a,"ensureBackgroundFor:",_c);
objj_msgSend(_d,"setFrame:",CGRectMake(0,CGRectGetHeight(objj_msgSend(_c,"frame"))-_e,CGRectGetWidth(objj_msgSend(_c,"frame")),_e));
objj_msgSend(_f,"setFrame:",CGRectMake(0,0,CGRectGetWidth(objj_msgSend(_c,"frame")),CGRectGetMinY(objj_msgSend(_d,"frame"))));
objj_msgSend(_d,"setAutoresizingMask:",CPViewMinYMargin|CPViewWidthSizable);
objj_msgSend(_f,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_c,"addSubview:",_f);
objj_msgSend(_c,"addSubview:",_d);
objj_msgSend(_f,"bind:toObject:withKeyPath:options:","thumbImage",_a,"content.thumbImage",nil);
objj_msgSend(_f,"bind:toObject:withKeyPath:options:","title",_a,"content.title",nil);
objj_msgSend(_f,"bind:toObject:withKeyPath:options:","year",_a,"content.year",nil);
objj_msgSend(_f,"bind:toObject:withKeyPath:options:","summary",_a,"content.summary",nil);
objj_msgSend(_f,"bind:toObject:withKeyPath:options:","tracks",childrenController,"arrangedObjects",nil);
objj_msgSend(toolbarController,"bind:toObject:withKeyPath:options:","content",_a,"content",nil);
objj_msgSend(toolbarController,"bind:toObject:withKeyPath:options:","parentViewController",_a,"parentViewController",nil);
detailView=_f;
objj_msgSend(_a,"setView:",_c);
}
}),new objj_method(sel_getUid("title"),function(_10,_11){
with(_10){
return objj_msgSend(content,"displayTitle");
}
}),new objj_method(sel_getUid("status"),function(_12,_13){
with(_12){
var _14=objj_msgSend(childrenController,"content");
if(!objj_msgSend(_14,"count")){
return CPLocalizedString("no tracks","Status label for when there are no tracks in an album");
}
var _15=0,_16=0;
for(var i=0,_17=objj_msgSend(_14,"count");i<_17;i++){
var _18=_14[i],_19=objj_msgSend(_18,"duration"),_1a=objj_msgSend(objj_msgSend(_18,"mainMediaItem"),"size");
if(_19){
_15+=_19;
}
if(_1a){
_16+=_1a;
}
}
var _1b=FLOOR(_15/1000);
if(objj_msgSend(_14,"count")==1){
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("1 track, %@ total time, %@","Status label for when there is one track in an album (e.g. 1 track, 4:28 total time, 5.6 MB)"),objj_msgSend(_1b,"timeString"),objj_msgSend(_16,"filesizeString"));
}
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("%d tracks, %@ total time, %@","Status label for when there are more than one track (e.g. 11 tracks, 47:34 total time, 91.2 MB)"),objj_msgSend(_14,"count"),objj_msgSend(_1b,"timeString"),objj_msgSend(_16,"filesizeString"));
}
}),new objj_method(sel_getUid("setContent:"),function(_1c,_1d,_1e){
with(_1c){
content=_1e;
objj_msgSend(mediaDataSource,"refreshRecordsWithContextInfo:",content);
}
}),new objj_method(sel_getUid("dataSource:didReceiveRecords:contextInfo:"),function(_1f,_20,_21,_22,_23){
with(_1f){
if(_21!=mediaDataSource||_23!=content){
return;
}
objj_msgSend(_1f,"willChangeValueForKey:","status");
objj_msgSend(childrenController,"setContent:",_22);
objj_msgSend(_1f,"didChangeValueForKey:","status");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("keyPathsForValuesAffectingTitle"),function(_24,_25){
with(_24){
return objj_msgSend(CPSet,"setWithObjects:","content","content.displayTitle");
}
})]);
p;30;Controllers/MMViewController.jt;5189;@STATIC;1.0;I;25;AppKit/CPViewController.ji;34;../Views/MMDefaultBackgroundView.jt;5101;
objj_executeFile("AppKit/CPViewController.j",NO);
objj_executeFile("../Views/MMDefaultBackgroundView.j",YES);
MMViewControllerImplementationIncomplete="MMViewControllerImplementationIncomplete";
var _1=objj_allocateClassPair(CPViewController,"MMViewController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("parentViewController")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("parentViewController"),function(_3,_4){
with(_3){
return parentViewController;
}
}),new objj_method(sel_getUid("setParentViewController:"),function(_5,_6,_7){
with(_5){
parentViewController=_7;
}
}),new objj_method(sel_getUid("restoreChildState"),function(_8,_9){
with(_8){
var _a=objj_msgSend(_8,"childPath");
if(!_a){
objj_msgSend(parentViewController,"popToViewController:animated:",_8,NO);
return;
}
var _b=objj_msgSend(_8,"children");
for(var i=0;i<objj_msgSend(_b,"count");i++){
var _c=objj_msgSend(_b,"objectAtIndex:",i);
if(objj_msgSend(objj_msgSend(_c,"path"),"isEqualToString:",_a)){
if(!objj_msgSend(objj_msgSend(objj_msgSend(_8,"nextViewController"),"content"),"isEqual:",_c)){
var _d=objj_msgSend(_8,"viewControllerForChild:",_c);
if(objj_msgSend(_d,"respondsToSelector:",sel_getUid("setContent:"))){
objj_msgSend(_d,"setContent:",_c);
}
objj_msgSend(parentViewController,"popToViewController:animated:",_8,NO);
objj_msgSend(parentViewController,"pushViewController:animated:",_d,NO);
}
objj_msgSend(objj_msgSend(_8,"nextViewController"),"restoreChildState");
break;
}
}
}
}),new objj_method(sel_getUid("viewControllerForChild:"),function(_e,_f,_10){
with(_e){
if(!objj_msgSend(_10,"isKindOfClass:",objj_msgSend(PMCBaseObject,"class"))){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(CPString,"stringWithFormat:","expected argument to be a PMCBaseObject but got %@ instead",CPStringFromClass(objj_msgSend(_10,"class"))));
}
switch(objj_msgSend(_10,"type")){
case PMCObjectTypePhoto:
return objj_msgSend(objj_msgSend(MMMetadataItemCollectionViewController,"alloc"),"init");
case PMCObjectTypeSeason:
return objj_msgSend(objj_msgSend(MMSeasonController,"alloc"),"init");
case PMCObjectTypeAlbum:
return objj_msgSend(objj_msgSend(MMAlbumController,"alloc"),"init");
}
return objj_msgSend(objj_msgSend(MMMetadataItemController,"alloc"),"init");
}
}),new objj_method(sel_getUid("childPath"),function(_11,_12){
with(_11){
var _13=objj_msgSend(_11,"childPaths");
if(_13&&objj_msgSend(_13,"count")){
return objj_msgSend(_13,"objectAtIndex:",0);
}
}
}),new objj_method(sel_getUid("childPaths"),function(_14,_15){
with(_14){
var _16=objj_msgSend(_14,"location"),_17=objj_msgSend(objj_msgSend(LPLocationController,"sharedLocationController"),"formattedHash");
if(!objj_msgSend(_17,"hasPrefix:",_16)){
return nil;
}
if(objj_msgSend(_16,"isEqualToString:",_17)){
return objj_msgSend(CPArray,"array");
}
return objj_msgSend(objj_msgSend(_17,"substringFromIndex:",objj_msgSend(_16,"length")+1),"componentsSeparatedByString:",";");
}
}),new objj_method(sel_getUid("previousViewController"),function(_18,_19){
with(_18){
var _1a=objj_msgSend(parentViewController,"viewControllers"),_1b=objj_msgSend(_1a,"indexOfObject:",_18);
if(_1b===CPNotFound||_1b===0){
return nil;
}
return objj_msgSend(_1a,"objectAtIndex:",_1b-1);
}
}),new objj_method(sel_getUid("nextViewController"),function(_1c,_1d){
with(_1c){
var _1e=objj_msgSend(parentViewController,"viewControllers"),_1f=objj_msgSend(_1e,"indexOfObject:",_1c);
if(_1f===CPNotFound||objj_msgSend(_1e,"count")<=_1f+1){
return nil;
}
return objj_msgSend(_1e,"objectAtIndex:",_1f+1);
}
}),new objj_method(sel_getUid("path"),function(_20,_21){
with(_20){
return objj_msgSend(objj_msgSend(_20,"content"),"path");
}
}),new objj_method(sel_getUid("location"),function(_22,_23){
with(_22){
var _24=objj_msgSend(_22,"previousViewController"),_25=objj_msgSend(_24,"location");
if(objj_msgSend(_22,"respondsToSelector:",sel_getUid("isIncludedInStackHistory"))&&!objj_msgSend(_22,"isIncludedInStackHistory")){
return _25;
}
if(!_24||!_25){
return objj_msgSend(_22,"path");
}
return objj_msgSend(CPString,"stringWithFormat:","%@;%@",_25,objj_msgSend(_22,"path"));
}
}),new objj_method(sel_getUid("children"),function(_26,_27){
with(_26){
objj_msgSend(_26,"_raiseUnimplemented:",_27);
}
}),new objj_method(sel_getUid("showsNavigationBar"),function(_28,_29){
with(_28){
return YES;
}
}),new objj_method(sel_getUid("providesBackground"),function(_2a,_2b){
with(_2a){
return YES;
}
}),new objj_method(sel_getUid("ensureBackgroundFor:"),function(_2c,_2d,_2e){
with(_2c){
var _2f=objj_msgSend(_2c,"previousViewController");
if(!objj_msgSend(_2f,"providesBackground")){
var _30=objj_msgSend(objj_msgSend(MMDefaultBackgroundView,"alloc"),"initWithFrame:",objj_msgSend(_2e,"bounds"));
objj_msgSend(_2e,"addSubview:",_30);
}
}
}),new objj_method(sel_getUid("_raiseUnimplemented:"),function(_31,_32,_33){
with(_31){
objj_msgSend(CPException,"raise:reason:",MMViewControllerImplementationIncomplete,objj_msgSend(CPString,"stringWithFormat:","%@ does not implement method `%@'",CPStringFromClass(objj_msgSend(_31,"class")),_33));
}
})]);
p;31;Views/MMDefaultBackgroundView.jt;2552;@STATIC;1.0;I;15;AppKit/CPView.jt;2513;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"MMDefaultBackgroundView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("overlay"),new objj_ivar("overlayView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMDefaultBackgroundView").super_class},"initWithFrame:",_5)){
var _6=CGRectMake(0,0,CGRectGetWidth(_5),CGRectGetHeight(_5));
objj_msgSend(_3,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",32.5/255,1));
objj_msgSend(_3,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
overlayView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_6);
objj_msgSend(overlayView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_3,"addSubview:",overlayView);
if(CPFeatureIsCompatible(CPHTMLCanvasFeature)){
overlay=objj_msgSend(CALayer,"layer");
objj_msgSend(overlay,"setDelegate:",_3);
objj_msgSend(overlayView,"setLayer:",overlay);
}else{
objj_msgSend(overlayView,"setAlphaValue:",0.6);
objj_msgSend(overlayView,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
}
}
return _3;
}
}),new objj_method(sel_getUid("backgroundHidden"),function(_7,_8){
with(_7){
return objj_msgSend(overlayView,"isHidden");
}
}),new objj_method(sel_getUid("setBackgroundHidden:"),function(_9,_a,_b){
with(_9){
objj_msgSend(overlayView,"setHidden:",_b);
}
}),new objj_method(sel_getUid("drawLayer:inContext:"),function(_c,_d,_e,_f){
with(_c){
if(objj_msgSend(_c,"backgroundHidden")){
return;
}
var _10=5,_11=objj_msgSend(_c,"bounds");
CGContextBeginPath(_f);
CGContextSetFillColor(_f,objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1,0.6));
CGContextMoveToPoint(_f,CGRectGetMinX(_11),CGRectGetMinY(_11));
CGContextAddLineToPoint(_f,CGRectGetMaxX(_11),CGRectGetMinY(_11));
CGContextAddLineToPoint(_f,CGRectGetMaxX(_11),CGRectGetMaxY(_11));
CGContextAddLineToPoint(_f,CGRectGetMinX(_11),CGRectGetMaxY(_11));
CGContextAddLineToPoint(_f,CGRectGetMinX(_11),CGRectGetMinY(_11));
CGContextClosePath(_f);
CGContextFillPath(_f);
var _12;
var _13;
var _14=2;
var _15=[0,0.5];
var _16=[237/255,237/255,237/255,0,237/255,237/255,237/255,1];
_13=CGColorSpaceCreateDeviceRGB();
_12=CGGradientCreateWithColorComponents(_13,_16,_15,_14);
var _17=CGPointMake(0,CGRectGetMidY(_11)),_18=CGPointMake(1,CGRectGetMaxY(_11));
CGContextClip(_f);
CGContextDrawLinearGradient(_f,_12,_17,_18,0);
}
})]);
p;22;Models/PMCBaseObject.jt;29194;@STATIC;1.0;i;11;PMCObject.jt;29158;
var _1;
objj_executeFile("PMCObject.j",YES);
PMCBaseObjectTagAttributeMap=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:","writer","writers","director","directors","genre","genres","collection","collections");
PMCObjectTypeShow="show";
PMCObjectTypeMovie="movie";
PMCObjectTypeArtist="artist";
PMCObjectTypeAlbum="album";
PMCObjectTypeSeason="season";
PMCObjectTypeEpisode="episode";
PMCObjectTypePhoto="photo";
PMCBaseObjectStateCreated=0;
PMCBaseObjectStateProgress=1;
PMCBaseObjectStateMatching=2;
PMCBaseObjectStateDownloadingMetadata=3;
PMCBaseObjectStateLoadingMetadata=4;
PMCBaseObjectStateIdle=5;
PMCBaseObjectStateDeleted=9;
CPLocalizedString("show","A TV Show");
CPLocalizedString("movie","A movie");
CPLocalizedString("artist","A musical artist");
CPLocalizedString("album","A recording album");
CPLocalizedString("season","A TV Show season");
CPLocalizedString("episode","A TV Show episode");
CPLocalizedString("photo","A photo");
var _2=objj_allocateClassPair(PMCObject,"PMCBaseObject"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("key"),new objj_ivar("ratingKey"),new objj_ivar("path"),new objj_ivar("index"),new objj_ivar("title"),new objj_ivar("titleSort"),new objj_ivar("originalTitle"),new objj_ivar("tagline"),new objj_ivar("summary"),new objj_ivar("thumb"),new objj_ivar("art"),new objj_ivar("rating"),new objj_ivar("studio"),new objj_ivar("contentRating"),new objj_ivar("year"),new objj_ivar("originallyAvailableAt"),new objj_ivar("parentKey"),new objj_ivar("grandparentKey"),new objj_ivar("parentTitle"),new objj_ivar("parentIndex"),new objj_ivar("grandparentTitle"),new objj_ivar("genres"),new objj_ivar("writers"),new objj_ivar("directors"),new objj_ivar("collections"),new objj_ivar("type"),new objj_ivar("duration"),new objj_ivar("sourceTitle"),new objj_ivar("updatedAt"),new objj_ivar("deletedAt"),new objj_ivar("leafCount"),new objj_ivar("mediaFlagPrefix"),new objj_ivar("mediaFlagVersion"),new objj_ivar("thumbImage"),new objj_ivar("artImage"),new objj_ivar("state"),new objj_ivar("guid"),new objj_ivar("language"),new objj_ivar("matching"),new objj_ivar("idle"),new objj_ivar("loading"),new objj_ivar("titleLocked"),new objj_ivar("titleSortLocked"),new objj_ivar("originalTitleLocked"),new objj_ivar("taglineLocked"),new objj_ivar("yearLocked"),new objj_ivar("ratingLocked"),new objj_ivar("summaryLocked"),new objj_ivar("studioLocked"),new objj_ivar("contentRatingLocked"),new objj_ivar("originallyAvailableAtLocked"),new objj_ivar("writersLocked"),new objj_ivar("directorsLocked"),new objj_ivar("genresLocked"),new objj_ivar("collectionLocked"),new objj_ivar("thumbLocked"),new objj_ivar("artLocked")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("key"),function(_4,_5){
with(_4){
return key;
}
}),new objj_method(sel_getUid("setKey:"),function(_6,_7,_8){
with(_6){
key=_8;
}
}),new objj_method(sel_getUid("ratingKey"),function(_9,_a){
with(_9){
return ratingKey;
}
}),new objj_method(sel_getUid("setRatingKey:"),function(_b,_c,_d){
with(_b){
ratingKey=_d;
}
}),new objj_method(sel_getUid("path"),function(_e,_f){
with(_e){
return path;
}
}),new objj_method(sel_getUid("setPath:"),function(_10,_11,_12){
with(_10){
path=_12;
}
}),new objj_method(sel_getUid("index"),function(_13,_14){
with(_13){
return index;
}
}),new objj_method(sel_getUid("setIndex:"),function(_15,_16,_17){
with(_15){
index=_17;
}
}),new objj_method(sel_getUid("title"),function(_18,_19){
with(_18){
return title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_1a,_1b,_1c){
with(_1a){
title=_1c;
}
}),new objj_method(sel_getUid("titleSort"),function(_1d,_1e){
with(_1d){
return titleSort;
}
}),new objj_method(sel_getUid("setTitleSort:"),function(_1f,_20,_21){
with(_1f){
titleSort=_21;
}
}),new objj_method(sel_getUid("originalTitle"),function(_22,_23){
with(_22){
return originalTitle;
}
}),new objj_method(sel_getUid("setOriginalTitle:"),function(_24,_25,_26){
with(_24){
originalTitle=_26;
}
}),new objj_method(sel_getUid("tagline"),function(_27,_28){
with(_27){
return tagline;
}
}),new objj_method(sel_getUid("setTagline:"),function(_29,_2a,_2b){
with(_29){
tagline=_2b;
}
}),new objj_method(sel_getUid("summary"),function(_2c,_2d){
with(_2c){
return summary;
}
}),new objj_method(sel_getUid("setSummary:"),function(_2e,_2f,_30){
with(_2e){
summary=_30;
}
}),new objj_method(sel_getUid("thumb"),function(_31,_32){
with(_31){
return thumb;
}
}),new objj_method(sel_getUid("setThumb:"),function(_33,_34,_35){
with(_33){
thumb=_35;
}
}),new objj_method(sel_getUid("art"),function(_36,_37){
with(_36){
return art;
}
}),new objj_method(sel_getUid("setArt:"),function(_38,_39,_3a){
with(_38){
art=_3a;
}
}),new objj_method(sel_getUid("rating"),function(_3b,_3c){
with(_3b){
return rating;
}
}),new objj_method(sel_getUid("setRating:"),function(_3d,_3e,_3f){
with(_3d){
rating=_3f;
}
}),new objj_method(sel_getUid("studio"),function(_40,_41){
with(_40){
return studio;
}
}),new objj_method(sel_getUid("setStudio:"),function(_42,_43,_44){
with(_42){
studio=_44;
}
}),new objj_method(sel_getUid("contentRating"),function(_45,_46){
with(_45){
return contentRating;
}
}),new objj_method(sel_getUid("setContentRating:"),function(_47,_48,_49){
with(_47){
contentRating=_49;
}
}),new objj_method(sel_getUid("year"),function(_4a,_4b){
with(_4a){
return year;
}
}),new objj_method(sel_getUid("setYear:"),function(_4c,_4d,_4e){
with(_4c){
year=_4e;
}
}),new objj_method(sel_getUid("originallyAvailableAt"),function(_4f,_50){
with(_4f){
return originallyAvailableAt;
}
}),new objj_method(sel_getUid("setOriginallyAvailableAt:"),function(_51,_52,_53){
with(_51){
originallyAvailableAt=_53;
}
}),new objj_method(sel_getUid("parentKey"),function(_54,_55){
with(_54){
return parentKey;
}
}),new objj_method(sel_getUid("setParentKey:"),function(_56,_57,_58){
with(_56){
parentKey=_58;
}
}),new objj_method(sel_getUid("grandparentKey"),function(_59,_5a){
with(_59){
return grandparentKey;
}
}),new objj_method(sel_getUid("setGrandparentKey:"),function(_5b,_5c,_5d){
with(_5b){
grandparentKey=_5d;
}
}),new objj_method(sel_getUid("parentTitle"),function(_5e,_5f){
with(_5e){
return parentTitle;
}
}),new objj_method(sel_getUid("setParentTitle:"),function(_60,_61,_62){
with(_60){
parentTitle=_62;
}
}),new objj_method(sel_getUid("parentIndex"),function(_63,_64){
with(_63){
return parentIndex;
}
}),new objj_method(sel_getUid("setParentIndex:"),function(_65,_66,_67){
with(_65){
parentIndex=_67;
}
}),new objj_method(sel_getUid("grandparentTitle"),function(_68,_69){
with(_68){
return grandparentTitle;
}
}),new objj_method(sel_getUid("setGrandparentTitle:"),function(_6a,_6b,_6c){
with(_6a){
grandparentTitle=_6c;
}
}),new objj_method(sel_getUid("genres"),function(_6d,_6e){
with(_6d){
return genres;
}
}),new objj_method(sel_getUid("setGenres:"),function(_6f,_70,_71){
with(_6f){
genres=_71;
}
}),new objj_method(sel_getUid("writers"),function(_72,_73){
with(_72){
return writers;
}
}),new objj_method(sel_getUid("setWriters:"),function(_74,_75,_76){
with(_74){
writers=_76;
}
}),new objj_method(sel_getUid("directors"),function(_77,_78){
with(_77){
return directors;
}
}),new objj_method(sel_getUid("setDirectors:"),function(_79,_7a,_7b){
with(_79){
directors=_7b;
}
}),new objj_method(sel_getUid("collections"),function(_7c,_7d){
with(_7c){
return collections;
}
}),new objj_method(sel_getUid("setCollections:"),function(_7e,_7f,_80){
with(_7e){
collections=_80;
}
}),new objj_method(sel_getUid("type"),function(_81,_82){
with(_81){
return type;
}
}),new objj_method(sel_getUid("setType:"),function(_83,_84,_85){
with(_83){
type=_85;
}
}),new objj_method(sel_getUid("duration"),function(_86,_87){
with(_86){
return duration;
}
}),new objj_method(sel_getUid("setDuration:"),function(_88,_89,_8a){
with(_88){
duration=_8a;
}
}),new objj_method(sel_getUid("sourceTitle"),function(_8b,_8c){
with(_8b){
return sourceTitle;
}
}),new objj_method(sel_getUid("setSourceTitle:"),function(_8d,_8e,_8f){
with(_8d){
sourceTitle=_8f;
}
}),new objj_method(sel_getUid("updatedAt"),function(_90,_91){
with(_90){
return updatedAt;
}
}),new objj_method(sel_getUid("setUpdatedAt:"),function(_92,_93,_94){
with(_92){
updatedAt=_94;
}
}),new objj_method(sel_getUid("deletedAt"),function(_95,_96){
with(_95){
return deletedAt;
}
}),new objj_method(sel_getUid("setDeletedAt:"),function(_97,_98,_99){
with(_97){
deletedAt=_99;
}
}),new objj_method(sel_getUid("leafCount"),function(_9a,_9b){
with(_9a){
return leafCount;
}
}),new objj_method(sel_getUid("setLeafCount:"),function(_9c,_9d,_9e){
with(_9c){
leafCount=_9e;
}
}),new objj_method(sel_getUid("mediaFlagPrefix"),function(_9f,_a0){
with(_9f){
return mediaFlagPrefix;
}
}),new objj_method(sel_getUid("setMediaFlagPrefix:"),function(_a1,_a2,_a3){
with(_a1){
mediaFlagPrefix=_a3;
}
}),new objj_method(sel_getUid("mediaFlagVersion"),function(_a4,_a5){
with(_a4){
return mediaFlagVersion;
}
}),new objj_method(sel_getUid("setMediaFlagVersion:"),function(_a6,_a7,_a8){
with(_a6){
mediaFlagVersion=_a8;
}
}),new objj_method(sel_getUid("thumbImage"),function(_a9,_aa){
with(_a9){
return thumbImage;
}
}),new objj_method(sel_getUid("setThumbImage:"),function(_ab,_ac,_ad){
with(_ab){
thumbImage=_ad;
}
}),new objj_method(sel_getUid("artImage"),function(_ae,_af){
with(_ae){
return artImage;
}
}),new objj_method(sel_getUid("setArtImage:"),function(_b0,_b1,_b2){
with(_b0){
artImage=_b2;
}
}),new objj_method(sel_getUid("state"),function(_b3,_b4){
with(_b3){
return state;
}
}),new objj_method(sel_getUid("setState:"),function(_b5,_b6,_b7){
with(_b5){
state=_b7;
}
}),new objj_method(sel_getUid("guid"),function(_b8,_b9){
with(_b8){
return guid;
}
}),new objj_method(sel_getUid("setGuid:"),function(_ba,_bb,_bc){
with(_ba){
guid=_bc;
}
}),new objj_method(sel_getUid("language"),function(_bd,_be){
with(_bd){
return language;
}
}),new objj_method(sel_getUid("setLanguage:"),function(_bf,_c0,_c1){
with(_bf){
language=_c1;
}
}),new objj_method(sel_getUid("isMatching"),function(_c2,_c3){
with(_c2){
return matching;
}
}),new objj_method(sel_getUid("isIdle"),function(_c4,_c5){
with(_c4){
return idle;
}
}),new objj_method(sel_getUid("isLoading"),function(_c6,_c7){
with(_c6){
return loading;
}
}),new objj_method(sel_getUid("isTitleLocked"),function(_c8,_c9){
with(_c8){
return titleLocked;
}
}),new objj_method(sel_getUid("setTitleLocked:"),function(_ca,_cb,_cc){
with(_ca){
titleLocked=_cc;
}
}),new objj_method(sel_getUid("isTitleSortLocked"),function(_cd,_ce){
with(_cd){
return titleSortLocked;
}
}),new objj_method(sel_getUid("setTitleSortLocked:"),function(_cf,_d0,_d1){
with(_cf){
titleSortLocked=_d1;
}
}),new objj_method(sel_getUid("isOriginalTitleLocked"),function(_d2,_d3){
with(_d2){
return originalTitleLocked;
}
}),new objj_method(sel_getUid("setOriginalTitleLocked:"),function(_d4,_d5,_d6){
with(_d4){
originalTitleLocked=_d6;
}
}),new objj_method(sel_getUid("isTaglineLocked"),function(_d7,_d8){
with(_d7){
return taglineLocked;
}
}),new objj_method(sel_getUid("setTaglineLocked:"),function(_d9,_da,_db){
with(_d9){
taglineLocked=_db;
}
}),new objj_method(sel_getUid("isYearLocked"),function(_dc,_dd){
with(_dc){
return yearLocked;
}
}),new objj_method(sel_getUid("setYearLocked:"),function(_de,_df,_e0){
with(_de){
yearLocked=_e0;
}
}),new objj_method(sel_getUid("isRatingLocked"),function(_e1,_e2){
with(_e1){
return ratingLocked;
}
}),new objj_method(sel_getUid("setRatingLocked:"),function(_e3,_e4,_e5){
with(_e3){
ratingLocked=_e5;
}
}),new objj_method(sel_getUid("isSummaryLocked"),function(_e6,_e7){
with(_e6){
return summaryLocked;
}
}),new objj_method(sel_getUid("setSummaryLocked:"),function(_e8,_e9,_ea){
with(_e8){
summaryLocked=_ea;
}
}),new objj_method(sel_getUid("isStudioLocked"),function(_eb,_ec){
with(_eb){
return studioLocked;
}
}),new objj_method(sel_getUid("setStudioLocked:"),function(_ed,_ee,_ef){
with(_ed){
studioLocked=_ef;
}
}),new objj_method(sel_getUid("isContentRatingLocked"),function(_f0,_f1){
with(_f0){
return contentRatingLocked;
}
}),new objj_method(sel_getUid("setContentRatingLocked:"),function(_f2,_f3,_f4){
with(_f2){
contentRatingLocked=_f4;
}
}),new objj_method(sel_getUid("isOriginallyAvailableAtLocked"),function(_f5,_f6){
with(_f5){
return originallyAvailableAtLocked;
}
}),new objj_method(sel_getUid("setOriginallyAvailableAtLocked:"),function(_f7,_f8,_f9){
with(_f7){
originallyAvailableAtLocked=_f9;
}
}),new objj_method(sel_getUid("isWritersLocked"),function(_fa,_fb){
with(_fa){
return writersLocked;
}
}),new objj_method(sel_getUid("setWritersLocked:"),function(_fc,_fd,_fe){
with(_fc){
writersLocked=_fe;
}
}),new objj_method(sel_getUid("isDirectorsLocked"),function(_ff,_100){
with(_ff){
return directorsLocked;
}
}),new objj_method(sel_getUid("setDirectorsLocked:"),function(self,_101,_102){
with(self){
directorsLocked=_102;
}
}),new objj_method(sel_getUid("isGenresLocked"),function(self,_103){
with(self){
return genresLocked;
}
}),new objj_method(sel_getUid("setGenresLocked:"),function(self,_104,_105){
with(self){
genresLocked=_105;
}
}),new objj_method(sel_getUid("isCollectionLocked"),function(self,_106){
with(self){
return collectionLocked;
}
}),new objj_method(sel_getUid("setCollectionLocked:"),function(self,_107,_108){
with(self){
collectionLocked=_108;
}
}),new objj_method(sel_getUid("isThumbLocked"),function(self,_109){
with(self){
return thumbLocked;
}
}),new objj_method(sel_getUid("setThumbLocked:"),function(self,_10a,_10b){
with(self){
thumbLocked=_10b;
}
}),new objj_method(sel_getUid("isArtLocked"),function(self,_10c){
with(self){
return artLocked;
}
}),new objj_method(sel_getUid("setArtLocked:"),function(self,_10d,_10e){
with(self){
artLocked=_10e;
}
}),new objj_method(sel_getUid("displayTitle"),function(self,_10f){
with(self){
var _110=objj_msgSend(CPString,"stringWithFormat:"," (%d)",year);
if(objj_msgSend(title,"hasSuffix:",_110)){
return objj_msgSend(title,"substringToIndex:",objj_msgSend(title,"length")-objj_msgSend(_110,"length"));
}else{
return title;
}
}
}),new objj_method(sel_getUid("setKey:"),function(self,_111,aKey){
with(self){
key=aKey;
objj_msgSend(self,"setId:",objj_msgSend(objj_msgSend(self,"class"),"idFromKey:",aKey));
}
}),new objj_method(sel_getUid("setIndex:"),function(self,_112,_113){
with(self){
if(objj_msgSend(_113,"isKindOfClass:",objj_msgSend(CPString,"class"))){
_113=Number(_113);
}
index=_113;
}
}),new objj_method(sel_getUid("setOriginallyAvailableAt:"),function(self,_114,_115){
with(self){
originallyAvailableAt=objj_msgSend(self,"parseDate:",_115);
}
}),new objj_method(sel_getUid("setRating:"),function(self,_116,_117){
with(self){
if(objj_msgSend(_117,"isKindOfClass:",objj_msgSend(CPString,"class"))){
_117=Number(_117);
}
rating=_117;
}
}),new objj_method(sel_getUid("setYear:"),function(self,_118,_119){
with(self){
if(objj_msgSend(_119,"isKindOfClass:",objj_msgSend(CPString,"class"))){
_119=Number(_119);
}
year=_119;
}
}),new objj_method(sel_getUid("setDuration:"),function(self,_11a,_11b){
with(self){
if(objj_msgSend(_11b,"isKindOfClass:",objj_msgSend(CPString,"class"))){
_11b=Number(_11b);
}
duration=_11b;
}
}),new objj_method(sel_getUid("setUpdatedAt:"),function(self,_11c,_11d){
with(self){
updatedAt=objj_msgSend(self,"parseDate:",_11d);
}
}),new objj_method(sel_getUid("setDeletedAt:"),function(self,_11e,_11f){
with(self){
deletedAt=objj_msgSend(self,"parseDate:",_11f);
if(deletedAt){
objj_msgSend(objj_msgSend(self,"librarySection"),"addTrashedItem:",self);
}else{
objj_msgSend(objj_msgSend(self,"librarySection"),"removeTrashedItem:",self);
}
}
}),new objj_method(sel_getUid("setLeafCount:"),function(self,_120,_121){
with(self){
if(objj_msgSend(_121,"isKindOfClass:",objj_msgSend(CPString,"class"))){
_121=Number(_121);
}
leafCount=_121;
}
}),new objj_method(sel_getUid("titleSort"),function(self,_122){
with(self){
return titleSort||title;
}
}),new objj_method(sel_getUid("setThumb:"),function(self,_123,_124){
with(self){
if(thumb===_124){
return;
}
thumb=_124;
objj_msgSend(self,"willChangeValueForKey:","thumbImage");
thumbImage=nil;
objj_msgSend(self,"didChangeValueForKey:","thumbImage");
}
}),new objj_method(sel_getUid("thumbURL"),function(self,_125){
with(self){
if(!thumb){
return nil;
}
return objj_msgSend(PMSURL,"URLWithPath:",thumb);
}
}),new objj_method(sel_getUid("thumbImage"),function(self,_126){
with(self){
if(!thumb){
return nil;
}
if(!thumbImage){
thumbImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(self,"thumbURL"),CGSizeMake(-1,-1));
}
return thumbImage;
}
}),new objj_method(sel_getUid("setArt:"),function(self,_127,_128){
with(self){
if(art===_128){
return;
}
art=_128;
objj_msgSend(self,"willChangeValueForKey:","artImage");
artImage=nil;
objj_msgSend(self,"didChangeValueForKey:","artImage");
}
}),new objj_method(sel_getUid("artImage"),function(self,_129){
with(self){
if(!art){
return nil;
}
if(!artImage){
artImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(self,"artURL"),CGSizeMake(-1,-1));
}
return artImage;
}
}),new objj_method(sel_getUid("artURL"),function(self,_12a){
with(self){
if(!art){
return nil;
}
return objj_msgSend(PMSURL,"URLWithPath:",art);
}
}),new objj_method(sel_getUid("mediaFlagPrefix"),function(self,_12b){
with(self){
return mediaFlagPrefix||objj_msgSend(objj_msgSend(self,"parent"),"mediaFlagPrefix");
}
}),new objj_method(sel_getUid("mediaFlagVersion"),function(self,_12c){
with(self){
return mediaFlagVersion||objj_msgSend(objj_msgSend(self,"parent"),"mediaFlagVersion");
}
}),new objj_method(sel_getUid("URLForFlag:"),function(self,_12d,_12e){
with(self){
var _12f=objj_msgSend(self,"valueForKey:",_12e);
if(_12f==nil){
return nil;
}
var _130=objj_msgSend(self,"mediaFlagPrefix");
var _131=objj_msgSend(self,"mediaFlagVersion");
if(!_130){
return nil;
}
return objj_msgSend(PMSURL,"URLWithPath:params:",objj_msgSend(CPString,"stringWithFormat:","%@%@/%@",_130,_12e,encodeURIComponent(_12f)),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_131,"t"));
}
}),new objj_method(sel_getUid("studioFlagURL"),function(self,_132){
with(self){
return objj_msgSend(self,"URLForFlag:","studio");
}
}),new objj_method(sel_getUid("contentRatingFlagURL"),function(self,_133){
with(self){
return objj_msgSend(self,"URLForFlag:","contentRating");
}
}),new objj_method(sel_getUid("audioCodec"),function(self,_134){
with(self){
return objj_msgSend(objj_msgSend(mediaItems,"anyObject"),"audioCodec");
}
}),new objj_method(sel_getUid("audioCodecFlagURL"),function(self,_135){
with(self){
return objj_msgSend(self,"URLForFlag:","audioCodec");
}
}),new objj_method(sel_getUid("videoCodec"),function(self,_136){
with(self){
return objj_msgSend(objj_msgSend(mediaItems,"anyObject"),"videoCodec");
}
}),new objj_method(sel_getUid("videoCodecFlagURL"),function(self,_137){
with(self){
return objj_msgSend(self,"URLForFlag:","videoCodec");
}
}),new objj_method(sel_getUid("aspectRatioFlagURL"),function(self,_138){
with(self){
return objj_msgSend(self,"URLForFlag:","aspectRatio");
}
}),new objj_method(sel_getUid("audioChannels"),function(self,_139){
with(self){
return objj_msgSend(objj_msgSend(mediaItems,"anyObject"),"audioChannels");
}
}),new objj_method(sel_getUid("audioChannelsFlagURL"),function(self,_13a){
with(self){
return objj_msgSend(self,"URLForFlag:","audioChannels");
}
}),new objj_method(sel_getUid("videoResolution"),function(self,_13b){
with(self){
return objj_msgSend(objj_msgSend(mediaItems,"anyObject"),"videoResolution");
}
}),new objj_method(sel_getUid("videoResolutionFlagURL"),function(self,_13c){
with(self){
return objj_msgSend(self,"URLForFlag:","videoResolution");
}
}),new objj_method(sel_getUid("videoFrameRateFlagURL"),function(self,_13d){
with(self){
return objj_msgSend(self,"URLForFlag:","videoFrameRate");
}
}),new objj_method(sel_getUid("setState:"),function(self,_13e,_13f){
with(self){
if(objj_msgSend(_13f,"isKindOfClass:",objj_msgSend(CPString,"class"))){
_13f=Number(_13f);
}
state=_13f;
}
}),new objj_method(sel_getUid("isMatching"),function(self,_140){
with(self){
return state===PMCBaseObjectStateMatching;
}
}),new objj_method(sel_getUid("isIdle"),function(self,_141){
with(self){
return state===PMCBaseObjectStateIdle||state===nil;
}
}),new objj_method(sel_getUid("isLoading"),function(self,_142){
with(self){
return state===PMCBaseObjectStateDownloadingMetadata||state===PMCBaseObjectStateLoadingMetadata;
}
}),new objj_method(sel_getUid("stateString"),function(self,_143){
with(self){
switch(state){
case PMCBaseObjectStateCreated:
return "created";
case PMCBaseObjectStateProgress:
return "progress";
case PMCBaseObjectStateMatching:
return "matching";
case PMCBaseObjectStateDownloadingMetadata:
return "downloading metadata";
case PMCBaseObjectStateLoadingMetadata:
return "loading metadata";
case PMCBaseObjectStateIdle:
return "idle";
case PMCBaseObjectStateDeleted:
return "deleted";
}
}
}),new objj_method(sel_getUid("description"),function(self,_144){
with(self){
return objj_msgSend(CPString,"stringWithFormat:","{%@ (%d) %@}",objj_msgSend(self,"title"),objj_msgSend(self,"year"),"0x"+objj_msgSend(CPString,"stringWithHash:",objj_msgSend(self,"UID")));
}
}),new objj_method(sel_getUid("root"),function(self,_145){
with(self){
var root=self;
while(objj_msgSend(objj_msgSend(root,"parent"),"isKindOfClass:",objj_msgSend(self,"class"))){
root=objj_msgSend(root,"parent");
}
return root;
}
}),new objj_method(sel_getUid("setGuid:"),function(self,_146,_147){
with(self){
if(guid===_147){
return;
}
var m=_147&&_147.match(/lang=(\w+)/);
if(m&&m[1]!=objj_msgSend(objj_msgSend(LanguageConfig,"noLanguage"),"languageCode")){
objj_msgSend(self,"setLanguage:",m[1]);
}
guid=_147;
}
}),new objj_method(sel_getUid("agent"),function(self,_148){
with(self){
if(!guid){
return nil;
}
var _149=objj_msgSend(guid,"rangeOfString:","://").location;
if(_149==CPNotFound){
return nil;
}
return objj_msgSend(objj_msgSend(MMAgent,"alloc"),"initWithIdentifier:",objj_msgSend(guid,"substringToIndex:",_149));
}
}),new objj_method(sel_getUid("isPersonalMedia"),function(self,_14a){
with(self){
return objj_msgSend(objj_msgSend(self,"agent"),"isEqual:",MMPersonalMediaAgent);
}
}),new objj_method(sel_getUid("librarySection"),function(self,_14b){
with(self){
if(objj_msgSend(objj_msgSend(self,"parent"),"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"))){
return objj_msgSend(self,"parent");
}
return objj_msgSend(objj_msgSend(self,"parent"),"librarySection");
}
}),new objj_method(sel_getUid("URL"),function(self,_14c){
with(self){
return objj_msgSend(PMSURL,"URLWithPath:",objj_msgSend(self,"path"));
}
}),new objj_method(sel_getUid("addToCollection:"),function(self,_14d,_14e){
with(self){
if(objj_msgSend(_14e,"isKindOfClass:",objj_msgSend(PMCDirectoryObject,"class"))){
_14e=objj_msgSend(_14e,"title");
}
objj_msgSend(self,"addTag:forType:",_14e,"collections");
objj_msgSend(self,"setValue:forKey:",YES,"collectionLocked");
}
}),new objj_method(sel_getUid("removeFromCollection:"),function(self,_14f,_150){
with(self){
if(objj_msgSend(_150,"isKindOfClass:",objj_msgSend(PMCDirectoryObject,"class"))){
_150=objj_msgSend(_150,"title");
}
objj_msgSend(self,"removeTag:forType:",_150,"collections");
}
}),new objj_method(sel_getUid("belongsToCollection:"),function(self,_151,_152){
with(self){
if(objj_msgSend(_152,"isKindOfClass:",objj_msgSend(PMCDirectoryObject,"class"))){
_152=objj_msgSend(_152,"title");
}
return objj_msgSend(self,"hasTag:forType:",_152,"collections");
}
}),new objj_method(sel_getUid("hasTag:forType:"),function(self,_153,aTag,_154){
with(self){
return objj_msgSend(self,"indexOfTag:forType:",aTag,_154)!=CPNotFound;
}
}),new objj_method(sel_getUid("indexOfTag:forType:"),function(self,_155,aTag,_156){
with(self){
if(objj_msgSend(self,"valueForKey:",_156)==nil){
objj_msgSend(self,"setValue:forKey:",objj_msgSend(CPMutableArray,"array"),_156);
}
for(var i=0,tags=objj_msgSend(self,"valueForKey:",_156),_157=objj_msgSend(tags,"count");i<_157;i++){
if(objj_msgSend(objj_msgSend(tags,"objectAtIndex:",i),"caseInsensitiveCompare:",aTag)==CPOrderedSame){
return i;
}
}
return CPNotFound;
}
}),new objj_method(sel_getUid("addTag:forType:"),function(self,_158,aTag,_159){
with(self){
if(!aTag||objj_msgSend(self,"hasTag:forType:",aTag,_159)){
return;
}
objj_msgSend(self,"willChangeValueForKey:",_159);
objj_msgSend(objj_msgSend(self,"valueForKey:",_159),"addObject:",aTag);
objj_msgSend(self,"didChangeValueForKey:",_159);
}
}),new objj_method(sel_getUid("removeTag:forType:"),function(self,_15a,aTag,_15b){
with(self){
var _15c=objj_msgSend(self,"indexOfTag:forType:",aTag,_15b);
if(_15c==CPNotFound){
return;
}
objj_msgSend(self,"willChangeValueForKey:",_15b);
objj_msgSend(objj_msgSend(self,"valueForKey:",_15b),"removeObjectAtIndex:",_15c);
objj_msgSend(self,"didChangeValueForKey:",_15b);
}
}),new objj_method(sel_getUid("isEqual:"),function(self,_15d,_15e){
with(self){
return (self===_15e)||(objj_msgSend(_15e,"isKindOfClass:",objj_msgSend(self,"class"))&&objj_msgSend(objj_msgSend(self,"id"),"isEqual:",objj_msgSend(_15e,"id")));
}
}),new objj_method(sel_getUid("changedAttributeDictionary"),function(self,_15f){
with(self){
var _160=objj_msgSend(CPDictionary,"dictionary"),_161=objj_msgSendSuper({receiver:self,super_class:objj_getClass("PMCBaseObject").super_class},"changedAttributeDictionary"),keys=objj_msgSend(_161,"keyEnumerator"),key;
while(key=objj_msgSend(keys,"nextObject")){
var _162=objj_msgSend(_161,"objectForKey:",key),_163=key,_164=objj_msgSend(key,"rangeOfString:","Locked"),_165=_162;
if(CPMaxRange(_164)==objj_msgSend(key,"length")){
var _166=objj_msgSend(key,"substringToIndex:",_164.location);
if(objj_msgSend(PMCBaseObjectTagAttributeMap,"containsKey:",_166)){
_166=objj_msgSend(PMCBaseObjectTagAttributeMap,"objectForKey:",_166);
}
_163=_166+".locked";
_165=_162?"1":"0";
objj_msgSend(_160,"setObject:forKey:",_165,_163);
}else{
if(objj_msgSend(PMCBaseObjectTagAttributeMap,"containsKey:",key)){
var tags=objj_msgSend(_161,"objectForKey:",key),_167=objj_msgSend(PMCBaseObjectTagAttributeMap,"objectForKey:",key);
if(objj_msgSend(tags,"count")){
for(var i=0,_168=objj_msgSend(tags,"count");i<_168;i++){
_163=objj_msgSend(CPString,"stringWithFormat:","%@[%d].tag.tag",_167,i);
_165=tags[i];
objj_msgSend(_160,"setObject:forKey:",_165,_163);
}
}else{
_163=objj_msgSend(CPString,"stringWithFormat:","%@[]",_167);
_165="";
objj_msgSend(_160,"setObject:forKey:",_165,_163);
}
}else{
objj_msgSend(_160,"setObject:forKey:",_165,_163);
}
}
}
return _160;
}
}),new objj_method(sel_getUid("unlockAllAttributes"),function(self,_169){
with(self){
var _16a=objj_msgSend(objj_msgSend(objj_msgSend(self,"class"),"observedAttributes"),"objectEnumerator"),_16b=nil;
while(_16b=objj_msgSend(_16a,"nextObject")){
if(objj_msgSend(_16b,"hasSuffix:","Locked")){
objj_msgSend(self,"setValue:forKey:",NO,_16b);
}
}
}
}),new objj_method(sel_getUid("recordWasDeleted"),function(self,_16c){
with(self){
if(deletedAt){
objj_msgSend(objj_msgSend(self,"librarySection"),"removeTrashedItem:",self);
}
}
}),new objj_method(sel_getUid("isCollection"),function(self,_16d){
with(self){
return /collection\/(\d+)$/.test(objj_msgSend(self,"path"));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("observedAttributes"),function(self,_16e){
with(self){
return objj_msgSend(CPSet,"setWithObjects:","title","titleSort","originalTitle","tagline","year","rating","summary","studio","contentRating","originallyAvailableAt","writers","directors","genres","collections","titleLocked","titleSortLocked","originalTitleLocked","taglineLocked","yearLocked","ratingLocked","summaryLocked","studioLocked","contentRatingLocked","originallyAvailableAtLocked","writersLocked","directorsLocked","genresLocked","collectionLocked","parentTitle");
}
}),new objj_method(sel_getUid("blankThumbImage"),function(self,_16f){
with(self){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","BlankPoster.png"));
}
return objj_msgSend(_1,"copy");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingDisplayTitle"),function(self,_170){
with(self){
return objj_msgSend(CPSet,"setWithObject:","title","year");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingMatching"),function(self,_171){
with(self){
return objj_msgSend(CPSet,"setWithObject:","state");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingLoading"),function(self,_172){
with(self){
return objj_msgSend(CPSet,"setWithObject:","state");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingIdle"),function(self,_173){
with(self){
return objj_msgSend(CPSet,"setWithObject:","state");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingAgent"),function(self,_174){
with(self){
return objj_msgSend(CPSet,"setWithObjects:","guid");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingPersonalMedia"),function(self,_175){
with(self){
return objj_msgSend(CPSet,"setWithObjects:","agent");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingRoot"),function(self,_176){
with(self){
return objj_msgSend(CPSet,"setWithObject:","parent");
}
}),new objj_method(sel_getUid("idFromKey:"),function(self,_177,aKey){
with(self){
return aKey&&aKey.replace(/[^\d]/g,"");
}
})]);
p;18;Models/PMCObject.jt;916;@STATIC;1.0;i;10;MMRecord.jt;883;
objj_executeFile("MMRecord.j",YES);
var _1=objj_allocateClassPair(MMRecord,"PMCObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("parent"),new objj_ivar("server"),new objj_ivar("tag")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("parent"),function(_3,_4){
with(_3){
return parent;
}
}),new objj_method(sel_getUid("setParent:"),function(_5,_6,_7){
with(_5){
parent=_7;
}
}),new objj_method(sel_getUid("server"),function(_8,_9){
with(_8){
return server;
}
}),new objj_method(sel_getUid("setServer:"),function(_a,_b,_c){
with(_a){
server=_c;
}
}),new objj_method(sel_getUid("tag"),function(_d,_e){
with(_d){
return tag;
}
}),new objj_method(sel_getUid("setTag:"),function(_f,_10,_11){
with(_f){
tag=_11;
}
}),new objj_method(sel_getUid("container"),function(_12,_13){
with(_12){
return objj_msgSend(objj_msgSend(_12,"parent"),"container");
}
})]);
p;17;Models/MMRecord.jt;6192;@STATIC;1.0;t;6173;
var _1=objj_msgSend(CPDictionary,"dictionary");
MMRecordWillAcceptChangedAttributes="MMRecordWillAcceptChangedAttributes";
MMRecordDidAcceptChangedAttributes="MMRecordDidAcceptChangedAttributes";
var _2=objj_allocateClassPair(CPObject,"MMRecord"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_id"),new objj_ivar("_dataStore"),new objj_ivar("_changedAttributes"),new objj_ivar("_trackingChanges")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("id"),function(_4,_5){
with(_4){
return _id;
}
}),new objj_method(sel_getUid("setId:"),function(_6,_7,_8){
with(_6){
_id=_8;
}
}),new objj_method(sel_getUid("dataStore"),function(_9,_a){
with(_9){
return _dataStore;
}
}),new objj_method(sel_getUid("setDataStore:"),function(_b,_c,_d){
with(_b){
_dataStore=_d;
}
}),new objj_method(sel_getUid("init"),function(_e,_f){
with(_e){
if(_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("MMRecord").super_class},"init")){
_changedAttributes=objj_msgSend(CPMutableDictionary,"dictionary");
_trackingChanges=YES;
}
return _e;
}
}),new objj_method(sel_getUid("isNewRecord"),function(_10,_11){
with(_10){
return _id==nil;
}
}),new objj_method(sel_getUid("stopTrackingChangesInBlock:"),function(_12,_13,_14){
with(_12){
var _15=_trackingChanges;
_trackingChanges=NO;
try{
_14();
}
catch(ex){
throw ex;
}
finally{
_trackingChanges=_15;
}
}
}),new objj_method(sel_getUid("acceptChangedAttributes"),function(_16,_17){
with(_16){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",MMRecordWillAcceptChangedAttributes,_16);
objj_msgSend(_changedAttributes,"removeAllObjects");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",MMRecordDidAcceptChangedAttributes,_16);
}
}),new objj_method(sel_getUid("rejectChangedAttributes"),function(_18,_19){
with(_18){
var _1a=objj_msgSend(_changedAttributes,"keyEnumerator"),key=nil;
while(key=objj_msgSend(_1a,"nextObject")){
objj_msgSend(_18,"setValue:forKey:",objj_msgSend(_changedAttributes,"objectForKey:",key),key);
}
objj_msgSend(_changedAttributes,"removeAllObjects");
}
}),new objj_method(sel_getUid("changedAttributeKeys"),function(_1b,_1c){
with(_1b){
return objj_msgSend(CPSet,"setWithArray:",objj_msgSend(_changedAttributes,"allKeys"));
}
}),new objj_method(sel_getUid("changedAttributeDictionary"),function(_1d,_1e){
with(_1d){
var _1f=objj_msgSend(CPDictionary,"dictionary"),_20=objj_msgSend(_changedAttributes,"keyEnumerator"),key=nil;
while(key=objj_msgSend(_20,"nextObject")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(_1d,"valueForKey:",key),key);
}
return _1f;
}
}),new objj_method(sel_getUid("attributeForKeyHasChanged:"),function(_21,_22,_23){
with(_21){
return objj_msgSend(_changedAttributes,"containsKey:",_23);
}
}),new objj_method(sel_getUid("parseDate:"),function(_24,_25,_26){
with(_24){
if(objj_msgSend(_26,"isKindOfClass:",CPString)){
var _27;
if(/^\d+$/.test(_26)){
return objj_msgSend(objj_msgSend(CPDate,"alloc"),"initWithTimeIntervalSince1970:",_26);
}else{
if(_27=_26.match(/^(\d{4})-(\d\d?)-(\d\d?)$/)){
return new Date(_27[1],Number(_27[2])-1,_27[3]);
}else{
return Date.parse(_26);
}
}
}else{
if(!_26||objj_msgSend(_26,"isKindOfClass:",CPDate)){
return _26;
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(CPString,"stringWithFormat:","date must be of type %@ (got %@)",CPDate,objj_msgSend(_26,"class")));
}
}
}
}),new objj_method(sel_getUid("recordWasCreated"),function(_28,_29){
with(_28){
}
}),new objj_method(sel_getUid("recordWasUpdated"),function(_2a,_2b){
with(_2a){
}
}),new objj_method(sel_getUid("recordWasDeleted"),function(_2c,_2d){
with(_2c){
}
}),new objj_method(sel_getUid("copy"),function(_2e,_2f){
with(_2e){
var _30=objj_msgSend(objj_msgSend(objj_msgSend(_2e,"class"),"alloc"),"init");
objj_msgSend(_30,"takeAttributesFromRecord:onlyChanges:",_2e,NO);
objj_msgSend(_30,"setId:",nil);
objj_msgSend(_30,"acceptChangedAttributes");
return _30;
}
}),new objj_method(sel_getUid("takeAttributesFromRecord:onlyChanges:"),function(_31,_32,_33,_34){
with(_31){
objj_msgSend(objj_msgSend(objj_msgSend(_31,"class"),"allObservedAttributes"),"enumerateObjectsUsingBlock:",function(_35){
if(!_34||objj_msgSend(_33,"attributeForKeyHasChanged:",_35)){
objj_msgSend(_31,"setValue:forKey:",objj_msgSend(objj_msgSend(_33,"valueForKey:",_35),"copy"),_35);
}
});
}
}),new objj_method(sel_getUid("willChangeValueForKey:"),function(_36,_37,_38){
with(_36){
if(_trackingChanges&&!objj_msgSend(_changedAttributes,"containsKey:",_38)){
objj_msgSend(_changedAttributes,"setObject:forKey:",objj_msgSend(_36,"valueForKey:",_38)||objj_msgSend(CPNull,"null"),_38);
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("observedAttributes"),function(_39,_3a){
with(_39){
return objj_msgSend(CPSet,"set");
}
}),new objj_method(sel_getUid("allObservedAttributes"),function(_3b,_3c){
with(_3b){
return _1[objj_msgSend(_3b,"UID")];
}
}),new objj_method(sel_getUid("initialize"),function(_3d,_3e){
with(_3d){
objj_msgSend(_3d,"_loadObservedAttributes");
objj_msgSend(_1[objj_msgSend(_3d,"UID")],"enumerateObjectsUsingBlock:",function(key){
var _3f=key.charAt(0).toUpperCase()+key.substring(1),_40=sel_getUid("set"+_3f+":"),_41=class_getInstanceMethod(_3d,_40);
if(_41){
var _42=_41.method_imp;
if(!_42.isMMRecordWrapper){
var _43=function(_44,_45,_46){
objj_msgSend(_44,"willChangeValueForKey:",key);
_42(_44,_45,_46);
objj_msgSend(_44,"didChangeValueForKey:",key);
};
_43.isMMRecordWrapper=YES;
class_addMethod(_3d,_40,_43,"");
}
}
});
}
}),new objj_method(sel_getUid("_loadObservedAttributes"),function(_47,_48){
with(_47){
if(objj_msgSend(_47,"allObservedAttributes")){
return;
}
var _49=objj_msgSend(objj_msgSend(_47,"observedAttributes"),"copy");
if(objj_msgSend(objj_msgSend(_47,"superclass"),"respondsToSelector:",sel_getUid("_loadObservedAttributes"))){
objj_msgSend(objj_msgSend(_47,"superclass"),"_loadObservedAttributes");
objj_msgSend(_49,"unionSet:",objj_msgSend(objj_msgSend(_47,"superclass"),"allObservedAttributes"));
}
CPLog.debug("[%@ _loadObservedAttributes] observedAttributes: %@",_47,_49);
_1[objj_msgSend(_47,"UID")]=_49;
}
})]);
p;15;Models/PMSURL.jt;2104;@STATIC;1.0;I;18;Foundation/CPURL.ji;16;../PMSSecurity.jt;2041;
objj_executeFile("Foundation/CPURL.j",NO);
objj_executeFile("../PMSSecurity.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPURL,"PMSURL"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_4,_5){
with(_4){
if((typeof window=="undefined")||(typeof window.location=="undefined")){
return;
}
var _6=window.location,_7=_6.host,_8=_6.protocol;
_1=objj_msgSend(CPURL,"URLWithString:",objj_msgSend(CPString,"stringWithFormat:","%@//%@/",_8,_7));
}
}),new objj_method(sel_getUid("PMSBaseURL"),function(_9,_a){
with(_9){
return _1;
}
}),new objj_method(sel_getUid("setPMSBaseURL:"),function(_b,_c,_d){
with(_b){
_1=_d;
}
}),new objj_method(sel_getUid("URLWithPath:"),function(_e,_f,_10){
with(_e){
return objj_msgSend(_e,"URLWithPath:params:",_10,nil);
}
}),new objj_method(sel_getUid("URLWithPath:params:"),function(_11,_12,_13,_14){
with(_11){
return objj_msgSend(_11,"URLWithPath:query:",_13,objj_msgSend(_14,"URLParams"));
}
}),new objj_method(sel_getUid("URLWithPath:query:"),function(_15,_16,_17,_18){
with(_15){
if(_17==nil){
return nil;
}
var _19=objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"username"),_1a=objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"hashedPassword"),_1b=objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"token");
if(_1b||(_19&&_1a)){
_18=_18?(_18+"&"):"";
}
if(_1b){
_18+=objj_msgSend(CPString,"stringWithFormat:","X-Plex-Token=%@",_1b);
}else{
if(_19&&_1a){
_18+=objj_msgSend(CPString,"stringWithFormat:","X-Plex-User=%@&X-Plex-Pass=%@",_19,_1a);
}
}
if(_18){
if(objj_msgSend(_17,"isKindOfClass:",CPURL)){
_17=objj_msgSend(_17,"absoluteString");
}
if(_17.indexOf("?")==CPNotFound){
_17+="?"+_18;
}else{
_17+="&"+_18;
}
}
return objj_msgSend(_15,"URLWithString:relativeToURL:",_17,_1);
}
}),new objj_method(sel_getUid("isPMSURL:"),function(_1c,_1d,_1e){
with(_1c){
var _1f=objj_msgSend(_1e,"isKindOfClass:",objj_msgSend(CPURL,"class"))?objj_msgSend(_1e,"absoluteString"):_1e;
return objj_msgSend(_1f,"hasPrefix:",_1);
}
})]);
p;13;PMSSecurity.jt;4770;@STATIC;1.0;I;21;Foundation/CPObject.jI;28;Foundation/CPURLConnection.jI;27;Foundation/CPUserDefaults.jt;4660;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPURLConnection.j",NO);
objj_executeFile("Foundation/CPUserDefaults.j",NO);
PMSSecurityUserKey="PlexUser";
PMSSecurityPassKey="PlexPass";
PMSSecurityTokenKey="PlexToken";
var _1=nil;
var _2=nil;
var _3=objj_allocateClassPair(CPObject,"PMSSecurity"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("securityEnabled"),new objj_ivar("username"),new objj_ivar("password"),new objj_ivar("token"),new objj_ivar("shouldPersistCredentials"),new objj_ivar("userDefaults")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("securityEnabled"),function(_5,_6){
with(_5){
return securityEnabled;
}
}),new objj_method(sel_getUid("setSecurityEnabled:"),function(_7,_8,_9){
with(_7){
securityEnabled=_9;
}
}),new objj_method(sel_getUid("username"),function(_a,_b){
with(_a){
return username;
}
}),new objj_method(sel_getUid("setUsername:"),function(_c,_d,_e){
with(_c){
username=_e;
}
}),new objj_method(sel_getUid("password"),function(_f,_10){
with(_f){
return password;
}
}),new objj_method(sel_getUid("setPassword:"),function(_11,_12,_13){
with(_11){
password=_13;
}
}),new objj_method(sel_getUid("token"),function(_14,_15){
with(_14){
return token;
}
}),new objj_method(sel_getUid("setToken:"),function(_16,_17,_18){
with(_16){
token=_18;
}
}),new objj_method(sel_getUid("shouldPersistCredentials"),function(_19,_1a){
with(_19){
return shouldPersistCredentials;
}
}),new objj_method(sel_getUid("setShouldPersistCredentials:"),function(_1b,_1c,_1d){
with(_1b){
shouldPersistCredentials=_1d;
}
}),new objj_method(sel_getUid("init"),function(_1e,_1f){
with(_1e){
if(_1e=objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("PMSSecurity").super_class},"init")){
userDefaults=objj_msgSend(CPUserDefaults,"standardUserDefaults");
username=objj_msgSend(userDefaults,"stringForKey:",PMSSecurityUserKey);
password=objj_msgSend(userDefaults,"stringForKey:",PMSSecurityPassKey);
token=objj_msgSend(userDefaults,"stringForKey:",PMSSecurityTokenKey);
shouldPersistCredentials=!!(token||(username&&password));
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",1,_1e,sel_getUid("beginRefresh"),nil,NO);
}
return _1e;
}
}),new objj_method(sel_getUid("beginRefresh"),function(_20,_21){
with(_20){
objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(PMSURL,"URLWithPath:","/security")),_20);
}
}),new objj_method(sel_getUid("connection:didReceiveResponse:"),function(_22,_23,_24,_25){
with(_22){
if(objj_msgSend(_25,"statusCode")!=200){
objj_msgSend(_24,"cancel");
}
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",60,_22,sel_getUid("beginRefresh"),nil,NO);
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_26,_27,_28,_29){
with(_26){
var _2a=objj_msgSend(_28,"responseXML");
if(!_2a){
return;
}
var _2b=_2a.documentElement;
objj_msgSend(_26,"setSecurityEnabled:",(_2b.getAttribute("security")=="1"));
}
}),new objj_method(sel_getUid("setShouldPersistCredentials:"),function(_2c,_2d,_2e){
with(_2c){
_2e=!!_2e;
if(shouldPersistCredentials===_2e){
return;
}
shouldPersistCredentials=_2e;
if(shouldPersistCredentials){
objj_msgSend(userDefaults,"setObject:forKey:",username,PMSSecurityUserKey);
objj_msgSend(userDefaults,"setObject:forKey:",password,PMSSecurityPassKey);
objj_msgSend(userDefaults,"setObject:forKey:",token,PMSSecurityTokenKey);
}else{
objj_msgSend(userDefaults,"removeObjectForKey:",PMSSecurityUserKey);
objj_msgSend(userDefaults,"removeObjectForKey:",PMSSecurityPassKey);
objj_msgSend(userDefaults,"removeObjectForKey:",PMSSecurityTokenKey);
}
}
}),new objj_method(sel_getUid("setUsername:"),function(_2f,_30,_31){
with(_2f){
username=_31;
if(shouldPersistCredentials){
objj_msgSend(userDefaults,"setObject:forKey:",username,PMSSecurityUserKey);
}
}
}),new objj_method(sel_getUid("setPassword:"),function(_32,_33,_34){
with(_32){
password=_34;
if(shouldPersistCredentials){
objj_msgSend(userDefaults,"setObject:forKey:",password,PMSSecurityPassKey);
}
}
}),new objj_method(sel_getUid("hashedPassword"),function(_35,_36){
with(_35){
return username&&password&&Crypto.SHA1(username.toLowerCase()+Crypto.SHA1(password));
}
}),new objj_method(sel_getUid("setToken:"),function(_37,_38,_39){
with(_37){
token=_39;
if(shouldPersistCredentials){
objj_msgSend(userDefaults,"setObject:forKey:",token,PMSSecurityTokenKey);
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedSecurity"),function(_3a,_3b){
with(_3a){
if(!_1){
_1=objj_msgSend(objj_msgSend(_3a,"alloc"),"init");
}
return _1;
}
})]);
p;23;Models/LanguageConfig.jt;3206;@STATIC;1.0;I;21;Foundation/CPObject.jt;3161;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=nil,_2=nil,_3=NO;
var _4=objj_allocateClassPair(CPObject,"LanguageConfig"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("languageCode")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("languageCode"),function(_6,_7){
with(_6){
return languageCode;
}
}),new objj_method(sel_getUid("setLanguageCode:"),function(_8,_9,_a){
with(_8){
languageCode=_a;
}
}),new objj_method(sel_getUid("initWithCode:"),function(_b,_c,_d){
with(_b){
if(_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("LanguageConfig").super_class},"init")){
languageCode=_d;
}
return _b;
}
}),new objj_method(sel_getUid("compare:"),function(_e,_f,_10){
with(_e){
return objj_msgSend(objj_msgSend(_e,"name"),"caseInsensitiveCompare:",objj_msgSend(_10,"name"));
}
}),new objj_method(sel_getUid("isEqual:"),function(_11,_12,_13){
with(_11){
return objj_msgSend(_13,"isKindOfClass:",objj_msgSend(_11,"class"))&&objj_msgSend(objj_msgSend(_13,"languageCode"),"isEqualToString:",objj_msgSend(_11,"languageCode"));
}
}),new objj_method(sel_getUid("name"),function(_14,_15){
with(_14){
return objj_msgSend(_1,"objectForKey:",languageCode)||languageCode;
}
}),new objj_method(sel_getUid("description"),function(_16,_17){
with(_16){
return objj_msgSend(CPString,"stringWithFormat:","%@ (%@)",objj_msgSend(_16,"name"),objj_msgSend(_16,"languageCode"));
}
}),new objj_method(sel_getUid("asURLParam"),function(_18,_19){
with(_18){
return languageCode;
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("initialize"),function(_1a,_1b){
with(_1a){
if(_1==nil&&_3==NO){
_3=YES;
onsuccess=function(_1c){
_1=_1c.request.responsePropertyList();
_3=NO;
};
onfailure=function(){
CPLog.error("[LanguageConfig -initWithCode:] failed to load LanguageNames.plist");
_3=NO;
};
var _1d=new CFHTTPRequest(),url=objj_msgSend(CPURL,"URLWithString:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","LanguageNames.plist"));
_1d.overrideMimeType("text/xml");
_1d.onsuccess=onsuccess;
_1d.onfailure=onfailure;
_1d.open("GET",objj_msgSend(url,"absoluteString"),true);
_1d.send("");
}
}
}),new objj_method(sel_getUid("allLanguages"),function(_1e,_1f){
with(_1e){
if(_2){
return _2;
}
if(_3){
return nil;
}
_2=objj_msgSend(CPMutableSet,"set");
var _20=objj_msgSend(_1,"keyEnumerator"),_21=nil;
while(_21=objj_msgSend(_20,"nextObject")){
objj_msgSend(_2,"addObject:",objj_msgSend(objj_msgSend(_1e,"alloc"),"initWithCode:",_21));
}
return _2;
}
}),new objj_method(sel_getUid("noLanguage"),function(_22,_23){
with(_22){
return objj_msgSend(objj_msgSend(_22,"alloc"),"initWithCode:","xn");
}
})]);
var _24="LanguageConfigCodeKey";
var _4=objj_getClass("LanguageConfig");
if(!_4){
throw new SyntaxError("*** Could not find definition for class \"LanguageConfig\"");
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_25,_26,_27){
with(_25){
return objj_msgSend(_25,"initWithCode:",objj_msgSend(_27,"decodeObjectForKey:",_24));
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_2a,"encodeObject:forKey:",languageCode,_24);
}
})]);
p;16;Models/MMAgent.jt;5561;@STATIC;1.0;I;21;Foundation/CPObject.jt;5516;
objj_executeFile("Foundation/CPObject.j",NO);
MMPersonalMediaAgent=nil;
var _1=objj_allocateClassPair(CPObject,"MMAgent"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("identifier"),new objj_ivar("languages"),new objj_ivar("mediaType"),new objj_ivar("primary"),new objj_ivar("enabled"),new objj_ivar("contributingAgents"),new objj_ivar("configuredAgents")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_5,_6,_7){
with(_5){
name=_7;
}
}),new objj_method(sel_getUid("identifier"),function(_8,_9){
with(_8){
return identifier;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_a,_b,_c){
with(_a){
identifier=_c;
}
}),new objj_method(sel_getUid("languages"),function(_d,_e){
with(_d){
return languages;
}
}),new objj_method(sel_getUid("setLanguages:"),function(_f,_10,_11){
with(_f){
languages=_11;
}
}),new objj_method(sel_getUid("mediaType"),function(_12,_13){
with(_12){
return mediaType;
}
}),new objj_method(sel_getUid("setMediaType:"),function(_14,_15,_16){
with(_14){
mediaType=_16;
}
}),new objj_method(sel_getUid("isPrimary"),function(_17,_18){
with(_17){
return primary;
}
}),new objj_method(sel_getUid("setPrimary:"),function(_19,_1a,_1b){
with(_19){
primary=_1b;
}
}),new objj_method(sel_getUid("isEnabled"),function(_1c,_1d){
with(_1c){
return enabled;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_1e,_1f,_20){
with(_1e){
enabled=_20;
}
}),new objj_method(sel_getUid("contributingAgents"),function(_21,_22){
with(_21){
return contributingAgents;
}
}),new objj_method(sel_getUid("setContributingAgents:"),function(_23,_24,_25){
with(_23){
contributingAgents=_25;
}
}),new objj_method(sel_getUid("configuredAgents"),function(_26,_27){
with(_26){
return configuredAgents;
}
}),new objj_method(sel_getUid("setConfiguredAgents:"),function(_28,_29,_2a){
with(_28){
configuredAgents=_2a;
}
}),new objj_method(sel_getUid("initWithIdentifier:"),function(_2b,_2c,_2d){
with(_2b){
if(_2b=objj_msgSend(_2b,"init")){
objj_msgSend(_2b,"setIdentifier:",_2d);
}
return _2b;
}
}),new objj_method(sel_getUid("isEqual:"),function(_2e,_2f,_30){
with(_2e){
return objj_msgSend(_30,"isKindOfClass:",objj_msgSend(_2e,"class"))&&objj_msgSend(objj_msgSend(_30,"identifier"),"isEqualToString:",objj_msgSend(_2e,"identifier"));
}
}),new objj_method(sel_getUid("description"),function(_31,_32){
with(_31){
return objj_msgSend(CPString,"stringWithFormat:","%@ (%@)",name,identifier);
}
}),new objj_method(sel_getUid("asURLParam"),function(_33,_34){
with(_33){
return identifier;
}
}),new objj_method(sel_getUid("compare:"),function(_35,_36,_37){
with(_35){
return objj_msgSend(name,"caseInsensitiveCompare:",objj_msgSend(_37,"name"));
}
}),new objj_method(sel_getUid("contributorList"),function(_38,_39){
with(_38){
var _3a=objj_msgSend(CPMutableArray,"array");
objj_msgSend(configuredAgents,"enumerateObjectsUsingBlock:",function(_3b){
if(objj_msgSend(contributingAgents,"containsObject:",_3b)||objj_msgSend(_3b,"isEqual:",_38)){
objj_msgSend(_3a,"addObject:",_3b);
}
});
return _3a;
}
}),new objj_method(sel_getUid("copy"),function(_3c,_3d){
with(_3c){
var _3e=objj_msgSend(objj_msgSend(objj_msgSend(_3c,"class"),"alloc"),"initWithIdentifier:",identifier);
objj_msgSend(_3e,"setName:",name);
objj_msgSend(_3e,"setLanguages:",objj_msgSend(languages,"copy"));
objj_msgSend(_3e,"setMediaType:",mediaType);
objj_msgSend(_3e,"setPrimary:",primary);
return _3e;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_3f,_40){
with(_3f){
if(!MMPersonalMediaAgent){
MMPersonalMediaAgent=objj_msgSend(objj_msgSend(_3f,"alloc"),"initWithIdentifier:","com.plexapp.agents.none");
}
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingContributorList"),function(_41,_42){
with(_41){
return objj_msgSend(CPSet,"setWithObjects:","contributingAgents","configuredAgents");
}
})]);
var _43="MMAgentNameKey",_44="MMAgentIdentifierKey",_45="MMAgentLanguagesKey",_46="MMAgentMediaTypeKey",_47="MMAgentPrimaryKey",_48="MMAgentEnabledKey",_49="MMAgentContributingAgentsKey",_4a="MMAgentConfiguredAgentsKey";
var _1=objj_getClass("MMAgent");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"MMAgent\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_4b,_4c,_4d){
with(_4b){
if(_4b=objj_msgSendSuper({receiver:_4b,super_class:objj_getClass("MMAgent").super_class},"init")){
name=objj_msgSend(_4d,"decodeObjectForKey:",_43);
identifier=objj_msgSend(_4d,"decodeObjectForKey:",_44);
languages=objj_msgSend(_4d,"decodeObjectForKey:",_45);
mediaType=objj_msgSend(_4d,"decodeObjectForKey:",_46);
primary=objj_msgSend(_4d,"decodeBoolForKey:",_47);
enabled=objj_msgSend(_4d,"decodeBoolForKey:",_48);
contributingAgents=objj_msgSend(_4d,"decodeObjectForKey:",_49);
configuredAgents=objj_msgSend(_4d,"decodeObjectForKey:",_4a);
}
return _4b;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_4e,_4f,_50){
with(_4e){
objj_msgSend(_50,"encodeObject:forKey:",name,_43);
objj_msgSend(_50,"encodeObject:forKey:",identifier,_44);
objj_msgSend(_50,"encodeObject:forKey:",languages,_45);
objj_msgSend(_50,"encodeObject:forKey:",mediaType,_46);
objj_msgSend(_50,"encodeBool:forKey:",primary,_47);
objj_msgSend(_50,"encodeBool:forKey:",enabled,_48);
objj_msgSend(_50,"encodeObject:forKey:",contributingAgents,_49);
objj_msgSend(_50,"encodeObject:forKey:",configuredAgents,_4a);
}
})]);
p;25;Models/MMLibrarySection.jt;10252;@STATIC;1.0;i;20;PMCDirectoryObject.ji;8;PMSURL.ji;9;MMAgent.ji;11;MMScanner.ji;13;SectionType.jt;10148;
objj_executeFile("PMCDirectoryObject.j",YES);
objj_executeFile("PMSURL.j",YES);
objj_executeFile("MMAgent.j",YES);
objj_executeFile("MMScanner.j",YES);
MMLibrarySectionTypeMovie="movie";
MMLibrarySectionTypeShow="show";
MMLibrarySectionTypeSeason="season";
MMLibrarySectionTypeEpisode="episode";
MMLibrarySectionTypeTrailer="trailer";
MMLibrarySectionTypeComic="comic";
MMLibrarySectionTypePerson="person";
MMLibrarySectionTypeArtist="artist";
MMLibrarySectionTypeAlbum="album";
MMLibrarySectionTypeTrack="track";
MMLibrarySectionTypePhoto="photo";
MMLibrarySectionTypeClip="clip";
objj_executeFile("SectionType.j",YES);
MMLibrarySectionDefaultMoviesAgent="com.plexapp.agents.imdb";
MMLibrarySectionDefaultTVAgent="com.plexapp.agents.thetvdb";
MMLibrarySectionDefaultArtistAgent="com.plexapp.agents.lastfm";
MMLibrarySectionDefaultPhotoAgent="com.plexapp.agents.none";
MediaTypeCodeMap=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:","1",MMLibrarySectionTypeMovie,"2",MMLibrarySectionTypeShow,"3",MMLibrarySectionTypeSeason,"4",MMLibrarySectionTypeEpisode,"5",MMLibrarySectionTypeTrailer,"6",MMLibrarySectionTypeComic,"7",MMLibrarySectionTypePerson,"8",MMLibrarySectionTypeArtist,"9",MMLibrarySectionTypeAlbum,"10",MMLibrarySectionTypeTrack,"12",MMLibrarySectionTypeClip,"13",MMLibrarySectionTypePhoto);
var _1=objj_allocateClassPair(PMCDirectoryObject,"MMLibrarySection"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_title"),new objj_ivar("_type"),new objj_ivar("_agent"),new objj_ivar("_scanner"),new objj_ivar("_language"),new objj_ivar("_locations"),new objj_ivar("updatedAt"),new objj_ivar("collections"),new objj_ivar("mediaFlagPrefix"),new objj_ivar("mediaFlagVersion"),new objj_ivar("updateQueueSize"),new objj_ivar("trashedItems"),new objj_ivar("_refreshing")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("title"),function(_3,_4){
with(_3){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_5,_6,_7){
with(_5){
_title=_7;
}
}),new objj_method(sel_getUid("type"),function(_8,_9){
with(_8){
return _type;
}
}),new objj_method(sel_getUid("setType:"),function(_a,_b,_c){
with(_a){
_type=_c;
}
}),new objj_method(sel_getUid("agent"),function(_d,_e){
with(_d){
return _agent;
}
}),new objj_method(sel_getUid("setAgent:"),function(_f,_10,_11){
with(_f){
_agent=_11;
}
}),new objj_method(sel_getUid("scanner"),function(_12,_13){
with(_12){
return _scanner;
}
}),new objj_method(sel_getUid("setScanner:"),function(_14,_15,_16){
with(_14){
_scanner=_16;
}
}),new objj_method(sel_getUid("language"),function(_17,_18){
with(_17){
return _language;
}
}),new objj_method(sel_getUid("setLanguage:"),function(_19,_1a,_1b){
with(_19){
_language=_1b;
}
}),new objj_method(sel_getUid("locations"),function(_1c,_1d){
with(_1c){
return _locations;
}
}),new objj_method(sel_getUid("setLocations:"),function(_1e,_1f,_20){
with(_1e){
_locations=_20;
}
}),new objj_method(sel_getUid("updatedAt"),function(_21,_22){
with(_21){
return updatedAt;
}
}),new objj_method(sel_getUid("setUpdatedAt:"),function(_23,_24,_25){
with(_23){
updatedAt=_25;
}
}),new objj_method(sel_getUid("collections"),function(_26,_27){
with(_26){
return collections;
}
}),new objj_method(sel_getUid("setCollections:"),function(_28,_29,_2a){
with(_28){
collections=_2a;
}
}),new objj_method(sel_getUid("mediaFlagPrefix"),function(_2b,_2c){
with(_2b){
return mediaFlagPrefix;
}
}),new objj_method(sel_getUid("setMediaFlagPrefix:"),function(_2d,_2e,_2f){
with(_2d){
mediaFlagPrefix=_2f;
}
}),new objj_method(sel_getUid("mediaFlagVersion"),function(_30,_31){
with(_30){
return mediaFlagVersion;
}
}),new objj_method(sel_getUid("setMediaFlagVersion:"),function(_32,_33,_34){
with(_32){
mediaFlagVersion=_34;
}
}),new objj_method(sel_getUid("updateQueueSize"),function(_35,_36){
with(_35){
return updateQueueSize;
}
}),new objj_method(sel_getUid("setUpdateQueueSize:"),function(_37,_38,_39){
with(_37){
updateQueueSize=_39;
}
}),new objj_method(sel_getUid("trashedItems"),function(_3a,_3b){
with(_3a){
return trashedItems;
}
}),new objj_method(sel_getUid("isRefreshing"),function(_3c,_3d){
with(_3c){
return _refreshing;
}
}),new objj_method(sel_getUid("setRefreshing:"),function(_3e,_3f,_40){
with(_3e){
_refreshing=_40;
}
}),new objj_method(sel_getUid("init"),function(_41,_42){
with(_41){
if(_41=objj_msgSendSuper({receiver:_41,super_class:objj_getClass("MMLibrarySection").super_class},"init")){
trashedItems=objj_msgSend(CPMutableSet,"set");
}
return _41;
}
}),new objj_method(sel_getUid("key"),function(_43,_44){
with(_43){
return objj_msgSend(_43,"id");
}
}),new objj_method(sel_getUid("setKey:"),function(_45,_46,_47){
with(_45){
objj_msgSend(_45,"setId:",objj_msgSend(objj_msgSend(_45,"class"),"idFromKey:",_47));
}
}),new objj_method(sel_getUid("setType:"),function(_48,_49,_4a){
with(_48){
if(objj_msgSend(_4a,"isKindOfClass:",objj_msgSend(CPString,"class"))){
_4a=objj_msgSend(SectionType,"sectionTypeForKey:",_4a);
}
_type=_4a;
}
}),new objj_method(sel_getUid("path"),function(_4b,_4c){
with(_4b){
if(path){
return path;
}
if(objj_msgSend(objj_msgSend(_4b,"id"),"hasPrefix:","/library/sections/")){
return objj_msgSend(_4b,"id");
}
return objj_msgSend(CPString,"stringWithFormat:","/library/sections/%@",objj_msgSend(_4b,"id"));
}
}),new objj_method(sel_getUid("setAgent:"),function(_4d,_4e,_4f){
with(_4d){
if(objj_msgSend(_4f,"isKindOfClass:",CPString)){
_agent=objj_msgSend(objj_msgSend(MMAgent,"alloc"),"initWithIdentifier:",_4f);
}else{
if(objj_msgSend(_4f,"isKindOfClass:",MMAgent)){
_agent=_4f;
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(CPString,"stringWithFormat:","agent must be of type %@",CPStringFromClass(objj_msgSend(MMAgent,"class"))));
}
}
}
}),new objj_method(sel_getUid("setScanner:"),function(_50,_51,_52){
with(_50){
if(objj_msgSend(_52,"isKindOfClass:",CPString)){
_scanner=objj_msgSend(objj_msgSend(MMScanner,"alloc"),"initWithName:",_52);
}else{
if(objj_msgSend(_52,"isKindOfClass:",MMScanner)){
_scanner=_52;
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(CPString,"stringWithFormat:","scanner must be of type %@",CPStringFromClass(objj_msgSend(MMScanner,"class"))));
}
}
}
}),new objj_method(sel_getUid("setLanguage:"),function(_53,_54,_55){
with(_53){
if(objj_msgSend(_55,"isKindOfClass:",CPString)){
_language=objj_msgSend(objj_msgSend(LanguageConfig,"alloc"),"initWithCode:",_55);
}else{
if(objj_msgSend(_55,"isKindOfClass:",LanguageConfig)){
_language=_55;
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(CPString,"stringWithFormat:","language must be of type %@",LanguageConfig));
}
}
}
}),new objj_method(sel_getUid("setUpdatedAt:"),function(_56,_57,_58){
with(_56){
updatedAt=objj_msgSend(_56,"parseDate:",_58);
}
}),new objj_method(sel_getUid("setUpdateQueueSize:"),function(_59,_5a,_5b){
with(_59){
if(objj_msgSend(_5b,"isKindOfClass:",CPString)){
_5b=Number(_5b);
}
updateQueueSize=_5b;
}
}),new objj_method(sel_getUid("setRefreshing:"),function(_5c,_5d,_5e){
with(_5c){
if(typeof _5e=="string"){
_5e=(_5e=="1");
}
_refreshing=!!_5e;
}
}),new objj_method(sel_getUid("addTrashedItem:"),function(_5f,_60,_61){
with(_5f){
objj_msgSend(_5f,"willChangeValueForKey:","trashedItems");
objj_msgSend(trashedItems,"addObject:",_61);
objj_msgSend(_5f,"didChangeValueForKey:","trashedItems");
}
}),new objj_method(sel_getUid("removeTrashedItem:"),function(_62,_63,_64){
with(_62){
objj_msgSend(_62,"willChangeValueForKey:","trashedItems");
objj_msgSend(trashedItems,"removeObject:",_64);
objj_msgSend(_62,"didChangeValueForKey:","trashedItems");
}
}),new objj_method(sel_getUid("emptyTrash"),function(_65,_66){
with(_65){
var _67=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_65,"URLWithSuffix:","/emptyTrash"));
objj_msgSend(_67,"setHTTPMethod:","PUT");
objj_msgSend(MMURLConnection,"connectionWithRequest:delegate:",_67,_65);
}
}),new objj_method(sel_getUid("librarySection"),function(_68,_69){
with(_68){
return _68;
}
}),new objj_method(sel_getUid("allMediaItemsURL"),function(_6a,_6b){
with(_6a){
if(objj_msgSend(objj_msgSend(_6a,"id"),"hasPrefix:","queues/")){
return objj_msgSend(_6a,"URL");
}
return objj_msgSend(_6a,"URLWithSuffix:","/all");
}
}),new objj_method(sel_getUid("URL"),function(_6c,_6d){
with(_6c){
return objj_msgSend(_6c,"URLWithSuffix:","");
}
}),new objj_method(sel_getUid("URLWithSuffix:"),function(_6e,_6f,_70){
with(_6e){
return objj_msgSend(PMSURL,"URLWithPath:",objj_msgSend(CPString,"stringWithFormat:","/library/sections/%@%@",objj_msgSend(_6e,"key"),_70));
}
}),new objj_method(sel_getUid("isEqual:"),function(_71,_72,_73){
with(_71){
return objj_msgSend(_73,"isKindOfClass:",objj_msgSend(_71,"class"))&&objj_msgSend(objj_msgSend(_71,"key"),"isEqualToString:",objj_msgSend(_73,"key"));
}
}),new objj_method(sel_getUid("description"),function(_74,_75){
with(_74){
return objj_msgSend(CPString,"stringWithFormat:","{%@ title=%@, key=%@, type=%@}",objj_msgSend(_74,"class"),objj_msgSend(_74,"title"),objj_msgSend(_74,"key"),objj_msgSend(_74,"type"));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("keyPathsForValuesAffectingKey"),function(_76,_77){
with(_76){
return objj_msgSend(CPSet,"setWithObject:","id");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingId"),function(_78,_79){
with(_78){
return objj_msgSend(CPSet,"setWithObject:","key");
}
}),new objj_method(sel_getUid("keyFromURL:"),function(_7a,_7b,URL){
with(_7a){
if(!URL){
return nil;
}
var _7c=objj_msgSend(URL,"absoluteString").match(/\/library\/sections\/([^\/\?]+)/i);
if(!_7c){
return nil;
}
return _7c[0];
}
}),new objj_method(sel_getUid("recordForPath:"),function(_7d,_7e,_7f){
with(_7d){
var key=objj_msgSend(_7d,"keyFromURL:",objj_msgSend(PMSURL,"URLWithPath:",_7f));
if(!key){
return nil;
}
return objj_msgSend(objj_msgSend(MMDataStore,"defaultDataStore"),"recordWithClass:id:",objj_msgSend(_7d,"class"),key);
}
}),new objj_method(sel_getUid("isLibrarySectionPath:"),function(_80,_81,_82){
with(_80){
return objj_msgSend(objj_msgSend(objj_msgSend(objj_msgSend(_80,"recordForPath:",_82),"URL"),"path"),"isEqualToString:",_82);
}
})]);
p;27;Models/PMCDirectoryObject.jt;1920;@STATIC;1.0;i;15;PMCBaseObject.ji;14;PMCContainer.jt;1862;
objj_executeFile("PMCBaseObject.j",YES);
objj_executeFile("PMCContainer.j",YES);
var _1=objj_allocateClassPair(PMCBaseObject,"PMCDirectoryObject"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("leafCount"),new objj_ivar("viewedLeafCount"),new objj_ivar("refreshing")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("leafCount"),function(_3,_4){
with(_3){
return leafCount;
}
}),new objj_method(sel_getUid("setLeafCount:"),function(_5,_6,_7){
with(_5){
leafCount=_7;
}
}),new objj_method(sel_getUid("viewedLeafCount"),function(_8,_9){
with(_8){
return viewedLeafCount;
}
}),new objj_method(sel_getUid("setViewedLeafCount:"),function(_a,_b,_c){
with(_a){
viewedLeafCount=_c;
}
}),new objj_method(sel_getUid("isRefreshing"),function(_d,_e){
with(_d){
return refreshing;
}
}),new objj_method(sel_getUid("targetContainer"),function(_f,_10){
with(_f){
var _11=objj_msgSend(objj_msgSend(MMDataStore,"defaultDataStore"),"recordWithClass:id:",objj_msgSend(PMCContainer,"class"),objj_msgSend(_f,"path"));
objj_msgSend(_11,"setParent:",objj_msgSend(_f,"container"));
return _11;
}
}),new objj_method(sel_getUid("children"),function(_12,_13){
with(_12){
return objj_msgSend(objj_msgSend(_12,"targetContainer"),"children");
}
}),new objj_method(sel_getUid("setChildren:"),function(_14,_15,_16){
with(_14){
objj_msgSend(objj_msgSend(_14,"targetContainer"),"setChildren:",_16);
}
}),new objj_method(sel_getUid("mainMediaItem"),function(_17,_18){
with(_17){
var _19=objj_msgSend(_17,"children");
for(var i=0,_1a=objj_msgSend(_19,"count");i<_1a;i++){
var _1b=objj_msgSend(_19,"objectAtIndex:",i);
if(objj_msgSend(_1b,"respondsToSelector:",sel_getUid("mainMediaItem"))){
var _1c=objj_msgSend(_1b,"mainMediaItem");
if(_1c){
return _1c;
}
}
}
return nil;
}
}),new objj_method(sel_getUid("isRefreshing"),function(_1d,_1e){
with(_1d){
return NO;
}
})]);
p;21;Models/PMCContainer.jt;7933;@STATIC;1.0;i;11;PMCObject.jt;7898;
objj_executeFile("PMCObject.j",YES);
var _1=objj_allocateClassPair(PMCObject,"PMCContainer"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("path"),new objj_ivar("source"),new objj_ivar("identifier"),new objj_ivar("userAgent"),new objj_ivar("httpCookies"),new objj_ivar("header"),new objj_ivar("message"),new objj_ivar("mediaFlagPrefix"),new objj_ivar("mediaFlagVersion"),new objj_ivar("viewMode"),new objj_ivar("type"),new objj_ivar("code"),new objj_ivar("key"),new objj_ivar("summary"),new objj_ivar("thumb"),new objj_ivar("art"),new objj_ivar("studio"),new objj_ivar("contentRating"),new objj_ivar("duration"),new objj_ivar("year"),new objj_ivar("index"),new objj_ivar("noCache"),new objj_ivar("noHistory"),new objj_ivar("replaceParent"),new objj_ivar("mixedParents"),new objj_ivar("titles"),new objj_ivar("children"),new objj_ivar("thumbImage"),new objj_ivar("loaded"),new objj_ivar("loadCancelled"),new objj_ivar("unreachable"),new objj_ivar("loader"),new objj_ivar("thumbsChecked"),new objj_ivar("hasThumbs")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("path"),function(_3,_4){
with(_3){
return path;
}
}),new objj_method(sel_getUid("setPath:"),function(_5,_6,_7){
with(_5){
path=_7;
}
}),new objj_method(sel_getUid("source"),function(_8,_9){
with(_8){
return source;
}
}),new objj_method(sel_getUid("setSource:"),function(_a,_b,_c){
with(_a){
source=_c;
}
}),new objj_method(sel_getUid("identifier"),function(_d,_e){
with(_d){
return identifier;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_f,_10,_11){
with(_f){
identifier=_11;
}
}),new objj_method(sel_getUid("userAgent"),function(_12,_13){
with(_12){
return userAgent;
}
}),new objj_method(sel_getUid("setUserAgent:"),function(_14,_15,_16){
with(_14){
userAgent=_16;
}
}),new objj_method(sel_getUid("httpCookies"),function(_17,_18){
with(_17){
return httpCookies;
}
}),new objj_method(sel_getUid("setHttpCookies:"),function(_19,_1a,_1b){
with(_19){
httpCookies=_1b;
}
}),new objj_method(sel_getUid("header"),function(_1c,_1d){
with(_1c){
return header;
}
}),new objj_method(sel_getUid("setHeader:"),function(_1e,_1f,_20){
with(_1e){
header=_20;
}
}),new objj_method(sel_getUid("message"),function(_21,_22){
with(_21){
return message;
}
}),new objj_method(sel_getUid("setMessage:"),function(_23,_24,_25){
with(_23){
message=_25;
}
}),new objj_method(sel_getUid("mediaFlagPrefix"),function(_26,_27){
with(_26){
return mediaFlagPrefix;
}
}),new objj_method(sel_getUid("setMediaFlagPrefix:"),function(_28,_29,_2a){
with(_28){
mediaFlagPrefix=_2a;
}
}),new objj_method(sel_getUid("mediaFlagVersion"),function(_2b,_2c){
with(_2b){
return mediaFlagVersion;
}
}),new objj_method(sel_getUid("setMediaFlagVersion:"),function(_2d,_2e,_2f){
with(_2d){
mediaFlagVersion=_2f;
}
}),new objj_method(sel_getUid("viewMode"),function(_30,_31){
with(_30){
return viewMode;
}
}),new objj_method(sel_getUid("setViewMode:"),function(_32,_33,_34){
with(_32){
viewMode=_34;
}
}),new objj_method(sel_getUid("type"),function(_35,_36){
with(_35){
return type;
}
}),new objj_method(sel_getUid("setType:"),function(_37,_38,_39){
with(_37){
type=_39;
}
}),new objj_method(sel_getUid("code"),function(_3a,_3b){
with(_3a){
return code;
}
}),new objj_method(sel_getUid("setCode:"),function(_3c,_3d,_3e){
with(_3c){
code=_3e;
}
}),new objj_method(sel_getUid("key"),function(_3f,_40){
with(_3f){
return key;
}
}),new objj_method(sel_getUid("setKey:"),function(_41,_42,_43){
with(_41){
key=_43;
}
}),new objj_method(sel_getUid("summary"),function(_44,_45){
with(_44){
return summary;
}
}),new objj_method(sel_getUid("setSummary:"),function(_46,_47,_48){
with(_46){
summary=_48;
}
}),new objj_method(sel_getUid("thumb"),function(_49,_4a){
with(_49){
return thumb;
}
}),new objj_method(sel_getUid("setThumb:"),function(_4b,_4c,_4d){
with(_4b){
thumb=_4d;
}
}),new objj_method(sel_getUid("art"),function(_4e,_4f){
with(_4e){
return art;
}
}),new objj_method(sel_getUid("setArt:"),function(_50,_51,_52){
with(_50){
art=_52;
}
}),new objj_method(sel_getUid("studio"),function(_53,_54){
with(_53){
return studio;
}
}),new objj_method(sel_getUid("setStudio:"),function(_55,_56,_57){
with(_55){
studio=_57;
}
}),new objj_method(sel_getUid("contentRating"),function(_58,_59){
with(_58){
return contentRating;
}
}),new objj_method(sel_getUid("setContentRating:"),function(_5a,_5b,_5c){
with(_5a){
contentRating=_5c;
}
}),new objj_method(sel_getUid("duration"),function(_5d,_5e){
with(_5d){
return duration;
}
}),new objj_method(sel_getUid("setDuration:"),function(_5f,_60,_61){
with(_5f){
duration=_61;
}
}),new objj_method(sel_getUid("year"),function(_62,_63){
with(_62){
return year;
}
}),new objj_method(sel_getUid("setYear:"),function(_64,_65,_66){
with(_64){
year=_66;
}
}),new objj_method(sel_getUid("index"),function(_67,_68){
with(_67){
return index;
}
}),new objj_method(sel_getUid("setIndex:"),function(_69,_6a,_6b){
with(_69){
index=_6b;
}
}),new objj_method(sel_getUid("noCache"),function(_6c,_6d){
with(_6c){
return noCache;
}
}),new objj_method(sel_getUid("setNoCache:"),function(_6e,_6f,_70){
with(_6e){
noCache=_70;
}
}),new objj_method(sel_getUid("noHistory"),function(_71,_72){
with(_71){
return noHistory;
}
}),new objj_method(sel_getUid("setNoHistory:"),function(_73,_74,_75){
with(_73){
noHistory=_75;
}
}),new objj_method(sel_getUid("replaceParent"),function(_76,_77){
with(_76){
return replaceParent;
}
}),new objj_method(sel_getUid("setReplaceParent:"),function(_78,_79,_7a){
with(_78){
replaceParent=_7a;
}
}),new objj_method(sel_getUid("mixedParents"),function(_7b,_7c){
with(_7b){
return mixedParents;
}
}),new objj_method(sel_getUid("setMixedParents:"),function(_7d,_7e,_7f){
with(_7d){
mixedParents=_7f;
}
}),new objj_method(sel_getUid("titles"),function(_80,_81){
with(_80){
return titles;
}
}),new objj_method(sel_getUid("setTitles:"),function(_82,_83,_84){
with(_82){
titles=_84;
}
}),new objj_method(sel_getUid("children"),function(_85,_86){
with(_85){
return children;
}
}),new objj_method(sel_getUid("setChildren:"),function(_87,_88,_89){
with(_87){
children=_89;
}
}),new objj_method(sel_getUid("thumbImage"),function(_8a,_8b){
with(_8a){
return thumbImage;
}
}),new objj_method(sel_getUid("setThumbImage:"),function(_8c,_8d,_8e){
with(_8c){
thumbImage=_8e;
}
}),new objj_method(sel_getUid("loaded"),function(_8f,_90){
with(_8f){
return loaded;
}
}),new objj_method(sel_getUid("setLoaded:"),function(_91,_92,_93){
with(_91){
loaded=_93;
}
}),new objj_method(sel_getUid("loadCancelled"),function(_94,_95){
with(_94){
return loadCancelled;
}
}),new objj_method(sel_getUid("setLoadCancelled:"),function(_96,_97,_98){
with(_96){
loadCancelled=_98;
}
}),new objj_method(sel_getUid("unreachable"),function(_99,_9a){
with(_99){
return unreachable;
}
}),new objj_method(sel_getUid("setUnreachable:"),function(_9b,_9c,_9d){
with(_9b){
unreachable=_9d;
}
}),new objj_method(sel_getUid("loader"),function(_9e,_9f){
with(_9e){
return loader;
}
}),new objj_method(sel_getUid("setLoader:"),function(_a0,_a1,_a2){
with(_a0){
loader=_a2;
}
}),new objj_method(sel_getUid("thumbsChecked"),function(_a3,_a4){
with(_a3){
return thumbsChecked;
}
}),new objj_method(sel_getUid("setThumbsChecked:"),function(_a5,_a6,_a7){
with(_a5){
thumbsChecked=_a7;
}
}),new objj_method(sel_getUid("hasThumbs"),function(_a8,_a9){
with(_a8){
return hasThumbs;
}
}),new objj_method(sel_getUid("setHasThumbs:"),function(_aa,_ab,_ac){
with(_aa){
hasThumbs=_ac;
}
}),new objj_method(sel_getUid("container"),function(_ad,_ae){
with(_ad){
return _ad;
}
})]);
var _1=objj_allocateClassPair(PMCContainer,"PMCRootContainer"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("serverVersion")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("serverVersion"),function(_af,_b0){
with(_af){
return serverVersion;
}
}),new objj_method(sel_getUid("setServerVersion:"),function(_b1,_b2,_b3){
with(_b1){
serverVersion=_b3;
}
})]);
p;25;DataSources/MMDataStore.jt;1449;@STATIC;1.0;I;21;Foundation/CPObject.jt;1404;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"MMDataStore"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_records")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("MMDataStore").super_class},"init")){
_records={};
}
return _4;
}
}),new objj_method(sel_getUid("recordWithClass:id:"),function(_6,_7,_8,_9){
with(_6){
var _a=objj_msgSend(_6,"recordKeyWithClass:id:",_8,_9),_b=_records[_a];
if(!_b){
_b=objj_msgSend(objj_msgSend(_8,"alloc"),"init");
objj_msgSend(_b,"setId:",_9);
objj_msgSend(_b,"setDataStore:",_6);
_records[_a]=_b;
}
return _b;
}
}),new objj_method(sel_getUid("hasRecordWithClass:id:"),function(_c,_d,_e,_f){
with(_c){
return !!_records[objj_msgSend(_c,"recordKeyWithClass:id:",_e,_f)];
}
}),new objj_method(sel_getUid("storeRecord:"),function(_10,_11,_12){
with(_10){
_records[objj_msgSend(_10,"recordKeyWithClass:id:",objj_msgSend(_12,"class"),objj_msgSend(_12,"id"))]=_12;
}
}),new objj_method(sel_getUid("recordKeyWithClass:id:"),function(_13,_14,_15,_16){
with(_13){
return [CPStringFromClass(_15),_16].join(":");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("defaultDataStore"),function(_17,_18){
with(_17){
if(!_1){
_1=objj_msgSend(objj_msgSend(_17,"alloc"),"init");
}
return _1;
}
})]);
p;18;Models/MMScanner.jt;1849;@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPCoder.jt;1779;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPCoder.j",NO);
var _1=objj_allocateClassPair(CPObject,"MMScanner"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_5,_6,_7){
with(_5){
name=_7;
}
}),new objj_method(sel_getUid("initWithName:"),function(_8,_9,_a){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("MMScanner").super_class},"init")){
name=_a;
}
return _8;
}
}),new objj_method(sel_getUid("isEqual:"),function(_b,_c,_d){
with(_b){
return objj_msgSend(_d,"isKindOfClass:",objj_msgSend(_b,"class"))&&objj_msgSend(name,"isEqualToString:",objj_msgSend(_d,"name"));
}
}),new objj_method(sel_getUid("asURLParam"),function(_e,_f){
with(_e){
return name;
}
}),new objj_method(sel_getUid("description"),function(_10,_11){
with(_10){
return objj_msgSend(CPString,"stringWithFormat:","<%@ \"%@\">",objj_msgSend(_10,"class"),name);
}
})]);
var _12="MMScannerNameKey";
var _1=objj_getClass("MMScanner");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"MMScanner\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_13,_14,_15){
with(_13){
if(_13=objj_msgSendSuper({receiver:_13,super_class:objj_getClass("MMScanner").super_class},"initWithCoder:",_15)){
name=objj_msgSend(_15,"decodeObjectForKey:",_12);
}
return _13;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_16,_17,_18){
with(_16){
objj_msgSendSuper({receiver:_16,super_class:objj_getClass("MMScanner").super_class},"encodeWithCoder:",_18);
objj_msgSend(_18,"encodeObject:forKey:",name,_12);
}
})]);
p;20;Models/SectionType.jt;4281;@STATIC;1.0;I;21;Foundation/CPObject.jt;4236;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=nil,_2=NO;
MediaTypeCodeMap=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:","1",MMLibrarySectionTypeMovie,"2",MMLibrarySectionTypeShow,"3",MMLibrarySectionTypeSeason,"4",MMLibrarySectionTypeEpisode,"5",MMLibrarySectionTypeTrailer,"6",MMLibrarySectionTypeComic,"7",MMLibrarySectionTypePerson,"8",MMLibrarySectionTypeArtist,"9",MMLibrarySectionTypeAlbum,"10",MMLibrarySectionTypeTrack,"12",MMLibrarySectionTypeClip,"13",MMLibrarySectionTypePhoto);
var _3=objj_allocateClassPair(CPObject,"SectionType"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("name"),new objj_ivar("id"),new objj_ivar("key"),new objj_ivar("defaultAgent"),new objj_ivar("defaultScanner"),new objj_ivar("defaultLanguage")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("name"),function(_5,_6){
with(_5){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_7,_8,_9){
with(_7){
name=_9;
}
}),new objj_method(sel_getUid("id"),function(_a,_b){
with(_a){
return id;
}
}),new objj_method(sel_getUid("setId:"),function(_c,_d,_e){
with(_c){
id=_e;
}
}),new objj_method(sel_getUid("key"),function(_f,_10){
with(_f){
return key;
}
}),new objj_method(sel_getUid("defaultAgent"),function(_11,_12){
with(_11){
return defaultAgent;
}
}),new objj_method(sel_getUid("setDefaultAgent:"),function(_13,_14,_15){
with(_13){
defaultAgent=_15;
}
}),new objj_method(sel_getUid("defaultScanner"),function(_16,_17){
with(_16){
return defaultScanner;
}
}),new objj_method(sel_getUid("setDefaultScanner:"),function(_18,_19,_1a){
with(_18){
defaultScanner=_1a;
}
}),new objj_method(sel_getUid("defaultLanguage"),function(_1b,_1c){
with(_1b){
return defaultLanguage;
}
}),new objj_method(sel_getUid("setDefaultLanguage:"),function(_1d,_1e,_1f){
with(_1d){
defaultLanguage=_1f;
}
}),new objj_method(sel_getUid("asURLParam"),function(_20,_21){
with(_20){
return key;
}
}),new objj_method(sel_getUid("setId:"),function(_22,_23,_24){
with(_22){
id=_24;
objj_msgSend(_22,"willChangeValueForKey:","key");
key=objj_msgSend(objj_msgSend(MediaTypeCodeMap,"allKeysForObject:",String(id)),"objectAtIndex:",0);
objj_msgSend(_22,"didChangeValueForKey:","key");
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("initialize"),function(_25,_26){
with(_25){
if(_1==nil&&_2==NO){
_2=YES;
onsuccess=function(_27){
var _28=_27.request.responsePropertyList(),_29=objj_msgSend(CPMutableArray,"array");
objj_msgSend(_28,"enumerateObjectsUsingBlock:",function(_2a){
var _2b=objj_msgSend(objj_msgSend(_25,"alloc"),"init");
objj_msgSend(_2b,"setName:",objj_msgSend(_2a,"objectForKey:","TypeName"));
objj_msgSend(_2b,"setId:",objj_msgSend(_2a,"objectForKey:","TypeID"));
objj_msgSend(_2b,"setDefaultAgent:",objj_msgSend(objj_msgSend(MMAgent,"alloc"),"initWithIdentifier:",objj_msgSend(_2a,"objectForKey:","TypeDefaultAgent")));
objj_msgSend(_2b,"setDefaultScanner:",objj_msgSend(objj_msgSend(MMScanner,"alloc"),"initWithName:",objj_msgSend(_2a,"objectForKey:","TypeDefaultScanner")));
objj_msgSend(_2b,"setDefaultLanguage:",objj_msgSend(objj_msgSend(LanguageConfig,"alloc"),"initWithCode:",objj_msgSend(_2a,"objectForKey:","TypeDefaultLanguage")));
objj_msgSend(_29,"addObject:",_2b);
});
_1=objj_msgSend(CPArray,"arrayWithArray:",_29);
_2=NO;
};
onfailure=function(){
CPLog.error("[%@ %@] failed to load SectionTypes.plist",objj_msgSend(_25,"class"),_26);
fetchingLanguageNames=NO;
};
var _2c=new CFHTTPRequest(),url=objj_msgSend(CPURL,"URLWithString:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","SectionTypes.plist"));
_2c.overrideMimeType("text/xml");
_2c.onsuccess=onsuccess;
_2c.onfailure=onfailure;
_2c.open("GET",objj_msgSend(url,"absoluteString"),false);
_2c.send("");
}
}
}),new objj_method(sel_getUid("allTypes"),function(_2d,_2e){
with(_2d){
if(_1){
return _1;
}
}
}),new objj_method(sel_getUid("sectionTypeForKey:"),function(_2f,_30,key){
with(_2f){
var _31=objj_msgSend(_2f,"allTypes");
for(var i=0,_32=objj_msgSend(_31,"count");i<_32;i++){
var _33=objj_msgSend(_31,"objectAtIndex:",i);
if(objj_msgSend(objj_msgSend(_33,"key"),"isEqualToString:",key)){
return _33;
}
}
objj_msgSend(CPException,"raise:reason:","SectionTypeNotFound","no such section type "+key);
}
})]);
p;17;MMURLConnection.jt;2272;@STATIC;1.0;I;27;Foundation/CPUserDefaults.ji;13;PMSSecurity.ji;40;Controllers/MMAuthenticationController.jt;2158;
objj_executeFile("Foundation/CPUserDefaults.j",NO);
objj_executeFile("PMSSecurity.j",YES);
objj_executeFile("Controllers/MMAuthenticationController.j",YES);
var _1=objj_allocateClassPair(CPURLConnection,"MMURLConnection"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithRequest:delegate:startImmediately:"),function(_3,_4,_5,_6,_7){
with(_3){
var _8=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMURLConnection").super_class},"initWithRequest:delegate:startImmediately:",_5,_6,NO);
_isLocalFileConnection=NO;
objj_msgSend(_3,"setAuthenticationHeaders");
if(_7){
objj_msgSend(_3,"start");
}
return _8;
}
}),new objj_method(sel_getUid("setAuthenticationHeaders"),function(_9,_a){
with(_9){
var _b=objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"username"),_c=objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"hashedPassword"),_d=objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"token");
if(_d){
objj_msgSend(_request,"setValue:forHTTPHeaderField:",_d,"X-Plex-Token");
}else{
if(_b&&_c){
objj_msgSend(_request,"setValue:forHTTPHeaderField:",_b,"X-Plex-User");
objj_msgSend(_request,"setValue:forHTTPHeaderField:",_c,"X-Plex-Pass");
}
}
}
}),new objj_method(sel_getUid("_readyStateDidChange"),function(_e,_f){
with(_e){
if(_HTTPRequest.readyState()===CFHTTPRequest.CompleteState){
var _10=_HTTPRequest.status();
if(_10===406||_10===401){
if(objj_msgSend(objj_msgSend(_e,"delegate"),"respondsToSelector:",sel_getUid("connectionDidReceiveAuthenticationChallenge:"))){
objj_msgSend(objj_msgSend(_e,"delegate"),"connectionDidReceiveAuthenticationChallenge:",_e);
}else{
objj_msgSend(objj_msgSend(MMAuthenticationController,"sharedAuthenticationController"),"connectionDidReceiveAuthenticationChallenge:",_e);
}
}else{
objj_msgSend(objj_msgSend(MMAuthenticationController,"sharedAuthenticationController"),"connectionSucceeded:",_e);
objj_msgSendSuper({receiver:_e,super_class:objj_getClass("MMURLConnection").super_class},"_readyStateDidChange");
}
}else{
objj_msgSendSuper({receiver:_e,super_class:objj_getClass("MMURLConnection").super_class},"_readyStateDidChange");
}
}
})]);
p;40;Controllers/MMAuthenticationController.jt;7372;@STATIC;1.0;I;21;Foundation/CPObject.ji;16;../PMSSecurity.jt;7306;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("../PMSSecurity.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"MMAuthenticationController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("loginPrompt"),new objj_ivar("usernameField"),new objj_ivar("passwordField"),new objj_ivar("rememberMeCheckbox"),new objj_ivar("authenticateButton"),new objj_ivar("connectionsToRetry"),new objj_ivar("displayingLoginPrompt"),new objj_ivar("enabled")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("enabled"),function(_4,_5){
with(_4){
return enabled;
}
}),new objj_method(sel_getUid("setEnabled:"),function(_6,_7,_8){
with(_6){
enabled=_8;
}
}),new objj_method(sel_getUid("init"),function(_9,_a){
with(_9){
if(_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("MMAuthenticationController").super_class},"init")){
connectionsToRetry=objj_msgSend(CPArray,"array");
loginPrompt=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"init");
objj_msgSend(loginPrompt,"setTheme:",objj_msgSend(CPTheme,"defaultHudTheme"));
objj_msgSend(loginPrompt,"setAlertStyle:",CPInformationalAlertStyle);
objj_msgSend(loginPrompt,"setTitle:",CPLocalizedString("Authentication Required","Login prompt title"));
objj_msgSend(loginPrompt,"setMessageText:",CPLocalizedString("Plex Media Server requires a username and password:","Login prompt message"));
objj_msgSend(loginPrompt,"addButtonWithTitle:",CPLocalizedString("Authenticate","Authenticate"));
usernameField=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","",CPLocalizedString("Username","Username field placeholder"),309);
objj_msgSend(usernameField,"setDelegate:",_9);
passwordField=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","",CPLocalizedString("Password","Password field placeholder"),309);
objj_msgSend(passwordField,"setDelegate:",_9);
objj_msgSend(passwordField,"setFrameOrigin:",CGPointMake(0,CGRectGetMaxY(objj_msgSend(usernameField,"frame"))+5));
objj_msgSend(passwordField,"setSecure:",YES);
rememberMeCheckbox=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("Remember me on this computer","Check box label for the login prompt"));
objj_msgSend(rememberMeCheckbox,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(rememberMeCheckbox,"setFrameOrigin:",CGPointMake(5,CGRectGetMaxY(objj_msgSend(passwordField,"frame"))+5));
var _b=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,309,CGRectGetMaxY(objj_msgSend(rememberMeCheckbox,"frame"))));
objj_msgSend(_b,"addSubview:",usernameField);
objj_msgSend(_b,"addSubview:",passwordField);
objj_msgSend(_b,"addSubview:",rememberMeCheckbox);
objj_msgSend(loginPrompt,"setDelegate:",_9);
objj_msgSend(loginPrompt,"setAccessoryView:",_b);
authenticateButton=objj_msgSend(objj_msgSend(loginPrompt,"buttons"),"objectAtIndex:",0);
objj_msgSend(authenticateButton,"setEnabled:",NO);
objj_msgSend(authenticateButton,"setTarget:",_9);
objj_msgSend(authenticateButton,"setAction:",sel_getUid("authenticate:"));
objj_msgSend(_9,"restoreStateFromUserDefaults");
}
return _9;
}
}),new objj_method(sel_getUid("presentAuthenticationWindow"),function(_c,_d){
with(_c){
if(displayingLoginPrompt&&objj_msgSend(_c,"enabled")){
return;
}
objj_msgSend(_c,"setEnabled:",YES);
if(displayingLoginPrompt){
objj_msgSend(_c,"shakeLoginPrompt");
objj_msgSend(passwordField,"selectAll:",nil);
objj_msgSend(objj_msgSend(passwordField,"window"),"makeFirstResponder:",passwordField);
}else{
objj_msgSend(loginPrompt,"runModal");
objj_msgSend(objj_msgSend(usernameField,"window"),"makeFirstResponder:",usernameField);
}
displayingLoginPrompt=YES;
}
}),new objj_method(sel_getUid("restoreStateFromUserDefaults"),function(_e,_f){
with(_e){
var _10=objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"username"),_11=objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"password");
objj_msgSend(usernameField,"setStringValue:",_10);
objj_msgSend(passwordField,"setStringValue:",_11);
objj_msgSend(rememberMeCheckbox,"setState:",objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"shouldPersistCredentials")?CPOnState:CPOffState);
}
}),new objj_method(sel_getUid("shakeLoginPrompt"),function(_12,_13){
with(_12){
var _14=30,_15=3,_16=0.18,_17=0,_18=objj_msgSend(loginPrompt._window,"frame").origin,_19=_18.x,_1a=_18.y;
for(var i=0;i<_15;i++){
var _1b;
_1b=_16/_15/4;
objj_msgSend(_12,"animateLoginPromptOrigin:duration:afterDelay:",CGPointMake(_19-_14,_1a),_1b,_17);
_17+=_1b;
_1b=_16/_15/2;
objj_msgSend(_12,"animateLoginPromptOrigin:duration:afterDelay:",CGPointMake(_19+_14,_1a),_1b,_17);
_17+=_1b;
_1b=_16/_15/4;
objj_msgSend(_12,"animateLoginPromptOrigin:duration:afterDelay:",CGPointMake(_19,_1a),_1b,_17);
_17+=_1b;
}
}
}),new objj_method(sel_getUid("animateLoginPromptOrigin:duration:afterDelay:"),function(_1c,_1d,_1e,_1f,_20){
with(_1c){
setTimeout(function(){
var _21=loginPrompt._window,_22=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithDuration:animationCurve:",_1f,CPAnimationEaseInOut),_23=objj_msgSend(_21,"frame"),_24=CGRectMake(_1e.x,_1e.y,CGRectGetWidth(_23),CGRectGetHeight(_23));
objj_msgSend(_22,"setViewAnimations:",[objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_21,CPViewAnimationTargetKey,_23,CPViewAnimationStartFrameKey,_24,CPViewAnimationEndFrameKey)]);
objj_msgSend(_22,"startAnimation");
},_20*1000);
}
}),new objj_method(sel_getUid("connectionDidReceiveAuthenticationChallenge:"),function(_25,_26,_27){
with(_25){
objj_msgSend(connectionsToRetry,"addObject:",_27);
objj_msgSend(_27,"cancel");
objj_msgSend(_25,"presentAuthenticationWindow");
}
}),new objj_method(sel_getUid("connectionSucceeded:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(CPApp,"abortModal");
objj_msgSend(loginPrompt._window,"close");
displayingLoginPrompt=NO;
}
}),new objj_method(sel_getUid("authenticate:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSend(_2b,"setEnabled:",NO);
var _2e=objj_msgSend(usernameField,"stringValue"),_2f=objj_msgSend(passwordField,"stringValue");
objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"setUsername:",_2e);
objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"setPassword:",_2f);
objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"setShouldPersistCredentials:",objj_msgSend(rememberMeCheckbox,"state")==CPOnState);
var _30=nil;
while(_30=connectionsToRetry.shift()){
objj_msgSend(_30,"setAuthenticationHeaders");
objj_msgSend(_30,"start");
}
}
}),new objj_method(sel_getUid("controlTextDidChange:"),function(_31,_32,_33){
with(_31){
objj_msgSend(authenticateButton,"setEnabled:",objj_msgSend(usernameField,"stringValue")&&objj_msgSend(passwordField,"stringValue"));
}
}),new objj_method(sel_getUid("setEnabled:"),function(_34,_35,_36){
with(_34){
_36=!!_36;
if(enabled===_36){
return;
}
enabled=_36;
objj_msgSend(authenticateButton,"setEnabled:",enabled&&objj_msgSend(usernameField,"stringValue")&&objj_msgSend(passwordField,"stringValue"));
objj_msgSend(usernameField,"setEnabled:",enabled);
objj_msgSend(passwordField,"setEnabled:",enabled);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedAuthenticationController"),function(_37,_38){
with(_37){
if(!_1){
_1=objj_msgSend(objj_msgSend(_37,"alloc"),"init");
objj_msgSend(MMURLConnection,"setClassDelegate:",_1);
}
return _1;
}
})]);
p;52;Controllers/MMMetadataItemCollectionViewController.jt;17314;@STATIC;1.0;i;18;MMViewController.ji;41;../DataSources/MMLibraryMediaDataSource.ji;44;../DataSources/MMLibraryTimelineDataSource.ji;28;../Models/MMLibrarySection.ji;39;../Views/MMMetadataItemCollectionView.ji;29;../Views/MMMetadataItemCell.ji;23;../Views/MMScrollView.jt;17037;
objj_executeFile("MMViewController.j",YES);
objj_executeFile("../DataSources/MMLibraryMediaDataSource.j",YES);
objj_executeFile("../DataSources/MMLibraryTimelineDataSource.j",YES);
objj_executeFile("../Models/MMLibrarySection.j",YES);
objj_executeFile("../Views/MMMetadataItemCollectionView.j",YES);
objj_executeFile("../Views/MMMetadataItemCell.j",YES);
objj_executeFile("../Views/MMScrollView.j",YES);
MMMetadataItemCollectionViewControllerStateInitialized=0;
MMMetadataItemCollectionViewControllerStateLoading=1;
MMMetadataItemCollectionViewControllerStateLoaded=2;
var _1=nil;
var _2=objj_allocateClassPair(MMViewController,"MMMetadataItemCollectionViewController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("content"),new objj_ivar("_dataSource"),new objj_ivar("_collectionView"),new objj_ivar("_sortDescriptor"),new objj_ivar("_title"),new objj_ivar("updateStatus"),new objj_ivar("readyState"),new objj_ivar("showToolbar")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("content"),function(_4,_5){
with(_4){
return content;
}
}),new objj_method(sel_getUid("setContent:"),function(_6,_7,_8){
with(_6){
content=_8;
}
}),new objj_method(sel_getUid("title"),function(_9,_a){
with(_9){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_b,_c,_d){
with(_b){
_title=_d;
}
}),new objj_method(sel_getUid("readyState"),function(_e,_f){
with(_e){
return readyState;
}
}),new objj_method(sel_getUid("setReadyState:"),function(_10,_11,_12){
with(_10){
readyState=_12;
}
}),new objj_method(sel_getUid("init"),function(_13,_14){
with(_13){
return objj_msgSend(_13,"initWithToolbar:",YES);
}
}),new objj_method(sel_getUid("initWithToolbar:"),function(_15,_16,_17){
with(_15){
if(_15=objj_msgSendSuper({receiver:_15,super_class:objj_getClass("MMMetadataItemCollectionViewController").super_class},"init")){
showToolbar=_17;
objj_msgSend(_15,"bind:toObject:withKeyPath:options:","title",_15,"content.title",nil);
_sortDescriptor=objj_msgSend(CPSortDescriptor,"sortDescriptorWithKey:ascending:","titleSort",YES);
var _18=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_18,"addObserver:selector:name:object:",_15,sel_getUid("_recordsWereReceived:"),MMDataSourceDidReceiveRecords,nil);
objj_msgSend(_18,"addObserver:selector:name:object:",_15,sel_getUid("_recordWasDeleted:"),MMDataSourceDidDeleteRecord,nil);
objj_msgSend(_18,"addObserver:selector:name:object:",_15,sel_getUid("_recordWasCreated:"),MMDataSourceDidCreateRecord,nil);
objj_msgSend(_15,"setReadyState:",MMMetadataItemCollectionViewControllerStateInitialized);
}
return _15;
}
}),new objj_method(sel_getUid("dataSource"),function(_19,_1a){
with(_19){
if(!_dataSource){
_dataSource=objj_msgSend(objj_msgSend(MMLibraryMediaDataSource,"alloc"),"initWithDelegate:",_19);
}
return _dataSource;
}
}),new objj_method(sel_getUid("setContent:"),function(_1b,_1c,_1d){
with(_1b){
var _1e=(objj_msgSend(_1b,"content")!=_1d);
content=_1d;
if(_1e){
objj_msgSend(objj_msgSend(MMLibraryTimelineDataSource,"sharedDataSource"),"stopWatchingTimeline");
}
objj_msgSend(_collectionView,"setContent:",[]);
if(!objj_msgSend(_1b,"content")||!objj_msgSend(objj_msgSend(objj_msgSend(_1b,"content"),"children"),"count")){
objj_msgSend(_1b,"setReadyState:",MMMetadataItemCollectionViewControllerStateLoaded);
}
if(objj_msgSend(_1b,"content")&&_1e){
objj_msgSend(_1b,"setReadyState:",MMMetadataItemCollectionViewControllerStateLoading);
objj_msgSend(objj_msgSend(_1b,"dataSource"),"refreshRecordsWithContextInfo:",objj_msgSend(_1b,"content"));
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",0,function(){
objj_msgSend(objj_msgSend(_collectionView,"window"),"makeFirstResponder:",_collectionView);
},NO);
}else{
if(objj_msgSend(objj_msgSend(objj_msgSend(_1b,"content"),"children"),"count")){
objj_msgSend(_1b,"setReadyState:",MMMetadataItemCollectionViewControllerStateLoaded);
}
}
}
}),new objj_method(sel_getUid("children"),function(_1f,_20){
with(_1f){
return objj_msgSend(objj_msgSend(_1f,"content"),"children");
}
}),new objj_method(sel_getUid("reloadContent"),function(_21,_22){
with(_21){
objj_msgSend(_collectionView,"setContent:",objj_msgSend(CPArray,"arrayWithArray:",objj_msgSend(_21,"children")));
}
}),new objj_method(sel_getUid("dataSource:didReceiveRecords:contextInfo:"),function(_23,_24,_25,_26,_27){
with(_23){
if((_25!=_dataSource)||(objj_msgSend(_23,"content")!=_27)){
return;
}
objj_msgSend(_collectionView,"scrollPoint:",CGPointMake(0,0));
objj_msgSend(_collectionView,"setSelectionIndexes:",objj_msgSend(CPIndexSet,"indexSet"));
objj_msgSend(_collectionView,"setContent:",_26);
objj_msgSend(objj_msgSend(_23,"content"),"setChildren:",_26);
objj_msgSend(_23,"restoreChildState");
objj_msgSend(_23,"setReadyState:",MMMetadataItemCollectionViewControllerStateLoaded);
var _28=objj_msgSend(objj_msgSend(_23,"content"),"librarySection");
if(objj_msgSend(_28,"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"))){
objj_msgSend(objj_msgSend(MMLibraryTimelineDataSource,"sharedDataSource"),"watchTimelineForLibrarySection:",_28);
}
}
}),new objj_method(sel_getUid("_recordsWereReceived:"),function(_29,_2a,_2b){
with(_29){
if(!objj_msgSend(objj_msgSend(_2b,"object"),"isKindOfClass:",objj_msgSend(MMLibraryTimelineDataSource,"class"))){
return;
}
var _2c=objj_msgSend(_2b,"userInfo"),_2d=objj_msgSend(_29,"content"),_2e=objj_msgSend(_2c,"objectForKey:","records"),_2f=objj_msgSend(_2c,"objectForKey:","contextInfo"),_30=nil,_31=objj_msgSend(_2d,"isCollection")&&objj_msgSend(objj_msgSend(_2c,"objectForKey:","changes"),"containsObject:","collections"),_32={};
for(var i=0,_33=objj_msgSend(_29,"children"),_34=objj_msgSend(_33,"count");i<_34;i++){
_32[objj_msgSend(_33[i],"key")]=true;
}
for(var i=0,_34=objj_msgSend(_2e,"count");i<_34;i++){
var _35=_2e[i];
if(!objj_msgSend(_35,"isKindOfClass:",objj_msgSend(PMCBaseObject,"class"))||!objj_msgSend(objj_msgSend(_35,"parent"),"isEqual:",_2d)){
continue;
}
if(!_32[objj_msgSend(_35,"key")]){
CPLog.info("[%@ %@] we haven't seen %@ before, add it",objj_msgSend(_29,"class"),_2a,_35);
objj_msgSend(_29,"_recordWasCreated:",_2b);
}else{
if(_31&&!objj_msgSend(_35,"belongsToCollection:",_2d)){
CPLog.info("[%@ %@] %@ was just removed from the collection %@, removing it from view",objj_msgSend(_29,"class"),_2a,_35,objj_msgSend(_2d,"title"));
objj_msgSend(_collectionView,"removeObject:",_35);
objj_msgSend(_collectionView,"tile");
}
}
_30=_35;
}
objj_msgSend(_29,"showUpdateStatusForItem:",_30);
}
}),new objj_method(sel_getUid("_recordWasDeleted:"),function(_36,_37,_38){
with(_36){
var _39=objj_msgSend(_38,"userInfo"),_3a=objj_msgSend(_39,"objectForKey:","record");
if(!objj_msgSend(_3a,"isKindOfClass:",objj_msgSend(PMCBaseObject,"class"))||!objj_msgSend(objj_msgSend(_3a,"parent"),"isEqual:",objj_msgSend(_36,"content"))){
return;
}
CPLog.info("[%@ %@] removing record with id=%@",objj_msgSend(_36,"class"),_37,objj_msgSend(_3a,"id"));
if(objj_msgSend(objj_msgSend(_36,"children"),"containsObject:",_3a)){
objj_msgSend(_36,"willChangeValueForKey:","content");
objj_msgSend(_collectionView,"removeObject:",_3a);
objj_msgSend(_36,"didChangeValueForKey:","content");
}
}
}),new objj_method(sel_getUid("_recordWasCreated:"),function(_3b,_3c,_3d){
with(_3b){
var _3e=objj_msgSend(_3d,"userInfo"),_3f=objj_msgSend(_3e,"objectForKey:","record");
if(!objj_msgSend(_3f,"isKindOfClass:",objj_msgSend(PMCBaseObject,"class"))||!objj_msgSend(objj_msgSend(_3f,"parent"),"isEqual:",objj_msgSend(_3b,"content"))){
return;
}
CPLog.info("[%@ %@] adding record %@",objj_msgSend(_3b,"class"),_3c,_3f);
objj_msgSend(_3b,"willChangeValueForKey:","content");
objj_msgSend(_collectionView,"insertObject:inArraySortedByDescriptors:",_3f,[_sortDescriptor]);
objj_msgSend(_3b,"didChangeValueForKey:","content");
objj_msgSend(_3b,"showUpdateStatusForItem:",_3f);
}
}),new objj_method(sel_getUid("status"),function(_40,_41){
with(_40){
if(!objj_msgSend(_40,"content")){
return nil;
}
var _42=objj_msgSend(_40,"content"),_43;
while(_42&&!(_43=objj_msgSend(_42,"type"))){
_42=objj_msgSend(_42,"parent");
}
_43=objj_msgSend(_43,"key");
if(!_43){
_43="item";
}
var _44="%d "+_43,_45=(objj_msgSend(_40,"readyState")===MMMetadataItemCollectionViewControllerStateLoaded)?objj_msgSend(objj_msgSend(objj_msgSend(_40,"content"),"children"),"count"):0;
switch(_45||0){
case 0:
switch(_43){
case "movie":
_44=CPLocalizedString("no movies","Status label value for when there are no movies");
break;
case "show":
_44=CPLocalizedString("no TV shows","Status label value when there are no TV shows");
break;
case "artist":
_44=CPLocalizedString("no artists","Status label value when there are no musical artists");
break;
case "photo":
_44=CPLocalizedString("no photos","Status label value when there are no photos");
break;
case "item":
_44=CPLocalizedString("no items","Status label value for unknown type when there are none");
break;
}
break;
case 1:
switch(_43){
case "movie":
_44=CPLocalizedString("1 movie","Status label value for when there is one movie");
break;
case "show":
_44=CPLocalizedString("1 TV show","Status label value for when there is one TV show");
break;
case "artist":
_44=CPLocalizedString("1 artist","Status label value for when there is one musical artist");
break;
case "photo":
_44=CPLocalizedString("1 photo","Status label value for when there is one photo");
break;
case "item":
_44=CPLocalizedString("1 item","Status label value for unknown type for when there is one");
break;
}
break;
default:
switch(_43){
case "movie":
_44=CPLocalizedString("%d movies","Status label value for when there is more than one movie");
break;
case "show":
_44=CPLocalizedString("%d TV shows","Status label value for when there is more than one TV show");
break;
case "artist":
_44=CPLocalizedString("%d artists","Status label value for when there is more than one musical artist");
break;
case "photo":
_44=CPLocalizedString("%d photos","Status label value for when there is more than one");
break;
case "item":
_44=CPLocalizedString("%d items","Status label value for unknown type for when there is more than one");
break;
}
break;
}
return objj_msgSend(CPString,"stringWithFormat:",_44,_45);
}
}),new objj_method(sel_getUid("updateStatus"),function(_46,_47){
with(_46){
if(updateStatus){
return updateStatus;
}
if(objj_msgSend(objj_msgSend(_46,"content"),"respondsToSelector:",sel_getUid("updateQueueSize"))){
var _48=objj_msgSend(objj_msgSend(_46,"content"),"updateQueueSize");
if(_48){
if(_48==1){
return CPLocalizedString("Refreshing info for one item","Status label for refreshing sections with one remaining item");
}else{
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Refreshing info for %d items","Status label for refreshing sections"),_48);
}
}
}
var _49=objj_msgSend(objj_msgSend(_46,"content"),"updatedAt");
if(!_49){
return nil;
}
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Last refreshed %@ at %@","Status label for media items"),objj_msgSend(_49,"relativeDate"),objj_msgSend(_49,"shortLocalTime"));
}
}),new objj_method(sel_getUid("setUpdateStatus:"),function(_4a,_4b,_4c){
with(_4a){
updateStatus=_4c;
}
}),new objj_method(sel_getUid("showUpdateStatusForItem:"),function(_4d,_4e,_4f){
with(_4d){
if(!_1){
_1=objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",CPLocalizedString("Scanning '%@'","Metadata item status message when it is newly scanned/created"),PMCBaseObjectStateCreated,CPLocalizedString("Media analysis on '%@'","Metadata item status message when it is being read"),PMCBaseObjectStateProgress,CPLocalizedString("Matching '%@'","Metadata item status message when it is being matched to a canonical item"),PMCBaseObjectStateMatching,CPLocalizedString("Requesting metadata for '%@'","Metadata item status message when its info is downloading"),PMCBaseObjectStateDownloadingMetadata,CPLocalizedString("Loading metadata for '%@'","Metadata item status message when its data is importing"),PMCBaseObjectStateLoadingMetadata);
}
var _50=objj_msgSend(_1,"objectForKey:",objj_msgSend(_4f,"state"));
objj_msgSend(_4d,"setUpdateStatus:",_50&&objj_msgSend(CPString,"stringWithFormat:",_50,objj_msgSend(_4f,"title")));
}
}),new objj_method(sel_getUid("loadView"),function(_51,_52){
with(_51){
var _53=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,800,800)),_54=showToolbar?30:0,_55=objj_msgSend(objj_msgSend(MMToolbar,"alloc"),"initWithFrame:style:",CGRectMake(0,CGRectGetHeight(objj_msgSend(_53,"frame"))-_54,CGRectGetWidth(objj_msgSend(_53,"frame")),_54),MMToolbarHUDStyle),_56=objj_msgSend(objj_msgSend(MMScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(objj_msgSend(_53,"frame")),CGRectGetMinY(objj_msgSend(_55,"frame")))),_57=objj_msgSend(objj_msgSend(MMMetadataItemCollectionView,"alloc"),"initWithFrame:",objj_msgSend(_56,"bounds")),_58=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init"),_59=objj_msgSend(objj_msgSend(MMMetadataItemCell,"alloc"),"initWithFrame:",CGRectMake(0,0,175,220));
if(showToolbar){
objj_msgSend(_55,"setAutoresizingMask:",CPViewWidthSizable|CPViewMinYMargin);
var _5a=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(_5a,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_5a,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_5a,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(_5a,"sizeToFit");
objj_msgSend(_5a,"setFrame:",CGRectMake(10,(CGRectGetHeight(objj_msgSend(_55,"frame"))-CGRectGetHeight(objj_msgSend(_5a,"frame")))/2,CGRectGetWidth(objj_msgSend(_55,"frame")),CGRectGetHeight(objj_msgSend(_5a,"frame"))));
objj_msgSend(_5a,"bind:toObject:withKeyPath:options:",CPValueBinding,_51,"updateStatus",nil);
objj_msgSend(_55,"addSubview:",_5a);
var _5b=objj_msgSend(HUDButton,"buttonWithTitle:",CPLocalizedString("Edit Section","Edit Section"));
objj_msgSend(_5b,"setFrameOrigin:",CGPointMake(CGRectGetWidth(objj_msgSend(_55,"frame"))-5-CGRectGetWidth(objj_msgSend(_5b,"frame")),(CGRectGetHeight(objj_msgSend(_55,"frame"))-CGRectGetHeight(objj_msgSend(_5b,"frame")))/2));
objj_msgSend(_5b,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin|CPViewMinXMargin);
objj_msgSend(_5b,"setTarget:",_51);
objj_msgSend(_5b,"setAction:",sel_getUid("editSection:"));
objj_msgSend(_55,"addSubview:",_5b);
var _5c=objj_msgSend(HUDButton,"buttonWithTitle:",CPLocalizedString("Customize Section","Customize Section"));
objj_msgSend(_5c,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_5b,"frame"))-5-CGRectGetWidth(objj_msgSend(_5c,"frame")),CGRectGetMinY(objj_msgSend(_5b,"frame"))));
objj_msgSend(_5c,"setAutoresizingMask:",objj_msgSend(_5b,"autoresizingMask"));
objj_msgSend(_5c,"setEnabled:",NO);
objj_msgSend(_55,"addSubview:",_5c);
}
objj_msgSend(_56,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_56,"setAutohidesScrollers:",YES);
objj_msgSend(_56,"setDocumentView:",_57);
objj_msgSend(_58,"setView:",_59);
objj_msgSend(_57,"setItemPrototype:",_58);
objj_msgSend(_57,"setMinItemSize:",objj_msgSend(_59,"frame").size);
objj_msgSend(_57,"setMaxItemSize:",objj_msgSend(_59,"frame").size);
objj_msgSend(_57,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_57,"setDelegate:",_51);
objj_msgSend(_53,"addSubview:",_56);
if(showToolbar){
objj_msgSend(_53,"addSubview:",_55);
}
_collectionView=_57;
objj_msgSend(_51,"setView:",_53);
}
}),new objj_method(sel_getUid("wasPushedOntoContentController:"),function(_5d,_5e,_5f){
with(_5d){
objj_msgSend(_5d,"restoreChildState");
}
}),new objj_method(sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"),function(_60,_61,_62,_63){
with(_60){
var _64=objj_msgSend(objj_msgSend(objj_msgSend(_60,"content"),"children"),"objectAtIndex:",_63);
if(objj_msgSend(_64,"isKindOfClass:",objj_msgSend(MMMetadataItem,"class"))&&objj_msgSend(objj_msgSend(_64,"type"),"isEqualToString:",PMCObjectTypePhoto)){
return;
}
var loc=objj_msgSend(_60,"location")||"home";
objj_msgSend(objj_msgSend(LPLocationController,"sharedLocationController"),"setLocationForObjects:",loc,_64);
}
}),new objj_method(sel_getUid("editSection:"),function(_65,_66,_67){
with(_65){
var _68=objj_msgSend(objj_msgSend(MMSectionSettingsSheet,"alloc"),"initWithDataSource:",objj_msgSend(MMLibrarySectionsDataSource,"sharedDataSource"));
objj_msgSend(_68,"beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:",objj_msgSend(objj_msgSend(_65,"view"),"window"),_65,nil,objj_msgSend(_65,"content"));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("keyPathsForValuesAffectingStatus"),function(_69,_6a){
with(_69){
return objj_msgSend(CPSet,"setWithObjects:","content","content.children","readyState");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingTitle"),function(_6b,_6c){
with(_6b){
return objj_msgSend(CPSet,"setWithObject:","content");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingUpdateStatus"),function(_6d,_6e){
with(_6d){
return objj_msgSend(CPSet,"setWithObjects:","content","content.updatedAt","content.updateQueueSize");
}
})]);
p;38;DataSources/MMLibraryMediaDataSource.jt;4452;@STATIC;1.0;I;21;Foundation/CPObject.ji;23;../Models/MMMediaItem.ji;27;../Models/MMMediaItemPart.ji;14;MMDataSource.ji;27;../CPObject+XMLAttributes.jt;4296;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("../Models/MMMediaItem.j",YES);
objj_executeFile("../Models/MMMediaItemPart.j",YES);
objj_executeFile("MMDataSource.j",YES);
objj_executeFile("../CPObject+XMLAttributes.j",YES);
var _1=["key","guid","title","titleSort","originalTitle","tagline","year","rating","summary","studio","contentRating","originallyAvailableAt","art","thumb","index","duration","type","leafCount","deletedAt","state","parentTitle"];
var _2=objj_allocateClassPair(MMDataSource,"MMLibraryMediaDataSource"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("URLForRecordsWithContextInfo:"),function(_4,_5,_6){
with(_4){
if(objj_msgSend(_6,"respondsToSelector:",sel_getUid("allMediaItemsURL"))){
return objj_msgSend(_6,"allMediaItemsURL");
}else{
return objj_msgSend(PMSURL,"URLWithPath:",objj_msgSend(_6,"key"));
}
}
}),new objj_method(sel_getUid("URLForRecord:contextInfo:"),function(_7,_8,_9,_a){
with(_7){
return objj_msgSend(_9,"URL");
}
}),new objj_method(sel_getUid("URLForUpdatedRecord:contextInfo:"),function(_b,_c,_d,_e){
with(_b){
return objj_msgSend(PMSURL,"URLWithPath:params:",objj_msgSend(CPString,"stringWithFormat:","/library/metadata/%@",objj_msgSend(_d,"id")),objj_msgSend(_d,"changedAttributeDictionary"));
}
}),new objj_method(sel_getUid("HTTPBodyForUpdatedRecord:contextInfo:"),function(_f,_10,_11,_12){
with(_f){
return nil;
}
}),new objj_method(sel_getUid("shouldProcessNode:contextInfo:"),function(_13,_14,_15,_16){
with(_13){
return /^(Video|Directory|Media|Photo|Track)$/.test(String(_15.nodeName))&&_15.getAttribute("type");
}
}),new objj_method(sel_getUid("recordFromElement:contextInfo:"),function(_17,_18,_19,_1a){
with(_17){
var key=String(_19.getAttribute("key")),id=objj_msgSend(PMCBaseObject,"idFromKey:",key),_1b=key;
if(!objj_msgSend(_1b,"hasPrefix:","/")&&_1a){
_1b=objj_msgSend(CPString,"stringWithFormat:","%@/%@",objj_msgSend(_1a,"path"),key);
}
var _1c=((objj_msgSend(String(_19.nodeName),"isEqualToString:","Directory"))?objj_msgSend(PMCDirectoryObject,"class"):objj_msgSend(MMMetadataItem,"class")),_1d=objj_msgSend(objj_msgSend(_17,"dataStore"),"recordWithClass:id:",_1c,_1b);
if(_1d==_1a){
return nil;
}
objj_msgSend(_1d,"stopTrackingChangesInBlock:",function(){
objj_msgSend(_1d,"setPath:",_1b);
objj_msgSend(_1d,"setParent:",_1a);
if(_1c==objj_msgSend(PMCDirectoryObject,"class")){
objj_msgSend(_1d,"setMediaFlagPrefix:",_19.parentNode.getAttribute("mediaTagPrefix"));
objj_msgSend(_1d,"setMediaFlagVersion:",Number(_19.parentNode.getAttribute("mediaTagVersion")));
}
});
return _1d;
}
}),new objj_method(sel_getUid("updateRecord:fromElement:contextInfo:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
objj_msgSend(_1e,"readValuesForRecord:fromElement:",_20,_21);
var _23=_21.childNodes,_24=objj_msgSend(CPArray,"array");
for(var i=0,_25=_23.length;i<_25;i++){
var _26=_23[i];
switch(String(_26.nodeName)){
case "Media":
var _27=String(_26.getAttribute("id")),_28=objj_msgSend(CPString,"stringWithFormat:","%@/%@",objj_msgSend(_20,"path"),_27),_29=objj_msgSend(objj_msgSend(_1e,"dataStore"),"recordWithClass:id:",MMMediaItem,_28);
objj_msgSend(_29,"setValuesForNodeAttributes:ignoreUndefinedKeys:",_26,YES);
var _2a=_26.childNodes;
for(var j=0,_2b=_2a.length;j<_2b;j++){
var _2c=_2a[j];
if(!_2c||!_2c.nodeName||(String(_2c.nodeName)!="Part")){
continue;
}
var id=String(_2c.getAttribute("key")),_2d=objj_msgSend(objj_msgSend(_1e,"dataStore"),"recordWithClass:id:",MMMediaItemPart,id);
objj_msgSend(_2d,"setValuesForNodeAttributes:ignoreUndefinedKeys:",_2c,YES);
objj_msgSend(_24,"addObject:",_2d);
}
break;
case "Field":
var _2e=_26.getAttribute("name"),_2f=(_26.getAttribute("locked")=="1");
objj_msgSend(_20,"setValue:forKey:ignoreUndefinedKey:",_2f,_2e+"Locked",YES);
break;
case "Writer":
case "Director":
case "Genre":
case "Collection":
objj_msgSend(_20,"addTag:forType:",_26.getAttribute("tag"),String(_26.nodeName).toLowerCase()+"s");
break;
}
}
objj_msgSend(_29,"setParts:",_24);
objj_msgSend(_29,"setMetadataItem:",_20);
}
}),new objj_method(sel_getUid("readValuesForRecord:fromElement:"),function(_30,_31,_32,_33){
with(_30){
for(var i=0,_34=objj_msgSend(_1,"count");i<_34;i++){
var _35=_1[i];
objj_msgSend(_32,"setValue:forKey:",_33.getAttribute(_35),_35);
}
}
})]);
p;20;Models/MMMediaItem.jt;2768;@STATIC;1.0;I;18;Foundation/CPSet.ji;10;MMRecord.ji;18;MMLibrarySection.ji;17;MMMediaItemPart.ji;8;PMSURL.jt;2654;
objj_executeFile("Foundation/CPSet.j",NO);
objj_executeFile("MMRecord.j",YES);
objj_executeFile("MMLibrarySection.j",YES);
objj_executeFile("MMMediaItemPart.j",YES);
objj_executeFile("PMSURL.j",YES);
var _1=objj_allocateClassPair(MMRecord,"MMMediaItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("metadataItem"),new objj_ivar("parts"),new objj_ivar("videoResolution"),new objj_ivar("videoCodec"),new objj_ivar("audioCodec"),new objj_ivar("audioChannels")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("metadataItem"),function(_3,_4){
with(_3){
return metadataItem;
}
}),new objj_method(sel_getUid("setMetadataItem:"),function(_5,_6,_7){
with(_5){
metadataItem=_7;
}
}),new objj_method(sel_getUid("parts"),function(_8,_9){
with(_8){
return parts;
}
}),new objj_method(sel_getUid("setParts:"),function(_a,_b,_c){
with(_a){
if(parts!==_c){
parts=objj_msgSend(_c,"copy");
}
}
}),new objj_method(sel_getUid("videoResolution"),function(_d,_e){
with(_d){
return videoResolution;
}
}),new objj_method(sel_getUid("setVideoResolution:"),function(_f,_10,_11){
with(_f){
videoResolution=_11;
}
}),new objj_method(sel_getUid("videoCodec"),function(_12,_13){
with(_12){
return videoCodec;
}
}),new objj_method(sel_getUid("setVideoCodec:"),function(_14,_15,_16){
with(_14){
videoCodec=_16;
}
}),new objj_method(sel_getUid("audioCodec"),function(_17,_18){
with(_17){
return audioCodec;
}
}),new objj_method(sel_getUid("setAudioCodec:"),function(_19,_1a,_1b){
with(_19){
audioCodec=_1b;
}
}),new objj_method(sel_getUid("audioChannels"),function(_1c,_1d){
with(_1c){
return audioChannels;
}
}),new objj_method(sel_getUid("setAudioChannels:"),function(_1e,_1f,_20){
with(_1e){
audioChannels=_20;
}
}),new objj_method(sel_getUid("mainPart"),function(_21,_22){
with(_21){
if(objj_msgSend(parts,"count")==0){
return nil;
}
return objj_msgSend(parts,"objectAtIndex:",0);
}
}),new objj_method(sel_getUid("size"),function(_23,_24){
with(_23){
var _25=0;
for(var i=0,_26=objj_msgSend(parts,"count");i<_26;i++){
_25+=objj_msgSend(parts[i],"size");
}
return _25;
}
}),new objj_method(sel_getUid("setMetadataItem:"),function(_27,_28,_29){
with(_27){
if(metadataItem==_29){
return;
}
var _2a=metadataItem,_2b=_29;
metadataItem=_2b;
objj_msgSend(_2a,"removeMediaItem:",_27);
objj_msgSend(_2b,"addMediaItem:",_27);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("keyPathsForValuesAffectingMainPart"),function(_2c,_2d){
with(_2c){
return objj_msgSend(CPSet,"setWithObject:","parts");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingSize"),function(_2e,_2f){
with(_2e){
return objj_msgSend(CPSet,"setWithObjects:","parts");
}
})]);
p;24;Models/MMMediaItemPart.jt;948;@STATIC;1.0;i;10;MMRecord.jt;915;
objj_executeFile("MMRecord.j",YES);
var _1=objj_allocateClassPair(MMRecord,"MMMediaItemPart"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_file"),new objj_ivar("_size")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("file"),function(_3,_4){
with(_3){
return _file;
}
}),new objj_method(sel_getUid("setFile:"),function(_5,_6,_7){
with(_5){
_file=_7;
}
}),new objj_method(sel_getUid("size"),function(_8,_9){
with(_8){
return _size;
}
}),new objj_method(sel_getUid("setSize:"),function(_a,_b,_c){
with(_a){
_size=_c;
}
}),new objj_method(sel_getUid("key"),function(_d,_e){
with(_d){
return objj_msgSend(_d,"id");
}
}),new objj_method(sel_getUid("setKey:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"setId:",_11);
}
}),new objj_method(sel_getUid("setSize:"),function(_12,_13,_14){
with(_12){
if(objj_msgSend(_14,"isKindOfClass:",CPString)){
_14=Number(_14);
}
_size=_14;
}
})]);
p;26;DataSources/MMDataSource.jt;27069;@STATIC;1.0;I;21;Foundation/CPObject.jI;18;Foundation/CPURL.ji;20;../MMURLConnection.ji;13;MMDataStore.jt;26957;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPURL.j",NO);
objj_executeFile("../MMURLConnection.j",YES);
objj_executeFile("MMDataStore.j",YES);
var _1=100;
MMDataSourceImplementationIncomplete="MMDataSourceImplementationIncomplete";
MMDataSourceDidRequestRecord="MMDataSourceDidRequestRecord";
MMDataSourceDidRequestRecords="MMDataSourceDidRequestRecords";
MMDataSourceDidReceiveRecords="MMDataSourceDidReceiveRecords";
MMDataSourceDidFailToReceiveRecords="MMDataSourceDidFailToReceiveRecords";
MMDataSourceDidDeleteRecord="MMDataSourceDidDeleteRecord";
MMDataSourceDidFailToDeleteRecord="MMDataSourceDidFailToDeleteRecord";
MMDataSourceDidCreateRecord="MMDataSourceDidCreateRecord";
MMDataSourceDidFailToCreateRecord="MMDataSourceDidFailToCreateRecord";
MMDataSourceDidUpdateRecord="MMDataSourceDidUpdateRecord";
MMDataSourceDidFailToUpdateRecord="MMDataSourceDidFailToUpdateRecord";
var _2=objj_msgSend(CPDictionary,"dictionary");
var _3=objj_allocateClassPair(CPObject,"MMDataSource"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("delegate"),new objj_ivar("dataStore"),new objj_ivar("recordsByRefreshConnection"),new objj_ivar("recordsByDeleteConnection"),new objj_ivar("recordsByCreateConnection"),new objj_ivar("recordsByUpdateConnection"),new objj_ivar("contextInfoByConnection"),new objj_ivar("statusCodeByConnection"),new objj_ivar("connections"),new objj_ivar("arrayControllers"),new objj_ivar("notificationCenter"),new objj_ivar("pollingTimer"),new objj_ivar("pollingContextInfo"),new objj_ivar("pollingTimeInterval"),new objj_ivar("delegateRespondsTo_dataSource_didRequestRecord_contextInfo"),new objj_ivar("delegateRespondsTo_dataSource_didRequestRecordsWithContextInfo"),new objj_ivar("delegateRespondsTo_dataSource_didReceiveRecords_contextInfo"),new objj_ivar("delegateRespondsTo_dataSource_didFailToReceiveRecords_withError_contextInfo"),new objj_ivar("delegateRespondsTo_dataSource_didDeleteRecord_contextInfo"),new objj_ivar("delegateRespondsTo_dataSource_didFailToDeleteRecord_withError_contextInfo"),new objj_ivar("delegateRespondsTo_dataSource_didCreateRecord_contextInfo"),new objj_ivar("delegateRespondsTo_dataSource_didFailToCreateRecord_withError_contextInfo"),new objj_ivar("delegateRespondsTo_dataSource_didUpdateRecord_contextInfo"),new objj_ivar("delegateRespondsTo_dataSource_didFailToUpdateRecord_withError_contextInfo")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("delegate"),function(_5,_6){
with(_5){
return delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_7,_8,_9){
with(_7){
delegate=_9;
}
}),new objj_method(sel_getUid("dataStore"),function(_a,_b){
with(_a){
return dataStore;
}
}),new objj_method(sel_getUid("setDataStore:"),function(_c,_d,_e){
with(_c){
dataStore=_e;
}
}),new objj_method(sel_getUid("init"),function(_f,_10){
with(_f){
return objj_msgSend(_f,"initWithDelegate:",nil);
}
}),new objj_method(sel_getUid("initWithDelegate:"),function(_11,_12,_13){
with(_11){
return objj_msgSend(_11,"initWithDelegate:dataStore:",_13,nil);
}
}),new objj_method(sel_getUid("initWithDelegate:dataStore:"),function(_14,_15,_16,_17){
with(_14){
if(_14=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("MMDataSource").super_class},"init")){
objj_msgSend(_14,"setDelegate:",_16);
objj_msgSend(_14,"setDataStore:",_17||objj_msgSend(MMDataStore,"defaultDataStore"));
recordsByRefreshConnection=objj_msgSend(CPMutableDictionary,"dictionary");
recordsByDeleteConnection=objj_msgSend(CPMutableDictionary,"dictionary");
recordsByCreateConnection=objj_msgSend(CPMutableDictionary,"dictionary");
recordsByUpdateConnection=objj_msgSend(CPMutableDictionary,"dictionary");
contextInfoByConnection=objj_msgSend(CPMutableDictionary,"dictionary");
statusCodeByConnection=objj_msgSend(CPMutableDictionary,"dictionary");
notificationCenter=objj_msgSend(CPNotificationCenter,"defaultCenter");
arrayControllers=objj_msgSend(CPMutableArray,"array");
connections=objj_msgSend(CPMutableArray,"array");
}
return _14;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_18,_19,_1a){
with(_18){
delegate=_1a;
delegateRespondsTo_dataSource_didRequestRecord_contextInfo=objj_msgSend(delegate,"respondsToSelector:",sel_getUid("dataSource:didRequestRecord:contextInfo:"));
delegateRespondsTo_dataSource_didRequestRecordsWithContextInfo=objj_msgSend(delegate,"respondsToSelector:",sel_getUid("dataSource:didRequestRecordsWithContextInfo:"));
delegateRespondsTo_dataSource_didReceiveRecords_contextInfo=objj_msgSend(delegate,"respondsToSelector:",sel_getUid("dataSource:didReceiveRecords:contextInfo:"));
delegateRespondsTo_dataSource_didFailToReceiveRecords_withError_contextInfo=objj_msgSend(delegate,"respondsToSelector:",sel_getUid("dataSource:didFailToReceiveRecordsWithError:contextInfo:"));
delegateRespondsTo_dataSource_didDeleteRecord_contextInfo=objj_msgSend(delegate,"respondsToSelector:",sel_getUid("dataSource:didDeleteRecord:contextInfo:"));
delegateRespondsTo_dataSource_didFailToDeleteRecord_withError_contextInfo=objj_msgSend(delegate,"respondsToSelector:",sel_getUid("dataSource:didFailToDeleteRecord:withError:contextInfo:"));
delegateRespondsTo_dataSource_didCreateRecord_contextInfo=objj_msgSend(delegate,"respondsToSelector:",sel_getUid("dataSource:didCreateRecord:contextInfo:"));
delegateRespondsTo_dataSource_didFailToCreateRecord_withError_contextInfo=objj_msgSend(delegate,"respondsToSelector:",sel_getUid("dataSource:didFailToCreateRecord:withError:contextInfo:"));
delegateRespondsTo_dataSource_didUpdateRecord_contextInfo=objj_msgSend(delegate,"respondsToSelector:",sel_getUid("dataSource:didUpdateRecord:contextInfo:"));
delegateRespondsTo_dataSource_didFailToUpdateRecord_withError_contextInfo=objj_msgSend(delegate,"respondsToSelector:",sel_getUid("dataSource:didFailToUpdateRecord:withError:contextInfo:"));
}
}),new objj_method(sel_getUid("setSelectionIndexes:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(arrayControllers,"setValue:forKey:",_1d,"selectionIndexes");
}
}),new objj_method(sel_getUid("addArrayController:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(arrayControllers,"addObject:",_20);
}
}),new objj_method(sel_getUid("removeArrayController:"),function(_21,_22,_23){
with(_21){
objj_msgSend(arrayControllers,"removeObject:",_23);
}
}),new objj_method(sel_getUid("refreshRecord:"),function(_24,_25,_26){
with(_24){
objj_msgSend(_24,"refreshRecord:contextInfo:",_26,nil);
}
}),new objj_method(sel_getUid("refreshRecord:contextInfo:"),function(_27,_28,_29,_2a){
with(_27){
var _2b=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_27,"URLForRecord:contextInfo:",_29,_2a)),_2c=objj_msgSend(objj_msgSend(MMURLConnection,"alloc"),"initWithRequest:delegate:startImmediately:",_2b,_27,NO);
objj_msgSend(connections,"addObject:",_2c);
objj_msgSend(contextInfoByConnection,"setObject:forKey:",_2a,_2c);
objj_msgSend(recordsByRefreshConnection,"setObject:forKey:",_29,_2c);
objj_msgSend(_2c,"start");
if(delegateRespondsTo_dataSource_didRequestRecord_contextInfo){
objj_msgSend(delegate,"dataSource:didRequestRecord:contextInfo:",_27,_29,_2a);
}
objj_msgSend(notificationCenter,"postNotificationName:object:userInfo:",MMDataSourceDidRequestRecord,_27,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_2a,_29],["contextInfo","record"]));
}
}),new objj_method(sel_getUid("refreshRecords"),function(_2d,_2e){
with(_2d){
objj_msgSend(_2d,"refreshRecordsWithContextInfo:",nil);
}
}),new objj_method(sel_getUid("refreshRecordsWithContextInfo:"),function(_2f,_30,_31){
with(_2f){
var _32=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_2f,"URLForRecordsWithContextInfo:",_31)),_33=objj_msgSend(objj_msgSend(MMURLConnection,"alloc"),"initWithRequest:delegate:startImmediately:",_32,_2f,NO);
objj_msgSend(connections,"addObject:",_33);
objj_msgSend(contextInfoByConnection,"setObject:forKey:",_31,_33);
objj_msgSend(recordsByRefreshConnection,"setObject:forKey:",objj_msgSend(CPNull,"null"),_33);
objj_msgSend(_33,"start");
if(delegateRespondsTo_dataSource_didRequestRecordsWithContextInfo){
objj_msgSend(delegate,"dataSource:didRequestRecordsWithContextInfo:",_2f,_31);
}
objj_msgSend(notificationCenter,"postNotificationName:object:userInfo:",MMDataSourceDidRequestRecords,_2f,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_31,"contextInfo"));
}
}),new objj_method(sel_getUid("pollRecordsWithTimeInterval:"),function(_34,_35,_36){
with(_34){
objj_msgSend(_34,"pollRecordsWithTimeInterval:contextInfo:",_36,nil);
}
}),new objj_method(sel_getUid("pollRecordsWithTimeInterval:contextInfo:"),function(_37,_38,_39,_3a){
with(_37){
objj_msgSend(pollingTimer,"invalidate");
pollingContextInfo=_3a;
pollingTimeInterval=_39;
pollingTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_39,_37,sel_getUid("_pollingTimerDidFire:"),nil,NO);
}
}),new objj_method(sel_getUid("_pollingTimerDidFire:"),function(_3b,_3c,_3d){
with(_3b){
objj_msgSend(_3b,"refreshRecordsWithContextInfo:",pollingContextInfo);
}
}),new objj_method(sel_getUid("isPollingRecords"),function(_3e,_3f){
with(_3e){
return pollingTimeInterval!==nil;
}
}),new objj_method(sel_getUid("cancelPollingRecords"),function(_40,_41){
with(_40){
objj_msgSend(pollingTimer,"invalidate");
pollingTimer=pollingContextInfo=pollingTimeInterval=nil;
}
}),new objj_method(sel_getUid("deleteRecord:"),function(_42,_43,_44){
with(_42){
objj_msgSend(_42,"deleteRecord:contextInfo:",_44,nil);
}
}),new objj_method(sel_getUid("deleteRecord:contextInfo:"),function(_45,_46,_47,_48){
with(_45){
var _49=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_45,"URLForRecord:contextInfo:",_47,_48)),_4a=objj_msgSend(objj_msgSend(MMURLConnection,"alloc"),"initWithRequest:delegate:startImmediately:",_49,_45,NO);
objj_msgSend(connections,"addObject:",_4a);
objj_msgSend(_49,"setHTTPMethod:","DELETE");
objj_msgSend(contextInfoByConnection,"setObject:forKey:",_48,_4a);
objj_msgSend(recordsByDeleteConnection,"setObject:forKey:",_47,_4a);
objj_msgSend(_4a,"start");
}
}),new objj_method(sel_getUid("createRecord:"),function(_4b,_4c,_4d){
with(_4b){
objj_msgSend(_4b,"createRecord:contextInfo:",_4d,nil);
}
}),new objj_method(sel_getUid("createRecord:contextInfo:"),function(_4e,_4f,_50,_51){
with(_4e){
var _52=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_4e,"URLForNewRecord:contextInfo:",_50,_51)),_53=objj_msgSend(objj_msgSend(MMURLConnection,"alloc"),"initWithRequest:delegate:startImmediately:",_52,_4e,NO);
objj_msgSend(connections,"addObject:",_53);
objj_msgSend(_52,"setHTTPMethod:","POST");
objj_msgSend(_52,"setHTTPBody:",objj_msgSend(_4e,"HTTPBodyForNewRecord:contextInfo:",_50,_51));
objj_msgSend(recordsByCreateConnection,"setObject:forKey:",_50,_53);
objj_msgSend(contextInfoByConnection,"setObject:forKey:",_51,_53);
objj_msgSend(_53,"start");
}
}),new objj_method(sel_getUid("updateRecord:"),function(_54,_55,_56){
with(_54){
objj_msgSend(_54,"updateRecord:contextInfo:",_56,nil);
}
}),new objj_method(sel_getUid("updateRecord:contextInfo:"),function(_57,_58,_59,_5a){
with(_57){
objj_msgSend(_57,"updateRecord:contextInfo:URL:HTTPBody:",_59,_5a,objj_msgSend(_57,"URLForUpdatedRecord:contextInfo:",_59,_5a),objj_msgSend(_57,"HTTPBodyForUpdatedRecord:contextInfo:",_59,_5a));
}
}),new objj_method(sel_getUid("updateRecord:contextInfo:URL:HTTPBody:"),function(_5b,_5c,_5d,_5e,_5f,_60){
with(_5b){
objj_msgSend(_5b,"updateRecord:contextInfo:URL:HTTPMethod:HTTPBody:",_5d,_5e,_5f,"PUT",_60);
}
}),new objj_method(sel_getUid("updateRecord:contextInfo:URL:HTTPMethod:HTTPBody:"),function(_61,_62,_63,_64,_65,_66,_67){
with(_61){
var _68=objj_msgSend(CPURLRequest,"requestWithURL:",_65),_69=objj_msgSend(objj_msgSend(MMURLConnection,"alloc"),"initWithRequest:delegate:startImmediately:",_68,_61,NO);
objj_msgSend(_68,"setHTTPMethod:",_66);
objj_msgSend(_68,"setHTTPBody:",_67);
objj_msgSend(recordsByUpdateConnection,"setObject:forKey:",_63,_69);
objj_msgSend(contextInfoByConnection,"setObject:forKey:",_64,_69);
objj_msgSend(_69,"start");
}
}),new objj_method(sel_getUid("cancelAllRequests"),function(_6a,_6b){
with(_6a){
objj_msgSend(connections,"makeObjectsPerformSelector:",sel_getUid("cancel"));
objj_msgSend(connections,"removeAllObjects");
objj_msgSend(recordsByRefreshConnection,"removeAllObjects");
objj_msgSend(recordsByUpdateConnection,"removeAllObjects");
objj_msgSend(recordsByCreateConnection,"removeAllObjects");
objj_msgSend(recordsByDeleteConnection,"removeAllObjects");
objj_msgSend(contextInfoByConnection,"removeAllObjects");
objj_msgSend(statusCodeByConnection,"removeAllObjects");
objj_msgSend(_6a,"cancelPollingRecords");
}
}),new objj_method(sel_getUid("URLForRecordsWithContextInfo:"),function(_6c,_6d,_6e){
with(_6c){
objj_msgSend(CPException,"raise:reason:",MMDataSourceImplementationIncomplete,objj_msgSend(CPString,"stringWithFormat:","%@ does not implement URLForRecordsWithContextInfo:",objj_msgSend(_6c,"class")));
}
}),new objj_method(sel_getUid("URLForRecord:contextInfo:"),function(_6f,_70,_71,_72){
with(_6f){
objj_msgSend(CPException,"raise:reason:",MMDataSourceImplementationIncomplete,objj_msgSend(CPString,"stringWithFormat:","%@ does not implement URLForRecord:contextInfo:",objj_msgSend(_6f,"class")));
}
}),new objj_method(sel_getUid("URLForNewRecord:contextInfo:"),function(_73,_74,_75,_76){
with(_73){
objj_msgSend(CPException,"raise:reason:",MMDataSourceImplementationIncomplete,objj_msgSend(CPString,"stringWithFormat:","%@ does not implement URLForNewRecord:contextInfo:",objj_msgSend(_73,"class")));
}
}),new objj_method(sel_getUid("URLForUpdatedRecord:contextInfo:"),function(_77,_78,_79,_7a){
with(_77){
objj_msgSend(CPException,"raise:reason:",MMDataSourceImplementationIncomplete,objj_msgSend(CPString,"stringWithFormat:","%@ does not implement URLForUpdatedRecord:contextInfo:",objj_msgSend(_77,"class")));
}
}),new objj_method(sel_getUid("HTTPBodyForNewRecord:contextInfo:"),function(_7b,_7c,_7d,_7e){
with(_7b){
objj_msgSend(CPException,"raise:reason:",MMDataSourceImplementationIncomplete,objj_msgSend(CPString,"stringWithFormat:","%@ does not implement HTTPBodyForNewRecord:contextInfo:",objj_msgSend(_7b,"class")));
}
}),new objj_method(sel_getUid("HTTPBodyForUpdatedRecord:contextInfo:"),function(_7f,_80,_81,_82){
with(_7f){
objj_msgSend(CPException,"raise:reason:",MMDataSourceImplementationIncomplete,objj_msgSend(CPString,"stringWithFormat:","%@ does not implement HTTPBodyForUpdatedRecord:contextInfo:",objj_msgSend(_7f,"class")));
}
}),new objj_method(sel_getUid("didReceiveRecords:connection:contextInfo:"),function(_83,_84,_85,_86,_87){
with(_83){
if(delegateRespondsTo_dataSource_didReceiveRecords_contextInfo){
objj_msgSend(delegate,"dataSource:didReceiveRecords:contextInfo:",_83,_85,_87);
}
objj_msgSend(arrayControllers,"setValue:forKey:",_85,"content");
objj_msgSend(notificationCenter,"postNotificationName:object:userInfo:",MMDataSourceDidReceiveRecords,_83,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_87,_85],["contextInfo","records"]));
}
}),new objj_method(sel_getUid("didReceiveRecordsAsData:connection:contextInfo:"),function(_88,_89,_8a,_8b,_8c){
with(_88){
CPLog.trace("-[%@ %@] START",objj_msgSend(_88,"class"),_89);
var _8d=objj_msgSend(_88,"respondsToSelector:",sel_getUid("shouldProcessNode:contextInfo:")),_8e=objj_msgSend(_88,"respondsToSelector:",sel_getUid("shouldSelectRecord:element:contextInfo:")),_8f=objj_msgSend(_88,"respondsToSelector:",sel_getUid("updateRecord:fromElement:contextInfo:"));
var _90=objj_msgSend(CPMutableArray,"array"),_91=objj_msgSend(recordsByRefreshConnection,"objectForKey:",_8b),_92=objj_msgSend(_8b,"responseXML").documentElement,_93=_92&&_92.childNodes||[],_94=objj_msgSend(CPMutableArray,"array"),_95=objj_msgSend(CPMutableIndexSet,"indexSet"),_96=objj_msgSend(CPMutableArray,"array");
if(objj_msgSend(objj_msgSend(CPNull,"null"),"isEqual:",_91)){
_91=nil;
}
if(objj_msgSend(_88,"shouldProcessRootElement:contextInfo:",_92,_8c)){
_93=[_92].concat(_93);
}
var i=0,_97=_93.length;
var _98=function(){
var i0=i,_99=new Date().getTime();
while(i<_97){
var _9a=_93[i];
if(_9a.nodeType==1&&(!_8d||objj_msgSend(_88,"shouldProcessNode:contextInfo:",_9a,_8c))){
if(_91){
if(_8f){
objj_msgSend(_91,"stopTrackingChangesInBlock:",function(){
objj_msgSend(_88,"updateRecord:fromElement:contextInfo:",_91,_9a,_8c);
});
}
objj_msgSend(_90,"addObject:",_91);
objj_msgSend(_96,"addObject:",_91);
}else{
var _9b;
_9b=objj_msgSend(_88,"recordsFromElement:contextInfo:",_9a,_8c);
if(_8f){
objj_msgSend(_9b,"enumerateObjectsUsingBlock:",function(_9c){
objj_msgSend(_9c,"stopTrackingChangesInBlock:",function(){
objj_msgSend(_88,"updateRecord:fromElement:contextInfo:",_9c,_9a,_8c);
});
});
}
_90=_90.concat(_9b);
objj_msgSend(_96,"addObject:",_9b);
}
objj_msgSend(_94,"addObject:",_9a);
}
i++;
if(i<_97){
if(new Date().getTime()-_99>_1){
setTimeout(_98,0);
break;
}
}else{
_9d();
}
}
};
var _9d=function(){
objj_msgSend(_90,"enumerateObjectsUsingBlock:",function(_9e){
if(objj_msgSend(_9e,"respondsToSelector:",sel_getUid("acceptChangedAttributes"))){
objj_msgSend(_9e,"acceptChangedAttributes");
}
});
if(_8e){
var _9f=0;
objj_msgSend(_94,"enumerateObjectsUsingBlock:",function(_a0,i){
objj_msgSend(objj_msgSend(_96,"objectAtIndex:",i),"enumerateObjectsUsingBlock:",function(_a1){
if(objj_msgSend(_88,"shouldSelectRecord:element:contextInfo:",_a1,_a0,_8c)){
objj_msgSend(_95,"addIndex:",_9f);
}
_9f++;
});
});
}
objj_msgSend(_88,"didReceiveRecords:connection:contextInfo:",_90,_8b,_8c);
if(_8e){
objj_msgSend(_88,"setSelectionIndexes:",_95);
}
if(pollingTimeInterval){
objj_msgSend(_88,"pollRecordsWithTimeInterval:contextInfo:",pollingTimeInterval,pollingContextInfo);
}
CPLog.trace("-[%@ %@] END",objj_msgSend(_88,"class"),_89);
};
_98();
}
}),new objj_method(sel_getUid("shouldProcessRootElement:contextInfo:"),function(_a2,_a3,_a4,_a5){
with(_a2){
return NO;
}
}),new objj_method(sel_getUid("recordsFromElement:contextInfo:"),function(_a6,_a7,_a8,_a9){
with(_a6){
return objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(_a6,"recordFromElement:contextInfo:",_a8,_a9));
}
}),new objj_method(sel_getUid("didFailToReceiveRecordsWithError:contextInfo:"),function(_aa,_ab,_ac,_ad){
with(_aa){
CPLog.trace("[%@ -didFailToReceiveRecordsWithError:contextInfo:] START",objj_msgSend(_aa,"class"));
if(delegateRespondsTo_dataSource_didFailToReceiveRecords_withError_contextInfo){
objj_msgSend(delegate,"dataSource:didFailToReceiveRecordsWithError:contextInfo:",_aa,_ac,_ad);
}
objj_msgSend(notificationCenter,"postNotificationName:object:userInfo:",MMDataSourceDidFailToReceiveRecords,_aa,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_ad,"contextInfo"));
if(pollingTimeInterval){
objj_msgSend(_aa,"pollRecordsWithTimeInterval:contextInfo:",pollingTimeInterval,pollingContextInfo);
}
CPLog.trace("[%@ -didFailToReceiveRecordsWithError:contextInfo:] END",objj_msgSend(_aa,"class"));
}
}),new objj_method(sel_getUid("didDeleteRecord:contextInfo:"),function(_ae,_af,_b0,_b1){
with(_ae){
if(delegateRespondsTo_dataSource_didDeleteRecord_contextInfo){
objj_msgSend(delegate,"dataSource:didDeleteRecord:contextInfo:",_ae,_b0,_b1);
}
objj_msgSend(notificationCenter,"postNotificationName:object:userInfo:",MMDataSourceDidDeleteRecord,_ae,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_b1,_b0],["contextInfo","record"]));
}
}),new objj_method(sel_getUid("didFailToDeleteRecord:withError:contextInfo:"),function(_b2,_b3,_b4,_b5,_b6){
with(_b2){
CPLog.trace("[%@ -didFailToDeleteRecord:withError:contextInfo:] START",objj_msgSend(_b2,"class"));
if(delegateRespondsTo_dataSource_didFailToDeleteRecord_withError_contextInfo){
objj_msgSend(delegate,"dataSource:didFailToDeleteRecord:withError:contextInfo:",_b2,_b4,_b5,_b6);
}
objj_msgSend(notificationCenter,"postNotificationName:object:userInfo:",MMDataSourceDidFailToDeleteRecord,_b2,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_b6,_b4,_b5],["contextInfo","record","error"]));
CPLog.trace("[%@ -didFailToDeleteRecord:withError:contextInfo:] END",objj_msgSend(_b2,"class"));
}
}),new objj_method(sel_getUid("didUpdateRecord:contextInfo:"),function(_b7,_b8,_b9,_ba){
with(_b7){
var _bb=objj_msgSend(_b9,"respondsToSelector:",sel_getUid("changedAttributeKeys"))?objj_msgSend(_b9,"changedAttributeKeys"):objj_msgSend(CPSet,"set");
if(objj_msgSend(_b9,"respondsToSelector:",sel_getUid("acceptChangedAttributes"))){
objj_msgSend(_b9,"acceptChangedAttributes");
}
if(delegateRespondsTo_dataSource_didUpdateRecord_contextInfo){
objj_msgSend(delegate,"dataSource:didUpdateRecord:contextInfo:",_b7,_b9,_ba);
}
objj_msgSend(notificationCenter,"postNotificationName:object:userInfo:",MMDataSourceDidUpdateRecord,_b7,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_ba,_b9,_bb],["contextInfo","record","changes"]));
}
}),new objj_method(sel_getUid("didFailToUpdateRecord:withError:contextInfo:"),function(_bc,_bd,_be,_bf,_c0){
with(_bc){
CPLog.trace("[%@ -didFailToUpdateRecord:withError:contextInfo:] START",objj_msgSend(_bc,"class"));
if(delegateRespondsTo_dataSource_didFailToUpdateRecord_withError_contextInfo){
objj_msgSend(delegate,"dataSource:didFailToUpdateRecord:withError:contextInfo:",_bc,_be,_bf,_c0);
}
objj_msgSend(notificationCenter,"postNotificationName:object:userInfo:",MMDataSourceDidFailToUpdateRecord,_bc,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_c0,_be,_bf],["contextInfo","record","error"]));
CPLog.trace("[%@ -didFailToUpdateRecord:withError:contextInfo:] END",objj_msgSend(_bc,"class"));
}
}),new objj_method(sel_getUid("didCreateRecord:contextInfo:"),function(_c1,_c2,_c3,_c4){
with(_c1){
if(objj_msgSend(_c3,"isKindOfClass:",objj_msgSend(MMRecord,"class"))){
objj_msgSend(dataStore,"storeRecord:",_c3);
objj_msgSend(_c3,"acceptChangedAttributes");
}
if(delegateRespondsTo_dataSource_didCreateRecord_contextInfo){
objj_msgSend(delegate,"dataSource:didCreateRecord:contextInfo:",_c1,_c3,_c4);
}
objj_msgSend(notificationCenter,"postNotificationName:object:userInfo:",MMDataSourceDidCreateRecord,_c1,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_c4,_c3],["contextInfo","record"]));
}
}),new objj_method(sel_getUid("didFailToCreateRecord:withError:contextInfo:"),function(_c5,_c6,_c7,_c8,_c9){
with(_c5){
CPLog.trace("[%@ -didFailToCreateRecord:withError:contextInfo:] START",objj_msgSend(_c5,"class"));
if(delegateRespondsTo_dataSource_didFailToCreateRecord_withError_contextInfo){
objj_msgSend(delegate,"dataSource:didFailToCreateRecord:withError:contextInfo:",_c5,_c7,_c8,_c9);
}
objj_msgSend(notificationCenter,"postNotificationName:object:userInfo:",MMDataSourceDidFailToCreateRecord,_c5,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_c9,_c7,_c8],["contextInfo","record","error"]));
CPLog.trace("[%@ -didFailToCreateRecord:withError:contextInfo:] END",objj_msgSend(_c5,"class"));
}
}),new objj_method(sel_getUid("connection:didReceiveResponse:"),function(_ca,_cb,_cc,_cd){
with(_ca){
var _ce=objj_msgSend(_cd,"respondsToSelector:",sel_getUid("statusCode"))&&objj_msgSend(_cd,"statusCode");
CPLog.trace("[%@ -connection:didReceiveResponse:] START (statusCode=%@)",objj_msgSend(_ca,"class"),_ce);
objj_msgSend(statusCodeByConnection,"setObject:forKey:",_ce,_cc);
objj_msgSend(connections,"removeObject:",_cc);
CPLog.trace("[%@ -connection:didReceiveResponse:] END",objj_msgSend(_ca,"class"));
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_cf,_d0,_d1,_d2){
with(_cf){
CPLog.trace("[%@ -%@] START (data=%@)",objj_msgSend(_cf,"class"),_d0,_d2);
var _d3=objj_msgSend(statusCodeByConnection,"objectForKey:",_d1),_d4=objj_msgSend(contextInfoByConnection,"objectForKey:",_d1);
if(!_d3||_d3>=400){
objj_msgSend(_cf,"connection:didFailWithError:",_d1,_d2);
}else{
if(objj_msgSend(recordsByRefreshConnection,"containsKey:",_d1)){
objj_msgSend(_cf,"didReceiveRecordsAsData:connection:contextInfo:",_d2,_d1,_d4);
}else{
if(objj_msgSend(recordsByDeleteConnection,"containsKey:",_d1)){
var _d5=objj_msgSend(recordsByDeleteConnection,"objectForKey:",_d1);
objj_msgSend(_cf,"didDeleteRecord:contextInfo:",_d5,_d4);
}else{
if(objj_msgSend(recordsByCreateConnection,"containsKey:",_d1)){
var _d5=objj_msgSend(recordsByCreateConnection,"objectForKey:",_d1);
objj_msgSend(_cf,"didCreateRecord:contextInfo:",_d5,_d4);
}else{
if(objj_msgSend(recordsByUpdateConnection,"containsKey:",_d1)){
var _d5=objj_msgSend(recordsByUpdateConnection,"objectForKey:",_d1);
objj_msgSend(_cf,"didUpdateRecord:contextInfo:",_d5,_d4);
}else{
CPLog.warn("[%@ -] got message for unknown connection: %@ data: %@",objj_msgSend(_cf,"class"),_d0,_d1,_d2);
}
}
}
}
}
objj_msgSend(recordsByRefreshConnection,"removeObjectForKey:",_d1);
objj_msgSend(recordsByDeleteConnection,"removeObjectForKey:",_d1);
objj_msgSend(recordsByCreateConnection,"removeObjectForKey:",_d1);
objj_msgSend(recordsByUpdateConnection,"removeObjectForKey:",_d1);
objj_msgSend(contextInfoByConnection,"removeObjectForKey:",_d1);
objj_msgSend(statusCodeByConnection,"removeObjectForKey:",_d1);
CPLog.trace("[%@ -connection:didReceiveData:] END",objj_msgSend(_cf,"class"));
}
}),new objj_method(sel_getUid("connection:didFailWithError:"),function(_d6,_d7,_d8,_d9){
with(_d6){
CPLog.trace("[%@ -connection:didFailWithError:] START (error=%@)",objj_msgSend(_d6,"class"),_d9);
if(objj_msgSend(recordsByRefreshConnection,"containsKey:",_d8)){
objj_msgSend(recordsByRefreshConnection,"removeObjectForKey:",_d8);
objj_msgSend(_d6,"didFailToReceiveRecordsWithError:contextInfo:",_d9,objj_msgSend(contextInfoByConnection,"objectForKey:",_d8));
}else{
if(objj_msgSend(recordsByDeleteConnection,"containsKey:",_d8)){
var _da=objj_msgSend(recordsByDeleteConnection,"objectForKey:",_d8);
objj_msgSend(recordsByDeleteConnection,"removeObjectForKey:",_d8);
objj_msgSend(_d6,"didFailToDeleteRecord:withError:contextInfo:",_da,_d9,objj_msgSend(contextInfoByConnection,"objectForKey:",_d8));
}else{
if(objj_msgSend(recordsByCreateConnection,"containsKey:",_d8)){
var _da=objj_msgSend(recordsByCreateConnection,"objectForKey:",_d8);
objj_msgSend(recordsByCreateConnection,"removeObjectForKey:",_d8);
objj_msgSend(_d6,"didFailToCreateRecord:withError:contextInfo:",_da,_d9,objj_msgSend(contextInfoByConnection,"objectForKey:",_d8));
}else{
if(objj_msgSend(recordsByUpdateConnection,"containsKey:",_d8)){
var _da=objj_msgSend(recordsByUpdateConnection,"objectForKey:",_d8);
objj_msgSend(recordsByUpdateConnection,"removeObjectForKey:",_d8);
objj_msgSend(_d6,"didFailToUpdateRecord:withError:contextInfo:",_da,_d9,objj_msgSend(contextInfoByConnection,"objectForKey:",_d8));
}
}
}
}
CPLog.trace("[%@ -connection:didFailWithError:] END",objj_msgSend(_d6,"class"));
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedDataSource"),function(_db,_dc){
with(_db){
var _dd=objj_msgSend(_2,"objectForKey:",CPStringFromClass(_db));
if(!_dd){
_dd=objj_msgSend(objj_msgSend(_db,"alloc"),"init");
objj_msgSend(_2,"setObject:forKey:",_dd,CPStringFromClass(_db));
}
return _dd;
}
})]);
p;24;CPObject+XMLAttributes.jt;1124;@STATIC;1.0;t;1105;
var _1=objj_getClass("CPObject");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPObject\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("setValuesForNodeAttributes:ignoreUndefinedKeys:"),function(_3,_4,_5,_6){
with(_3){
var _7=objj_msgSend(_3,"class"),_8=_5.attributes;
for(var i=_8.length;i--;){
var _9=_8[i],_a=String(_9.nodeName).replace(/[-_]([a-z])/ig,function(_b,_c){
return _c.toUpperCase();
}),_d=String(_9.nodeValue);
objj_msgSend(_3,"setValue:forKey:ignoreUndefinedKey:",_d,_a,_6);
}
}
}),new objj_method(sel_getUid("setValue:forKey:ignoreUndefinedKey:"),function(_e,_f,_10,_11,_12){
with(_e){
if(!_12){
objj_msgSend(_e,"setValue:forKey:",_10,_11);
}else{
try{
objj_msgSend(_e,"setValue:forKey:",_10,_11);
}
catch(e){
if(!e.isa||!objj_msgSend(e,"isKindOfClass:",objj_msgSend(CPException,"class"))||objj_msgSend(e,"name")!=CPUndefinedKeyException||objj_msgSend(objj_msgSend(e,"userInfo"),"objectForKey:",CPTargetObjectUserInfoKey)!=_e||objj_msgSend(objj_msgSend(e,"userInfo"),"objectForKey:",CPUnknownUserInfoKey)!=_11){
throw e;
}
}
}
}
})]);
p;23;Models/MMMetadataItem.jt;1576;@STATIC;1.0;i;15;PMCBaseObject.ji;9;MMAgent.jt;1524;
objj_executeFile("PMCBaseObject.j",YES);
objj_executeFile("MMAgent.j",YES);
var _1=objj_allocateClassPair(PMCBaseObject,"MMMetadataItem"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("mediaItems")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("mediaItems"),function(_3,_4){
with(_3){
return mediaItems;
}
}),new objj_method(sel_getUid("setMediaItems:"),function(_5,_6,_7){
with(_5){
mediaItems=_7;
}
}),new objj_method(sel_getUid("init"),function(_8,_9){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("MMMetadataItem").super_class},"init")){
mediaItems=objj_msgSend(CPSet,"set");
}
return _8;
}
}),new objj_method(sel_getUid("mainMediaItem"),function(_a,_b){
with(_a){
return objj_msgSend(mediaItems,"anyObject");
}
}),new objj_method(sel_getUid("addMediaItem:"),function(_c,_d,_e){
with(_c){
objj_msgSend(_c,"willChangeValueForKey:","mediaItems");
objj_msgSend(mediaItems,"addObject:",_e);
objj_msgSend(_e,"setMetadataItem:",_c);
objj_msgSend(_c,"didChangeValueForKey:","mediaItems");
}
}),new objj_method(sel_getUid("removeMediaItem:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"willChangeValueForKey:","mediaItems");
objj_msgSend(mediaItems,"removeObject:",_11);
objj_msgSend(_11,"setMetadataItem:",nil);
objj_msgSend(_f,"didChangeValueForKey:","mediaItems");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("keyPathsForValuesAffectingMainMediaItem"),function(_12,_13){
with(_12){
return objj_msgSend(CPSet,"setWithObject:","mediaItems");
}
})]);
p;41;DataSources/MMLibraryTimelineDataSource.jt;5357;@STATIC;1.0;I;19;Foundation/CPDate.jI;20;Foundation/CPTimer.ji;26;MMLibraryMediaDataSource.ji;28;../Models/MMLibrarySection.ji;26;../Models/MMMetadataItem.ji;30;../Models/PMCDirectoryObject.jt;5159;
objj_executeFile("Foundation/CPDate.j",NO);
objj_executeFile("Foundation/CPTimer.j",NO);
objj_executeFile("MMLibraryMediaDataSource.j",YES);
objj_executeFile("../Models/MMLibrarySection.j",YES);
objj_executeFile("../Models/MMMetadataItem.j",YES);
objj_executeFile("../Models/PMCDirectoryObject.j",YES);
MMLibrarySectionContextInfoKey="MMLibrarySectionContextInfoKey";
MMSinceContextInfoKey="MMSinceContextInfoKey";
var _1=4;
var _2=objj_allocateClassPair(MMLibraryMediaDataSource,"MMLibraryTimelineDataSource"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_librarySection"),new objj_ivar("_latestEntryTime"),new objj_ivar("_refreshTimer")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("watchTimelineForLibrarySection:"),function(_4,_5,_6){
with(_4){
objj_msgSend(_refreshTimer,"invalidate");
_librarySection=_6;
_latestEntryTime=-1800;
objj_msgSend(_4,"_scheduleTimer");
}
}),new objj_method(sel_getUid("_scheduleTimer"),function(_7,_8){
with(_7){
_refreshTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_1,_7,sel_getUid("loadTimelineSinceLastLoad"),nil,NO);
}
}),new objj_method(sel_getUid("stopWatchingTimeline"),function(_9,_a){
with(_9){
objj_msgSend(_refreshTimer,"invalidate");
}
}),new objj_method(sel_getUid("isWatchingTimeline"),function(_b,_c){
with(_b){
return !!_refreshTimer;
}
}),new objj_method(sel_getUid("loadTimelineSinceLastLoad"),function(_d,_e){
with(_d){
objj_msgSend(_d,"loadTimelineForLibrarySection:since:",_librarySection,_latestEntryTime);
}
}),new objj_method(sel_getUid("loadTimelineForLibrarySection:since:"),function(_f,_10,_11,_12){
with(_f){
objj_msgSend(_f,"refreshRecordsWithContextInfo:",objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_11,_12],[MMLibrarySectionContextInfoKey,MMSinceContextInfoKey]));
}
}),new objj_method(sel_getUid("URLForRecordsWithContextInfo:"),function(_13,_14,_15){
with(_13){
var _16=objj_msgSend(_15,"objectForKey:",MMLibrarySectionContextInfoKey),_17=objj_msgSend(_15,"objectForKey:",MMSinceContextInfoKey);
return objj_msgSend(PMSURL,"URLWithPath:params:",objj_msgSend(CPString,"stringWithFormat:","%@/timeline",objj_msgSend(objj_msgSend(_16,"URL"),"path")),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_17,"isKindOfClass:",CPDate)?FLOOR(objj_msgSend(_17,"timeIntervalSince1970")):_17,"start"));
}
}),new objj_method(sel_getUid("didReceiveRecordsAsData:connection:contextInfo:"),function(_18,_19,_1a,_1b,_1c){
with(_18){
var _1d=objj_msgSend(_1b,"responseXML"),_1e=_1d.documentElement,_1f=objj_msgSend(_1c,"isKindOfClass:",MMLibrarySection)?_1c:objj_msgSend(_1c,"objectForKey:",MMLibrarySectionContextInfoKey);
_latestEntryTime=objj_msgSend(CPDate,"dateWithTimeIntervalSince1970:",Number(_1e.getAttribute("latestEntryTime")));
objj_msgSend(_1f,"setValuesForNodeAttributes:ignoreUndefinedKeys:",_1e,YES);
objj_msgSendSuper({receiver:_18,super_class:objj_getClass("MMLibraryTimelineDataSource").super_class},"didReceiveRecordsAsData:connection:contextInfo:",_1a,_1b,_1f);
}
}),new objj_method(sel_getUid("shouldProcessNode:contextInfo:"),function(_20,_21,_22,_23){
with(_20){
if(!objj_msgSendSuper({receiver:_20,super_class:objj_getClass("MMLibraryTimelineDataSource").super_class},"shouldProcessNode:contextInfo:",_22,_23)){
return NO;
}
var id=objj_msgSend(PMCBaseObject,"idFromKey:",String(_22.getAttribute("key")));
var _24=objj_msgSend(String(_22.nodeName),"isEqualToString:","Directory")?objj_msgSend(PMCDirectoryObject,"class"):objj_msgSend(MMMetadataItem,"class");
switch(Number(_22.getAttribute("state"))){
case PMCBaseObjectStateCreated:
return !objj_msgSend(objj_msgSend(_20,"dataStore"),"hasRecordWithClass:id:",_24,id);
case PMCBaseObjectStateDeleted:
return objj_msgSend(objj_msgSend(objj_msgSend(_20,"dataStore"),"recordWithClass:id:",_24,id),"state")!=PMCBaseObjectStateDeleted;
}
return YES;
}
}),new objj_method(sel_getUid("didReceiveRecords:connection:contextInfo:"),function(_25,_26,_27,_28,_29){
with(_25){
var _2a=objj_msgSend(_29,"isKindOfClass:",MMLibrarySection)?_29:objj_msgSend(_29,"objectForKey:",MMLibrarySectionContextInfoKey);
objj_msgSendSuper({receiver:_25,super_class:objj_getClass("MMLibraryTimelineDataSource").super_class},"didReceiveRecords:connection:contextInfo:",_27,_28,_2a);
for(var i=0;i<objj_msgSend(_27,"count");i++){
var _2b=objj_msgSend(_27,"objectAtIndex:",i),_2c=objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_29,_2b,[_2b]],["contextInfo","record","records"]),_2d=nil;
CPLog.debug("%@ changed to %d (%@)",objj_msgSend(_2b,"title")||"(no title)",objj_msgSend(_2b,"state"),objj_msgSend(_2b,"stateString"));
switch(objj_msgSend(_2b,"state")){
case PMCBaseObjectStateDeleted:
_2d=MMDataSourceDidDeleteRecord;
objj_msgSend(_2b,"recordWasDeleted");
break;
case PMCBaseObjectStateCreated:
_2d=MMDataSourceDidCreateRecord;
objj_msgSend(_2b,"recordWasCreated");
break;
default:
_2d=MMDataSourceDidReceiveRecords;
objj_msgSend(_2b,"recordWasUpdated");
break;
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",_2d,_25,_2c);
}
objj_msgSend(_25,"_scheduleTimer");
}
})]);
p;36;Views/MMMetadataItemCollectionView.jt;3309;@STATIC;1.0;i;18;MMCollectionView.ji;28;../Models/MMLibrarySection.jt;3234;
objj_executeFile("MMCollectionView.j",YES);
objj_executeFile("../Models/MMLibrarySection.j",YES);
var _1=objj_allocateClassPair(MMCollectionView,"MMMetadataItemCollectionView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_updateTimer")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("insertObject:inArraySortedByDescriptors:"),function(_3,_4,_5,_6){
with(_3){
objj_msgSend(_3,"willChangeValueForKey:","content");
objj_msgSend(_3,"_insertItem:atIndex:",objj_msgSend(_3,"_detachedItemForObject:",_5),objj_msgSend(objj_msgSend(_3,"content"),"insertObject:inArraySortedByDescriptors:",_5,_6));
objj_msgSend(_3,"tileAfterDelay");
objj_msgSend(_3,"didChangeValueForKey:","content");
}
}),new objj_method(sel_getUid("insertObject:atIndex:"),function(_7,_8,_9,_a){
with(_7){
objj_msgSend(_7,"willChangeValueForKey:","content");
objj_msgSend(_7,"_insertItem:atIndex:",objj_msgSend(_7,"_detachedItemForObject:",_9),_a);
objj_msgSend(objj_msgSend(_7,"content"),"insertObject:atIndex:",_9,_a);
objj_msgSend(_7,"tileAfterDelay");
objj_msgSend(_7,"didChangeValueForKey:","content");
}
}),new objj_method(sel_getUid("removeObject:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(_b,"content"),_f=objj_msgSend(_e,"indexOfObject:",_d);
if(_f==CPNotFound){
return;
}
var _10=objj_msgSend(_b,"items"),_11=_10[_f];
objj_msgSend(_b,"willChangeValueForKey:","content");
objj_msgSend(objj_msgSend(_11,"view"),"removeFromSuperview");
objj_msgSend(_11,"setSelected:",NO);
_cachedItems.push(_11);
objj_msgSend(_e,"removeObjectAtIndex:",_f);
objj_msgSend(_10,"removeObjectAtIndex:",_f);
objj_msgSend(_b,"tileAfterDelay");
objj_msgSend(_b,"didChangeValueForKey:","content");
}
}),new objj_method(sel_getUid("_detachedItemForObject:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(_12,"items"),_16=objj_msgSend(_12,"content"),_17=objj_msgSend(_16,"indexOfObject:",_14);
if(_17==CPNotFound){
return objj_msgSend(_12,"newItemForRepresentedObject:",_14);
}
var _18=_15[_17];
objj_msgSend(_15,"removeObjectAtIndex:",_17);
objj_msgSend(_16,"removeObjectAtIndex:",_17);
return _18;
}
}),new objj_method(sel_getUid("_insertItem:atIndex:"),function(_19,_1a,_1b,_1c){
with(_19){
objj_msgSend(objj_msgSend(_19,"items"),"insertObject:atIndex:",_1b,_1c);
objj_msgSend(_19,"addSubview:",objj_msgSend(_1b,"view"));
if(objj_msgSend(_19,"isItemAtIndexVisible:",_1c)){
objj_msgSend(_19,"notifySubview:visibilityDidChange:",objj_msgSend(_1b,"view"),YES);
}
}
}),new objj_method(sel_getUid("tileAfterDelay"),function(_1d,_1e){
with(_1d){
objj_msgSend(_updateTimer,"invalidate");
_updateTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.1,_1d,sel_getUid("tile"),nil,NO);
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_1f,_20,_21){
with(_1f){
if(objj_msgSend(_21,"_triggersKeyEquivalent:withModifierMask:","i",(CPCommandKeyMask|CPControlKeyMask))){
if(objj_msgSend(_selectionIndexes,"count")!=0){
objj_msgSend(objj_msgSend(_items[objj_msgSend(_selectionIndexes,"firstIndex")],"view"),"_editMetadata:",_1f);
}
return YES;
}
return objj_msgSendSuper({receiver:_1f,super_class:objj_getClass("MMMetadataItemCollectionView").super_class},"performKeyEquivalent:",_21);
}
})]);
p;24;Views/MMCollectionView.jt;3653;@STATIC;1.0;I;23;Foundation/CPIndexSet.jI;21;AppKit/CPScrollView.jt;3580;
objj_executeFile("Foundation/CPIndexSet.j",NO);
objj_executeFile("AppKit/CPScrollView.j",NO);
var _1=objj_allocateClassPair(CPCollectionView,"MMCollectionView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_visibleRange")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("clipView:didScrollToPoint:"),function(_3,_4,_5,_6){
with(_3){
objj_msgSend(_3,"notifySubviewsOfVisibility");
}
}),new objj_method(sel_getUid("tile"),function(_7,_8){
with(_7){
CPLog.trace("[%@ tile] START",objj_msgSend(_7,"class"));
objj_msgSendSuper({receiver:_7,super_class:objj_getClass("MMCollectionView").super_class},"tile");
objj_msgSend(_7,"notifySubviewsOfVisibility");
CPLog.trace("[%@ tile] END",objj_msgSend(_7,"class"));
}
}),new objj_method(sel_getUid("setSelectionIndexes:"),function(_9,_a,_b){
with(_9){
objj_msgSendSuper({receiver:_9,super_class:objj_getClass("MMCollectionView").super_class},"setSelectionIndexes:",_b);
objj_msgSend(_9,"_scrollToSelection");
}
}),new objj_method(sel_getUid("notifySubviewsOfVisibility"),function(_c,_d){
with(_c){
if(objj_msgSend(_content,"count")==0){
return;
}
var _e=objj_msgSend(_c,"visibleRect"),_f=objj_msgSend(_c,"indexOfItemAtPoint:",_e.origin),_10=objj_msgSend(_c,"indexOfItemAtPoint:",CGPointMake(CGRectGetMaxX(_e),CGRectGetMaxY(_e))),_11=objj_msgSend(_content,"count")-1;
if(_10==CPNotFound){
_10=_11;
}
var _12=_10-_f+1;
_10=MIN(_10+_numberOfColumns,_10+_12,_11);
var _13=CPMakeRange(_f,_10-_f);
CPLog.debug("[%@ notifySubviewsOfVisibility] newVisibleRange=%@]",objj_msgSend(_c,"class"),CPStringFromRange(_13));
if(CPEqualRanges(_13,_visibleRange)){
return;
}
var _14=CPIntersectionRange(_13,_visibleRange);
for(var i=_f;i<=_10;i++){
if(!CPLocationInRange(i,_14)){
objj_msgSend(_c,"notifySubview:visibilityDidChange:",objj_msgSend(_items[i],"view"),YES);
}
}
for(var i=_visibleRange.location,max=CPMaxRange(_visibleRange);i<=max;i++){
if(!CPLocationInRange(i,_14)){
objj_msgSend(_c,"notifySubview:visibilityDidChange:",objj_msgSend(_items[i],"view"),NO);
}
}
_visibleRange=_13;
}
}),new objj_method(sel_getUid("isItemAtIndexVisible:"),function(_15,_16,_17){
with(_15){
return CPLocationInRange(_17,_visibleRange);
}
}),new objj_method(sel_getUid("reloadContent"),function(_18,_19){
with(_18){
_visibleRange=CPMakeRange(CPNotFound,0);
objj_msgSendSuper({receiver:_18,super_class:objj_getClass("MMCollectionView").super_class},"reloadContent");
}
}),new objj_method(sel_getUid("notifySubview:visibilityDidChange:"),function(_1a,_1b,_1c,_1d){
with(_1a){
CPLog.trace("[%@ notifySubview:visibilityDidChange:] visibility of subview %@ changed to %@",objj_msgSend(_1a,"class"),_1c,_1d);
if(objj_msgSend(_1c,"respondsToSelector:",sel_getUid("visibilityDidChange:"))){
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("visibilityDidChange:"),_1c,_1d,0,[CPDefaultRunLoopMode]);
}
}
}),new objj_method(sel_getUid("indexOfItemAtPoint:"),function(_1e,_1f,_20){
with(_1e){
var row=FLOOR(_20.y/(_itemSize.height+_verticalMargin)),_21=FLOOR(_20.x/(_itemSize.width+_horizontalMargin)),_22=row*_numberOfColumns+_21;
return (_22>=objj_msgSend(_content,"count"))?CPNotFound:_22;
}
}),new objj_method(sel_getUid("sizeToFitNumberOfColumns:withHorizontalMargin:"),function(_23,_24,_25,_26){
with(_23){
_25=MAX(_25,1);
var _27=(_25*_itemSize.width)+((_25+1)*_26),_28=MAX(CEIL(_items.length/_25),1),_29=(_28*_itemSize.height)+((_28+1)*objj_msgSend(_23,"verticalMargin"));
objj_msgSend(_23,"setFrameSize:",CGSizeMake(_27,_29));
objj_msgSend(_23,"_scrollToSelection");
}
})]);
p;26;Views/MMMetadataItemCell.jt;15303;@STATIC;1.0;i;40;../Controllers/MMMatchPickerController.ji;34;../DataSources/MMAgentDataSource.ji;41;../DataSources/MMMediaMatchesDataSource.ji;41;../DataSources/MMMetadataItemDataSource.ji;26;../Models/MMMetadataItem.ji;26;MMCollectionViewItemCell.ji;13;MMImageView.ji;10;MMPrompt.jt;15012;
objj_executeFile("../Controllers/MMMatchPickerController.j",YES);
objj_executeFile("../DataSources/MMAgentDataSource.j",YES);
objj_executeFile("../DataSources/MMMediaMatchesDataSource.j",YES);
objj_executeFile("../DataSources/MMMetadataItemDataSource.j",YES);
objj_executeFile("../Models/MMMetadataItem.j",YES);
objj_executeFile("MMCollectionViewItemCell.j",YES);
objj_executeFile("MMImageView.j",YES);
objj_executeFile("MMPrompt.j",YES);
var _1=objj_allocateClassPair(MMCollectionViewItemCell,"MMMetadataItemCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_matchingImage"),new objj_ivar("_matchingImageView"),new objj_ivar("agents"),new objj_ivar("contextMenu"),new objj_ivar("contextMenuEvent"),new objj_ivar("matchUsingMenuItem"),new objj_ivar("unmatchMenuItem"),new objj_ivar("collectionsMenuItem"),new objj_ivar("collectionsMenu"),new objj_ivar("agentDataSource"),new objj_ivar("metadataDataSource"),new objj_ivar("mediaDataSource"),new objj_ivar("matchesDataSource"),new objj_ivar("_editor")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("refreshView"),function(_3,_4){
with(_3){
objj_msgSend(_matchingImageView,"setHidden:",objj_msgSend(objj_msgSend(_3,"representedObject"),"state")!=PMCBaseObjectStateMatching);
}
}),new objj_method(sel_getUid("loadView"),function(_5,_6){
with(_5){
objj_msgSendSuper({receiver:_5,super_class:objj_getClass("MMMetadataItemCell").super_class},"loadView");
metadataDataSource=objj_msgSend(objj_msgSend(MMMetadataItemDataSource,"alloc"),"initWithDelegate:",_5);
agentDataSource=objj_msgSend(objj_msgSend(MMAgentDataSource,"alloc"),"initWithDelegate:",_5);
mediaDataSource=objj_msgSend(objj_msgSend(MMLibraryMediaDataSource,"alloc"),"initWithDelegate:",_5);
matchesDataSource=objj_msgSend(objj_msgSend(MMMediaMatchesDataSource,"alloc"),"initWithDelegate:",_5);
objj_msgSend(_5,"bind:toObject:withKeyPath:options:","image",_5,"representedObject.thumbImage",nil);
objj_msgSend(_5,"bind:toObject:withKeyPath:options:","imageRect",objj_msgSend(_5,"imageView"),"imageRect",nil);
objj_msgSend(objj_msgSend(_5,"titleLabel"),"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(objj_msgSend(_5,"titleLabel"),"setTextShadowColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(objj_msgSend(_5,"titleLabel"),"setTextShadowOffset:",CGSizeMake(1,1));
objj_msgSend(objj_msgSend(_5,"titleLabel"),"bind:toObject:withKeyPath:options:",CPValueBinding,_5,"representedObject.displayTitle",nil);
objj_msgSend(objj_msgSend(_5,"subtitleLabel"),"setTextColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",137/255,1));
objj_msgSend(objj_msgSend(_5,"subtitleLabel"),"bind:toObject:withKeyPath:options:",CPValueBinding,_5,"representedObject.year",nil);
if(!_matchingImageView){
_matchingImageView=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",objj_msgSend(objj_msgSend(_5,"imageView"),"imageRect")||CGRectMakeZero());
objj_msgSend(_matchingImageView,"setImageScaling:",CPScaleNone);
objj_msgSend(_matchingImageView,"setImageAlignment:",CPImageAlignCenter);
objj_msgSend(_5,"bind:toObject:withKeyPath:options:","matching",_5,"representedObject.matching",nil);
objj_msgSend(_5,"bind:toObject:withKeyPath:options:","loading",_5,"representedObject.loading",nil);
objj_msgSend(_matchingImageView,"setAlphaValue:",0.6);
objj_msgSend(_matchingImageView,"setBackgroundColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_5,"addSubview:",_matchingImageView);
}
objj_msgSend(_matchingImageView,"setHidden:",objj_msgSend(objj_msgSend(_5,"representedObject"),"state")!=PMCBaseObjectStateMatching);
}
}),new objj_method(sel_getUid("setImageRect:"),function(_7,_8,_9){
with(_7){
if(_9){
objj_msgSend(_matchingImageView,"setFrame:",objj_msgSend(_7,"convertRect:fromView:",_9,objj_msgSend(_7,"imageView")));
}
}
}),new objj_method(sel_getUid("setMatching:"),function(_a,_b,_c){
with(_a){
if(!_matchingImage){
_matchingImage=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Matching.png"));
}
objj_msgSend(_matchingImageView,"setImage:",_c?_matchingImage:nil);
objj_msgSend(_a,"showOrHideDimmer");
}
}),new objj_method(sel_getUid("setLoading:"),function(_d,_e,_f){
with(_d){
objj_msgSend(_d,"showOrHideDimmer");
}
}),new objj_method(sel_getUid("showOrHideDimmer"),function(_10,_11){
with(_10){
objj_msgSend(_matchingImageView,"setHidden:",!objj_msgSend(objj_msgSend(_10,"representedObject"),"isMatching")&&!objj_msgSend(objj_msgSend(_10,"representedObject"),"isLoading"));
}
}),new objj_method(sel_getUid("rightMouseDown:"),function(_12,_13,_14){
with(_12){
if(!contextMenu){
contextMenu=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","");
objj_msgSend(objj_msgSend(contextMenu,"addItemWithTitle:action:keyEquivalent:",CPLocalizedString("Refresh Metadata","Context menu item for metadata items"),sel_getUid("refreshMetadata:"),nil),"setTarget:",_12);
objj_msgSend(objj_msgSend(contextMenu,"addItemWithTitle:action:keyEquivalent:",CPLocalizedString("Edit Metadata...","Context menu item for metadata items"),sel_getUid("editMetadata:"),"i"),"setTarget:",_12);
objj_msgSend(contextMenu,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
var _15=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",CPLocalizedString("Fix Incorrect Match...","Context menu item for metadata items"),sel_getUid("fixIncorrectMatch:"),"f");
objj_msgSend(_15,"setTarget:",_12);
objj_msgSend(_15,"bind:toObject:withKeyPath:options:","enabled",_12,"representedObject.isPersonalMedia",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPNegateBooleanTransformerName,CPValueTransformerNameBindingOption));
objj_msgSend(contextMenu,"addItem:",_15);
matchUsingMenuItem=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",CPLocalizedString("Match Using","Context menu item for metadata items"),nil,nil);
objj_msgSend(contextMenu,"addItem:",matchUsingMenuItem);
unmatchMenuItem=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",CPLocalizedString("Unmatch","Context menu item for metadata items"),sel_getUid("unmatch:"),nil);
objj_msgSend(unmatchMenuItem,"setTarget:",_12);
objj_msgSend(contextMenu,"addItem:",unmatchMenuItem);
objj_msgSend(contextMenu,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
collectionsMenuItem=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",CPLocalizedString("Collections...","Context menu item for adding to collections"),nil,nil);
objj_msgSend(contextMenu,"addItem:",collectionsMenuItem);
objj_msgSend(_12,"_rebuildCollectionsMenu");
contextMenuEvent=_14;
objj_msgSend(metadataDataSource,"refreshRecord:",objj_msgSend(_12,"representedObject"));
}
}
}),new objj_method(sel_getUid("editMetadata:"),function(_16,_17,_18){
with(_16){
_editor=objj_msgSend(objj_msgSend(MMMetadataEditorController,"alloc"),"initWithDelegate:",_16);
objj_msgSend(_editor,"presentMetadataItem:inWindow:",objj_msgSend(_16,"representedObject"),objj_msgSend(_16,"window"));
}
}),new objj_method(sel_getUid("metadataEditor:didCommitMetadataItem:"),function(_19,_1a,_1b,_1c){
with(_19){
objj_msgSend(mediaDataSource,"updateRecord:",_1c);
}
}),new objj_method(sel_getUid("dataSource:didUpdateRecord:contextInfo:"),function(_1d,_1e,_1f,_20,_21){
with(_1d){
objj_msgSend(_editor,"dismissSheet");
_editor=nil;
}
}),new objj_method(sel_getUid("dataSource:didFailToUpdateRecord:withError:contextInfo:"),function(_22,_23,_24,_25,_26,_27){
with(_22){
objj_msgSend(AppController,"notifyUserOfError:withTitle:",_26,"Unable to update metadata");
}
}),new objj_method(sel_getUid("dataSource:didReceiveRecords:contextInfo:"),function(_28,_29,_2a,_2b,_2c){
with(_28){
if(_2a===metadataDataSource){
objj_msgSend(agentDataSource,"refreshRecordsWithContextInfo:",objj_msgSend(objj_msgSend(_28,"representedObject"),"type"));
}else{
if(_2a===agentDataSource){
var _2d=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"init");
agents=objj_msgSend(CPMutableArray,"array");
var _2e=objj_msgSend(objj_msgSend(_28,"representedObject"),"guid");
for(var i=0,_2f=objj_msgSend(_2b,"count");i<_2f;i++){
var _30=objj_msgSend(_2b,"objectAtIndex:",i);
if(!objj_msgSend(_2e,"hasPrefix:",objj_msgSend(_30,"identifier"))&&!objj_msgSend(_30,"isEqual:",MMPersonalMediaAgent)){
objj_msgSend(agents,"addObject:",_30);
var _31=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",objj_msgSend(_30,"name"),sel_getUid("matchUsing:"),nil);
objj_msgSend(_31,"setTarget:",_28);
objj_msgSend(_2d,"addItem:",_31);
}
}
if(objj_msgSend(agents,"count")>0){
objj_msgSend(matchUsingMenuItem,"setEnabled:",YES);
objj_msgSend(matchUsingMenuItem,"setSubmenu:",_2d);
}else{
objj_msgSend(matchUsingMenuItem,"setSubmenu:",nil);
objj_msgSend(matchUsingMenuItem,"setEnabled:",NO);
}
objj_msgSend(unmatchMenuItem,"setEnabled:",!objj_msgSend(objj_msgSend(_28,"representedObject"),"isPersonalMedia"));
objj_msgSend(_28,"_rebuildCollectionsMenu");
objj_msgSend(CPMenu,"popUpContextMenu:withEvent:forView:",contextMenu,contextMenuEvent,_28);
contextMenu=nil,contextMenuEvent=nil,unmatchMenuItem=nil,collectionsMenu=nil,collectionsMenuItem=nil;
}else{
if(_2a===matchesDataSource){
var _32=nil,_33=0;
for(var i=0,_2f=objj_msgSend(_2b,"count");i<_2f;i++){
var _34=objj_msgSend(_2b,"objectAtIndex:",0);
if(objj_msgSend(_34,"score")>_33){
_32=_34;
_33=objj_msgSend(_34,"score");
}
}
if(_33>80){
objj_msgSend(matchesDataSource,"selectMatch:forMetadataItem:",_32,objj_msgSend(_28,"representedObject"));
}else{
var _35=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"init");
objj_msgSend(_35,"setTitle:",CPLocalizedString("No Match Found","'Match Using' error title"));
objj_msgSend(_35,"setMessageText:",CPLocalizedString("There was no acceptable match using the specified agent.","'Match Using' error message"));
objj_msgSend(_35,"setAlertStyle:",CPWarningAlertStyle);
objj_msgSend(_35,"addButtonWithTitle:",CPLocalizedString("OK","OK"));
objj_msgSend(_35,"runModal");
}
}
}
}
}
}),new objj_method(sel_getUid("_rebuildCollectionsMenu"),function(_36,_37){
with(_36){
while(objj_msgSend(collectionsMenu,"numberOfItems")){
objj_msgSend(collectionsMenu,"removeItemAtIndex:",0);
}
if(!collectionsMenu){
collectionsMenu=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"init");
objj_msgSend(collectionsMenuItem,"setSubmenu:",collectionsMenu);
}
var _38=objj_msgSend(_36,"representedObject"),_39=objj_msgSend(objj_msgSend(_38,"librarySection"),"collections");
objj_msgSend(_39,"enumerateObjectsUsingBlock:",function(_3a){
var _3b=objj_msgSend(collectionsMenu,"addItemWithTitle:action:keyEquivalent:",objj_msgSend(_3a,"title"),sel_getUid("_toggleCollectionMembership:"),nil);
objj_msgSend(_3b,"setTarget:",_36);
objj_msgSend(_3b,"setRepresentedObject:",_3a);
objj_msgSend(_3b,"setState:",objj_msgSend(_38,"belongsToCollection:",_3a)?CPOnState:CPOffState);
});
if(objj_msgSend(_39,"count")){
objj_msgSend(collectionsMenu,"addItem:",objj_msgSend(CPMenuItem,"separatorItem"));
}
objj_msgSend(objj_msgSend(collectionsMenu,"addItemWithTitle:action:keyEquivalent:",CPLocalizedString("New Collection...","Context menu item title for adding a new collection"),sel_getUid("_promptForNewCollection:"),nil),"setTarget:",_36);
}
}),new objj_method(sel_getUid("_toggleCollectionMembership:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=objj_msgSend(_3c,"representedObject"),_40=objj_msgSend(_3e,"representedObject");
CPLog.info("[%@ %@] toggling membership of %@ in collection %@",objj_msgSend(_3c,"class"),_3d,_3f,_40);
if(objj_msgSend(_3f,"belongsToCollection:",_40)){
objj_msgSend(_3f,"removeFromCollection:",_40);
}else{
objj_msgSend(_3f,"addToCollection:",_40);
}
objj_msgSend(metadataDataSource,"updateRecord:",_3f);
}
}),new objj_method(sel_getUid("_promptForNewCollection:"),function(_41,_42,_43){
with(_41){
var _44=objj_msgSend(objj_msgSend(MMPrompt,"alloc"),"init");
objj_msgSend(_44,"setAlertStyle:",CPInformationalAlertStyle);
objj_msgSend(_44,"setMessageText:",CPLocalizedString("What would you like to call this collection?","Context menu item title for creating a new collection"));
objj_msgSend(_44,"addFieldWithLabel:value:placeholder:secure:width:","","","",NO,250);
objj_msgSend(_44,"addButtonWithTitle:",CPLocalizedString("Create","Create"));
objj_msgSend(_44,"addButtonWithTitle:",CPLocalizedString("Cancel","Cancel"));
objj_msgSend(_44,"setDelegate:",_41);
objj_msgSend(_44,"beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:",objj_msgSend(_41,"window"),_41,sel_getUid("_collectionTitlePromptDidEnd:returnCode:contextInfo:"),objj_msgSend(_41,"representedObject"));
}
}),new objj_method(sel_getUid("_collectionTitlePromptDidEnd:returnCode:contextInfo:"),function(_45,_46,_47,_48,_49){
with(_45){
if(_48!=0){
return;
}
var _4a=objj_msgSend(_47,"stringValueAtIndex:",0);
if(!_4a){
return;
}
objj_msgSend(_49,"addToCollection:",_4a);
objj_msgSend(metadataDataSource,"updateRecord:",_49);
}
}),new objj_method(sel_getUid("fixIncorrectMatch:"),function(_4b,_4c,_4d){
with(_4b){
var _4e=objj_msgSend(objj_msgSend(MMMatchPickerController,"alloc"),"initWithDelegate:",_4b);
objj_msgSend(_4e,"setMetadataItem:",objj_msgSend(_4b,"representedObject"));
objj_msgSend(_4e,"presentSheetInWindow:",objj_msgSend(_4b,"window"));
}
}),new objj_method(sel_getUid("matchPicker:didSelectSearchResult:"),function(_4f,_50,_51,_52){
with(_4f){
CPLog.info("[%@ -picker:didSelectSearchResult:] user chose %@ as the correct match for %@",objj_msgSend(_4f,"class"),_52,objj_msgSend(_4f,"representedObject"));
objj_msgSend(_51,"dismissSheet");
objj_msgSend(objj_msgSend(MMMediaMatchesDataSource,"sharedDataSource"),"selectMatch:forMetadataItem:",_52,objj_msgSend(_4f,"representedObject"));
}
}),new objj_method(sel_getUid("matchPickerDidCancel:"),function(_53,_54,_55){
with(_53){
objj_msgSend(_55,"dismissSheet");
}
}),new objj_method(sel_getUid("refreshMetadata:"),function(_56,_57,_58){
with(_56){
var _59=objj_msgSend(_56,"representedObject");
if(objj_msgSend(_59,"isIdle")){
objj_msgSend(_59,"setState:",PMCBaseObjectStateLoadingMetadata);
}
objj_msgSend(objj_msgSend(MMMediaMatchesDataSource,"sharedDataSource"),"refreshMatchForMetadataItem:",_59);
}
}),new objj_method(sel_getUid("unmatch:"),function(_5a,_5b,_5c){
with(_5a){
var _5d=objj_msgSend(_5a,"representedObject");
if(objj_msgSend(_5d,"isIdle")){
objj_msgSend(_5d,"setState:",PMCBaseObjectStateMatching);
}
objj_msgSend(objj_msgSend(MMMediaMatchesDataSource,"sharedDataSource"),"unmatchItem:",_5d);
}
}),new objj_method(sel_getUid("matchUsing:"),function(_5e,_5f,_60){
with(_5e){
var _61=objj_msgSend(objj_msgSend(objj_msgSend(matchUsingMenuItem,"submenu"),"itemArray"),"indexOfObject:",_60),_62=objj_msgSend(agents,"objectAtIndex:",_61),_63=objj_msgSend(_5e,"representedObject");
if(objj_msgSend(_63,"isIdle")){
objj_msgSend(_63,"setState:",PMCBaseObjectStateMatching);
}
objj_msgSend(matchesDataSource,"refreshRecordsForMetadataItem:title:agent:language:year:manual:",_63,nil,_62,objj_msgSend(_63,"language"),nil,NO);
}
})]);
p;37;Controllers/MMMatchPickerController.jt;30597;@STATIC;1.0;I;20;Foundation/CPArray.jI;21;Foundation/CPString.jI;22;Foundation/CPRunLoop.jI;33;Foundation/CPNotificationCenter.jI;20;AppKit/CPAnimation.jI;22;AppKit/CPApplication.jI;17;AppKit/CPButton.jI;16;AppKit/CPImage.jI;22;AppKit/CPPopUpButton.jI;21;AppKit/CPScrollView.jI;20;AppKit/CPTableView.jI;20;AppKit/CPTextField.jI;15;AppKit/CPView.jI;25;AppKit/CPViewController.ji;23;../Models/MMMediaItem.ji;26;../Models/MMMetadataItem.ji;41;../DataSources/MMMediaMatchesDataSource.ji;34;../DataSources/MMAgentDataSource.jt;30069;
objj_executeFile("Foundation/CPArray.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPRunLoop.j",NO);
objj_executeFile("Foundation/CPNotificationCenter.j",NO);
objj_executeFile("AppKit/CPAnimation.j",NO);
objj_executeFile("AppKit/CPApplication.j",NO);
objj_executeFile("AppKit/CPButton.j",NO);
objj_executeFile("AppKit/CPImage.j",NO);
objj_executeFile("AppKit/CPPopUpButton.j",NO);
objj_executeFile("AppKit/CPScrollView.j",NO);
objj_executeFile("AppKit/CPTableView.j",NO);
objj_executeFile("AppKit/CPTextField.j",NO);
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("AppKit/CPViewController.j",NO);
objj_executeFile("../Models/MMMediaItem.j",YES);
objj_executeFile("../Models/MMMetadataItem.j",YES);
objj_executeFile("../DataSources/MMMediaMatchesDataSource.j",YES);
objj_executeFile("../DataSources/MMAgentDataSource.j",YES);
var _1=objj_allocateClassPair(CPViewController,"MMMatchPickerController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_delegate"),new objj_ivar("metadataItem"),new objj_ivar("metadataItemWithFilePart"),new objj_ivar("_matchesDataSource"),new objj_ivar("_mediaDataSource"),new objj_ivar("_sheetPanel"),new objj_ivar("_resultView"),new objj_ivar("_descriptiveLabel"),new objj_ivar("_searchResults"),new objj_ivar("_matchesTableView"),new objj_ivar("_matchesScrollView"),new objj_ivar("_selectButton"),new objj_ivar("_cancelButton"),new objj_ivar("_searchButton"),new objj_ivar("_searchFormView"),new objj_ivar("_agentPopUp"),new objj_ivar("_languagePopUp"),new objj_ivar("_titleField"),new objj_ivar("_yearField"),new objj_ivar("_mediaFileField"),new objj_ivar("_submitSearchButton"),new objj_ivar("_cancelSearchButton"),new objj_ivar("_loadingIndicator"),new objj_ivar("_searchResults"),new objj_ivar("_agentDataSource")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("delegate"),function(_3,_4){
with(_3){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_5,_6,_7){
with(_5){
_delegate=_7;
}
}),new objj_method(sel_getUid("metadataItem"),function(_8,_9){
with(_8){
return metadataItem;
}
}),new objj_method(sel_getUid("setMetadataItem:"),function(_a,_b,_c){
with(_a){
metadataItem=_c;
}
}),new objj_method(sel_getUid("metadataItemWithFilePart"),function(_d,_e){
with(_d){
return metadataItemWithFilePart;
}
}),new objj_method(sel_getUid("setMetadataItemWithFilePart:"),function(_f,_10,_11){
with(_f){
metadataItemWithFilePart=_11;
}
}),new objj_method(sel_getUid("initWithDelegate:"),function(_12,_13,_14){
with(_12){
if(_12=objj_msgSendSuper({receiver:_12,super_class:objj_getClass("MMMatchPickerController").super_class},"init")){
_delegate=_14;
_searchResults=objj_msgSend(CPArray,"array");
_matchesDataSource=objj_msgSend(objj_msgSend(MMMediaMatchesDataSource,"alloc"),"initWithDelegate:",_12);
_mediaDataSource=objj_msgSend(objj_msgSend(MMLibraryMediaDataSource,"alloc"),"initWithDelegate:",_12);
_agentDataSource=objj_msgSend(MMAgentDataSource,"sharedDataSource");
}
return _12;
}
}),new objj_method(sel_getUid("initWithMetadataItem:delegate:"),function(_15,_16,_17,_18){
with(_15){
if(_15=objj_msgSend(_15,"initWithDelegate:",_18)){
objj_msgSend(_15,"setMetadataItem:",_17);
}
return _15;
}
}),new objj_method(sel_getUid("presentSheetInWindow:"),function(_19,_1a,_1b){
with(_19){
if(_sheetPanel){
return;
}
_sheetPanel=objj_msgSend(objj_msgSend(CPPanel,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(_19,"view"),"bounds"),CPDocModalWindowMask);
objj_msgSend(_sheetPanel,"setContentView:",objj_msgSend(_19,"view"));
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",_sheetPanel,_1b,nil,nil,nil);
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("_resultViewDidActivate"),_19,nil,0,[CPDefaultRunLoopMode]);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_19,sel_getUid("_agentsDidLoad:"),MMDataSourceDidReceiveRecords,_agentDataSource);
objj_msgSend(_agentDataSource,"refreshRecordsWithContextInfo:",objj_msgSend(objj_msgSend(objj_msgSend(metadataItem,"librarySection"),"type"),"key"));
}
}),new objj_method(sel_getUid("dismissSheet"),function(_1c,_1d){
with(_1c){
if(!_sheetPanel){
return;
}
objj_msgSend(CPApp,"endSheet:returnCode:",_sheetPanel,0),_sheetPanel=nil;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_1c,MMDataSourceDidReceiveRecords,_agentDataSource);
}
}),new objj_method(sel_getUid("setMetadataItem:"),function(_1e,_1f,_20){
with(_1e){
metadataItem=_20;
objj_msgSend(_1e,"setMetadataItemWithFilePart:",metadataItem);
objj_msgSend(_1e,"view");
_searchResults=objj_msgSend(CPArray,"array");
objj_msgSend(_matchesTableView,"reloadData");
objj_msgSend(_matchesDataSource,"refreshRecordsWithContextInfo:manual:",metadataItem,YES);
objj_msgSend(_descriptiveLabel,"setStringValue:",objj_msgSend(_1e,"title"));
objj_msgSend(_descriptiveLabel,"sizeToFit");
objj_msgSend(_titleField,"setStringValue:",objj_msgSend(metadataItem,"title"));
objj_msgSend(_yearField,"setStringValue:",objj_msgSend(metadataItem,"year"));
objj_msgSend(_selectButton,"setTitle:",objj_msgSend(_1e,"_selectButtonTitle"));
}
}),new objj_method(sel_getUid("setMetadataItemWithFilePart:"),function(_21,_22,_23){
with(_21){
metadataItemWithFilePart=_23;
if(!objj_msgSend(objj_msgSend(metadataItemWithFilePart,"mainMediaItem"),"mainPart")){
objj_msgSend(_mediaDataSource,"refreshRecordsWithContextInfo:",metadataItemWithFilePart);
}
}
}),new objj_method(sel_getUid("mediaItemFileName"),function(_24,_25){
with(_24){
var _26=objj_msgSend(objj_msgSend(objj_msgSend(metadataItemWithFilePart,"mainMediaItem"),"mainPart"),"file");
if(!_26){
return nil;
}
objj_msgSend(_mediaFileField,"setToolTip:",_26);
var _27,_28=_26,_29=objj_msgSend(_26,"length"),_2a="…",_2b=CPMakeRange(0,0),_2c=objj_msgSend(_mediaFileField,"font"),_2d=CGRectGetWidth(objj_msgSend(_mediaFileField,"frame"))-1;
for(var i=2;i<_29;i++){
_27=objj_msgSend(CPPlatformString,"sizeOfString:withFont:forWidth:",_28,_2c,0);
if(_27.width<_2d){
break;
}
_2b=CPMakeRange(FLOOR((_29-i)/2),i);
_28=objj_msgSend(_26,"substringToIndex:",_2b.location)+_2a+objj_msgSend(_26,"substringFromIndex:",CPMaxRange(_2b));
}
return _28;
}
}),new objj_method(sel_getUid("dataSource:didRequestRecordsWithContextInfo:"),function(_2e,_2f,_30,_31){
with(_2e){
if(_30!=_matchesDataSource){
return;
}
if(objj_msgSend(_31,"isKindOfClass:",CPDictionary)){
_31=objj_msgSend(_31,"objectForKey:","metadataItem");
}
if(objj_msgSend(metadataItem,"isEqual:",_31)){
_searchResults=objj_msgSend(CPArray,"array");
objj_msgSend(_matchesTableView,"reloadData");
objj_msgSend(_loadingIndicator,"setHidden:",NO);
}else{
CPLog.warn("[%@ -dataSource:didRequestRecordsWithContextInfo:] ignoring request for stale context: %@",objj_msgSend(_2e,"class"),_31);
}
}
}),new objj_method(sel_getUid("dataSource:didReceiveRecords:contextInfo:"),function(_32,_33,_34,_35,_36){
with(_32){
if(_34==_matchesDataSource){
if(objj_msgSend(_36,"isKindOfClass:",CPDictionary)){
_36=objj_msgSend(_36,"objectForKey:","metadataItem");
}
if(objj_msgSend(metadataItem,"isEqual:",_36)){
_searchResults=_35;
objj_msgSend(_matchesTableView,"reloadData");
objj_msgSend(_loadingIndicator,"setHidden:",YES);
}else{
CPLog.warn("[%@ -dataSource:didReceiveRecords:contextInfo:] ignoring records for stale context: %@",objj_msgSend(_32,"class"),_36);
}
}else{
if(_34==_mediaDataSource){
objj_msgSend(_32,"setMetadataItemWithFilePart:",objj_msgSend(_35,"count")?objj_msgSend(_35,"objectAtIndex:",0):nil);
}
}
}
}),new objj_method(sel_getUid("dataSource:didFailToReceiveRecordsWithError:contextInfo:"),function(_37,_38,_39,_3a,_3b){
with(_37){
if(_39!=_matchesDataSource){
return;
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("matchPicker:didFailWithError:"))){
objj_msgSend(_delegate,"matchPicker:didFailWithError:",_37,_3a);
}
objj_msgSend(_loadingIndicator,"setHidden:",YES);
}
}),new objj_method(sel_getUid("_agentsDidLoad:"),function(_3c,_3d,_3e){
with(_3c){
_agents=objj_msgSend(objj_msgSend(_3e,"userInfo"),"objectForKey:","records");
var _3f=objj_msgSend(objj_msgSend(metadataItem,"librarySection"),"agent"),_40=objj_msgSend(_agents,"indexOfObject:",_3f);
objj_msgSend(_agentPopUp,"removeAllItems");
for(var i=0;i<objj_msgSend(_agents,"count");i++){
objj_msgSend(_agentPopUp,"addItemWithTitle:",objj_msgSend(objj_msgSend(_agents,"objectAtIndex:",i),"name"));
}
objj_msgSend(_agentPopUp,"selectItemAtIndex:",_40);
objj_msgSend(_3c,"_agentSelectionDidChange");
}
}),new objj_method(sel_getUid("_agentSelectionDidChange"),function(_41,_42){
with(_41){
var _43=objj_msgSend(objj_msgSend(_41,"selectedAgent"),"languages"),_44=objj_msgSend(objj_msgSend(metadataItem,"librarySection"),"language"),_45=objj_msgSend(_43,"indexOfObject:",_44);
objj_msgSend(_languagePopUp,"removeAllItems");
for(var i=0;i<objj_msgSend(_43,"count");i++){
objj_msgSend(_languagePopUp,"addItemWithTitle:",objj_msgSend(objj_msgSend(_43,"objectAtIndex:",i),"name"));
}
objj_msgSend(_languagePopUp,"selectItemAtIndex:",_45);
}
}),new objj_method(sel_getUid("selectedAgent"),function(_46,_47){
with(_46){
var _48=objj_msgSend(_agentPopUp,"indexOfSelectedItem");
if(_48==CPNotFound){
return nil;
}
return objj_msgSend(_agents,"objectAtIndex:",_48);
}
}),new objj_method(sel_getUid("selectedLanguage"),function(_49,_4a){
with(_49){
var _4b=objj_msgSend(_languagePopUp,"indexOfSelectedItem");
if(_4b==CPNotFound){
return nil;
}
return objj_msgSend(objj_msgSend(objj_msgSend(_49,"selectedAgent"),"languages"),"objectAtIndex:",_4b);
}
}),new objj_method(sel_getUid("title"),function(_4c,_4d){
with(_4c){
switch(objj_msgSend(objj_msgSend(objj_msgSend(metadataItem,"librarySection"),"type"),"key")){
case PMCObjectTypeMovie:
return CPLocalizedString("Select the correct movie from the list below:","Fix Incorrect Match title for movie sections");
case PMCObjectTypeArtist:
return CPLocalizedString("Select the correct artist from the list below:","Fix Incorrect Match title for music sections");
case PMCObjectTypeShow:
return CPLocalizedString("Select the correct TV show from the list below:","Fix Incorrect Match title for TV show sections");
}
}
}),new objj_method(sel_getUid("loadView"),function(_4e,_4f){
with(_4e){
var _50=10;
_view=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,482,323));
_resultView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(_view,"frame"));
objj_msgSend(_view,"addSubview:",_resultView);
_descriptiveLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_descriptiveLabel,"setStringValue:",objj_msgSend(_4e,"title"));
objj_msgSend(_descriptiveLabel,"sizeToFit");
objj_msgSend(_descriptiveLabel,"setFrameOrigin:",CGPointMake(_50,_50));
objj_msgSend(_resultView,"addSubview:",_descriptiveLabel);
_matchesScrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(_50,CGRectGetMaxY(objj_msgSend(_descriptiveLabel,"frame"))+5,CGRectGetWidth(objj_msgSend(_resultView,"frame"))-_50*2,200));
objj_msgSend(_matchesScrollView,"setBorderType:",CPLineBorder);
objj_msgSend(_matchesScrollView,"setAutohidesScrollers:",YES);
_matchesTableView=objj_msgSend(objj_msgSend(CPTableView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_matchesTableView,"setDataSource:",_4e);
objj_msgSend(_matchesTableView,"setDelegate:",_4e);
objj_msgSend(_matchesTableView,"setTarget:",_4e);
objj_msgSend(_matchesTableView,"setDoubleAction:",sel_getUid("tableViewRowWasDoubleClicked:"));
var _51=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","name");
objj_msgSend(objj_msgSend(_51,"headerView"),"setStringValue:",CPLocalizedString("Name","Name"));
objj_msgSend(_matchesTableView,"addTableColumn:",_51);
var _52=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","year");
objj_msgSend(objj_msgSend(_52,"headerView"),"setStringValue:",CPLocalizedString("Year","Year"));
objj_msgSend(_matchesTableView,"addTableColumn:",_52);
var _53=objj_msgSend(CPPlatformString,"sizeOfString:withFont:forWidth:",(new Date()).getFullYear().toString(),objj_msgSend(objj_msgSend(objj_msgSend(_52,"headerView"),"textField"),"font"),nil).width*1.25;
objj_msgSend(_52,"setWidth:",_53);
objj_msgSend(_52,"setMinWidth:",_53);
objj_msgSend(_52,"setMaxWidth:",_53);
objj_msgSend(_51,"setWidth:",CGRectGetWidth(objj_msgSend(_matchesScrollView,"frame"))-_53*2);
objj_msgSend(_matchesScrollView,"setDocumentView:",_matchesTableView);
objj_msgSend(_resultView,"addSubview:",_matchesScrollView);
var _54=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Media file: ","Label for the path to the file whose match is being fixed"));
objj_msgSend(_54,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_matchesScrollView,"frame")),CGRectGetMaxY(objj_msgSend(_matchesScrollView,"frame"))+_50/2));
objj_msgSend(_resultView,"addSubview:",_54);
_mediaFileField=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(_mediaFileField,"setFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(_54,"frame")),CGRectGetMinY(objj_msgSend(_54,"frame")),CGRectGetWidth(objj_msgSend(_resultView,"frame"))-CGRectGetMaxX(objj_msgSend(_54,"frame"))-_50,CGRectGetHeight(objj_msgSend(_mediaFileField,"frame"))));
objj_msgSend(_mediaFileField,"setLineBreakMode:",CPLineBreakByTruncatingMiddle);
objj_msgSend(_mediaFileField,"bind:toObject:withKeyPath:options:",CPValueBinding,_4e,"mediaItemFileName",nil);
objj_msgSend(_resultView,"addSubview:",_mediaFileField);
var _55=objj_msgSend(objj_msgSend(CPBox,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_matchesScrollView,"frame"))/2,CGRectGetMaxY(objj_msgSend(_54,"frame"))+_50/2,CGRectGetWidth(objj_msgSend(_matchesScrollView,"frame"))+CGRectGetMinX(objj_msgSend(_matchesScrollView,"frame")),1));
objj_msgSend(_resultView,"addSubview:",_55);
_searchButton=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Custom Search","Custom Search"));
objj_msgSend(_searchButton,"setTarget:",_4e);
objj_msgSend(_searchButton,"setAction:",sel_getUid("search:"));
objj_msgSend(_searchButton,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_54,"frame")),CGRectGetMaxY(objj_msgSend(_55,"frame"))+_50));
objj_msgSend(_resultView,"addSubview:",_searchButton);
_selectButton=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Select","Select"));
objj_msgSend(_resultView,"addSubview:",_selectButton);
_cancelButton=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Cancel","Cancel"));
objj_msgSend(_resultView,"addSubview:",_cancelButton);
objj_msgSend(_selectButton,"addObserver:forKeyPath:options:context:",_4e,"title",CPKeyValueObservingOptionNew,nil);
objj_msgSend(_selectButton,"addObserver:forKeyPath:options:context:",_4e,"frame",CPKeyValueObservingOptionNew,nil);
objj_msgSend(_matchesTableView,"addObserver:forKeyPath:options:context:",_4e,"selectedRowIndexes",CPKeyValueObservingOptionNew|CPKeyValueObservingOptionInitial,nil);
objj_msgSend(_selectButton,"setTitle:",objj_msgSend(_4e,"_selectButtonTitle"));
objj_msgSend(_selectButton,"setTarget:",_4e);
objj_msgSend(_selectButton,"setAction:",sel_getUid("chooseMatch:"));
objj_msgSend(_selectButton,"setKeyEquivalent:",CPCarriageReturnCharacter);
objj_msgSend(objj_msgSend(_view,"window"),"setDefaultButton:",_selectButton);
objj_msgSend(_cancelButton,"setTarget:",_4e);
objj_msgSend(_cancelButton,"setAction:",sel_getUid("cancel:"));
objj_msgSend(_cancelButton,"setKeyEquivalent:",CPEscapeFunctionKey);
objj_msgSend(_resultView,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_resultView,"frame")),CGRectGetMaxY(objj_msgSend(_searchButton,"frame"))+_50));
objj_msgSend(_view,"setFrameSize:",objj_msgSend(_resultView,"frame").size);
var _56=CGSizeMake(16,16);
_loadingIndicator=objj_msgSend(objj_msgSend(MMSpinner,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_loadingIndicator,"setLines:",8);
objj_msgSend(_loadingIndicator,"setLength:",0);
objj_msgSend(_loadingIndicator,"setWidth:",3);
objj_msgSend(_loadingIndicator,"setRadius:",4);
objj_msgSend(_loadingIndicator,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(_matchesScrollView,"frame"))-_56.width,CGRectGetMinY(objj_msgSend(_matchesScrollView,"frame"))-5-_56.height));
objj_msgSend(_loadingIndicator,"setFrameSize:",_56);
objj_msgSend(_loadingIndicator,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(_loadingIndicator,"start");
objj_msgSend(_resultView,"addSubview:",_loadingIndicator);
objj_msgSend(_matchesScrollView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_selectButton,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(_cancelButton,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(_searchButton,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxXMargin);
objj_msgSend(_resultView,"setAutoresizingMask:",CPViewMinYMargin|CPViewMinXMargin|CPViewMaxXMargin);
var _57=270,_58=_57*0.6,_59=10;
var _5a=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Search using:","Agent label"));
var _5b=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Language:","Language label"));
var _5c=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Name:","Name label"));
var _5d=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Year:","Year label"));
objj_msgSend(_5a,"setFrameOrigin:",CGPointMake(_59,_59));
objj_msgSend(_5b,"setFrameOrigin:",CGPointMake(_59,CGRectGetMaxY(objj_msgSend(_5a,"frame"))+_59));
objj_msgSend(_5c,"setFrameOrigin:",CGPointMake(_59,CGRectGetMaxY(objj_msgSend(_5b,"frame"))+_59));
objj_msgSend(_5d,"setFrameOrigin:",CGPointMake(_59,CGRectGetMaxY(objj_msgSend(_5c,"frame"))+_59));
var _5e=_57-_50-_58,_5f=MAX(CGRectGetMaxX(objj_msgSend(_5a,"frame"))+5,CGRectGetMaxX(objj_msgSend(_5b,"frame"))+5,CGRectGetMaxX(objj_msgSend(_5c,"frame"))+5,CGRectGetMaxX(objj_msgSend(_5d,"frame"))+5);
if(_5f>_5e){
_57+=(_5f-_5e);
}else{
_5f=_5e;
}
_searchFormView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,_57,0));
_agentPopUp=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_agentPopUp,"sizeToFit");
objj_msgSend(_agentPopUp,"setTarget:",_4e);
objj_msgSend(_agentPopUp,"setAction:",sel_getUid("_agentSelectionDidChange"));
objj_msgSend(_agentPopUp,"setFrame:",CGRectMake(_5f,CGRectGetMinY(objj_msgSend(_5a,"frame"))+(CGRectGetHeight(objj_msgSend(_5a,"frame"))-CGRectGetHeight(objj_msgSend(_5a,"frame")))/2,_58,CGRectGetHeight(objj_msgSend(_agentPopUp,"frame"))));
objj_msgSend(_searchFormView,"addSubview:",_agentPopUp);
_languagePopUp=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_languagePopUp,"sizeToFit");
objj_msgSend(_languagePopUp,"setFrame:",CGRectMake(_5f,CGRectGetMinY(objj_msgSend(_5b,"frame"))+(CGRectGetHeight(objj_msgSend(_5b,"frame"))-CGRectGetHeight(objj_msgSend(_5b,"frame")))/2,_58,CGRectGetHeight(objj_msgSend(_languagePopUp,"frame"))));
objj_msgSend(_searchFormView,"addSubview:",_languagePopUp);
_titleField=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","","",_58);
objj_msgSend(_titleField,"setFrameOrigin:",CGPointMake(_5f,CGRectGetMinY(objj_msgSend(_5c,"frame"))+(CGRectGetHeight(objj_msgSend(_5c,"frame"))-CGRectGetHeight(objj_msgSend(_titleField,"frame")))/2));
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewMaxXMargin);
objj_msgSend(_searchFormView,"addSubview:",_titleField);
_yearField=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","","",_58/2);
objj_msgSend(_yearField,"setFrameOrigin:",CGPointMake(_5f,CGRectGetMinY(objj_msgSend(_5d,"frame"))+(CGRectGetHeight(objj_msgSend(_5d,"frame"))-CGRectGetHeight(objj_msgSend(_yearField,"frame")))/2));
objj_msgSend(_yearField,"setAutoresizingMask:",CPViewMaxXMargin);
objj_msgSend(_searchFormView,"addSubview:",_yearField);
objj_msgSend(_searchFormView,"addSubview:",_5a);
objj_msgSend(_searchFormView,"addSubview:",_5b);
objj_msgSend(_searchFormView,"addSubview:",_5c);
objj_msgSend(_searchFormView,"addSubview:",_5d);
objj_msgSend(_searchFormView,"setAutoresizingMask:",objj_msgSend(_resultView,"autoresizingMask"));
_submitSearchButton=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Search","Search"));
objj_msgSend(_submitSearchButton,"setTarget:",_4e);
objj_msgSend(_submitSearchButton,"setAction:",sel_getUid("submitSearch:"));
objj_msgSend(_submitSearchButton,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(_titleField,"frame"))-CGRectGetWidth(objj_msgSend(_submitSearchButton,"frame")),CGRectGetMaxY(objj_msgSend(_yearField,"frame"))+5));
objj_msgSend(_searchFormView,"addSubview:",_submitSearchButton);
_cancelSearchButton=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Cancel","Cancel"));
objj_msgSend(_cancelSearchButton,"setTarget:",_4e);
objj_msgSend(_cancelSearchButton,"setAction:",sel_getUid("cancelSearch:"));
objj_msgSend(_cancelSearchButton,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_submitSearchButton,"frame"))-5-CGRectGetWidth(objj_msgSend(_cancelSearchButton,"frame")),CGRectGetMinY(objj_msgSend(_submitSearchButton,"frame"))));
objj_msgSend(_searchFormView,"addSubview:",_cancelSearchButton);
objj_msgSend(_searchFormView,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_searchFormView,"frame")),CGRectGetMaxY(objj_msgSend(_cancelSearchButton,"frame"))+_50));
objj_msgSend(_searchFormView,"setHidden:",YES);
objj_msgSend(_agentPopUp,"setAutoresizingMask:",CPViewMaxXMargin);
objj_msgSend(_titleField,"setAutoresizingMask:",CPViewMaxXMargin);
objj_msgSend(_languagePopUp,"setAutoresizingMask:",CPViewMaxXMargin);
objj_msgSend(_submitSearchButton,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(_cancelSearchButton,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(_view,"addSubview:",_searchFormView);
}
}),new objj_method(sel_getUid("_selectButtonTitle"),function(_60,_61){
with(_60){
var _62={artist:CPLocalizedString("Artist","Artist"),movie:CPLocalizedString("Movie","Movie"),show:CPLocalizedString("Show","Show")}[objj_msgSend(objj_msgSend(objj_msgSend(metadataItem,"librarySection"),"type"),"key")];
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Select %@","Confirm button title for selecting"),_62);
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_63,_64,_65,_66,_67,_68){
with(_63){
if(objj_msgSend(_66,"isEqual:",_selectButton)&&_65=="title"){
objj_msgSend(_selectButton,"sizeToFit");
objj_msgSend(_selectButton,"setFrameOrigin:",CPPointMake(CGRectGetWidth(objj_msgSend(objj_msgSend(_selectButton,"superview"),"frame"))-10-CGRectGetWidth(objj_msgSend(_selectButton,"frame")),CGRectGetMinY(objj_msgSend(_searchButton,"frame"))));
}else{
if(objj_msgSend(_66,"isEqual:",_selectButton)&&_65=="frame"){
objj_msgSend(_cancelButton,"setFrameOrigin:",CPPointMake(CGRectGetMinX(objj_msgSend(_selectButton,"frame"))-10-CGRectGetWidth(objj_msgSend(_cancelButton,"frame")),CGRectGetMinY(objj_msgSend(_selectButton,"frame"))));
}else{
if(objj_msgSend(_66,"isEqual:",_matchesTableView)&&_65=="selectedRowIndexes"){
var _69=objj_msgSend(_67,"objectForKey:",CPKeyValueChangeNewKey);
if(objj_msgSend(_69,"count")){
var _6a=objj_msgSend(_searchResults,"objectAtIndex:",objj_msgSend(_69,"firstIndex"));
objj_msgSend(_titleField,"setStringValue:",objj_msgSend(_6a,"name"));
objj_msgSend(_yearField,"setStringValue:",objj_msgSend(_6a,"year"));
objj_msgSend(_selectButton,"setEnabled:",YES);
}else{
objj_msgSend(_titleField,"setStringValue:",objj_msgSend(metadataItem,"title"));
objj_msgSend(_yearField,"setStringValue:",objj_msgSend(metadataItem,"year"));
objj_msgSend(_selectButton,"setEnabled:",NO);
}
}else{
CPLog.warn("[%@ -observeValueForKeyPath:ofObject:change:context:] ignoring unrecognized change notice (%@ @ %@)",_66,_65);
}
}
}
}
}),new objj_method(sel_getUid("_selectSearchResult:"),function(_6b,_6c,_6d){
with(_6b){
if(_6d&&objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("matchPicker:didSelectSearchResult:"))){
objj_msgSend(_delegate,"matchPicker:didSelectSearchResult:",_6b,_6d);
}
}
}),new objj_method(sel_getUid("_searchResultAtIndex:"),function(_6e,_6f,_70){
with(_6e){
if(_70==CPNotFound||_70>=objj_msgSend(_searchResults,"count")){
return nil;
}
return objj_msgSend(_searchResults,"objectAtIndex:",_70);
}
}),new objj_method(sel_getUid("cancel:"),function(_71,_72,_73){
with(_71){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("matchPickerDidCancel:"))){
objj_msgSend(_delegate,"matchPickerDidCancel:",_71);
}
}
}),new objj_method(sel_getUid("chooseMatch:"),function(_74,_75,_76){
with(_74){
objj_msgSend(_74,"_selectSearchResult:",objj_msgSend(_74,"_searchResultAtIndex:",objj_msgSend(_matchesTableView,"selectedRow")));
}
}),new objj_method(sel_getUid("search:"),function(_77,_78,_79){
with(_77){
objj_msgSend(_77,"_transitionFromSubview:toSubview:",_resultView,_searchFormView);
}
}),new objj_method(sel_getUid("submitSearch:"),function(_7a,_7b,_7c){
with(_7a){
objj_msgSend(_matchesDataSource,"refreshRecordsForMetadataItem:title:agent:language:year:manual:",metadataItem,objj_msgSend(_titleField,"stringValue"),objj_msgSend(_7a,"selectedAgent"),objj_msgSend(_7a,"selectedLanguage"),objj_msgSend(_yearField,"stringValue"),YES);
objj_msgSend(_7a,"_transitionFromSubview:toSubview:",_searchFormView,_resultView);
}
}),new objj_method(sel_getUid("cancelSearch:"),function(_7d,_7e,_7f){
with(_7d){
objj_msgSend(_7d,"_transitionFromSubview:toSubview:",_searchFormView,_resultView);
}
}),new objj_method(sel_getUid("_transitionFromSubview:toSubview:"),function(_80,_81,_82,_83){
with(_80){
objj_msgSend(_80,"_willTransitionFromSubview:toSubview:",_82,_83);
var _84=objj_msgSend(objj_msgSend(_80,"view"),"window"),_85=objj_msgSend(_84,"frame"),_86=objj_msgSend(_83,"frame").size,_87=CGRectMake(CGRectGetMidX(_85)-_86.width/2,CGRectGetMinY(_85),CGRectGetWidth(objj_msgSend(_83,"frame")),CGRectGetHeight(objj_msgSend(_83,"frame"))),_88=objj_msgSend(_84,"animationResizeTime:",_87);
var _89=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithDuration:animationCurve:",_88,CPAnimationLinear);
objj_msgSend(_89,"setViewAnimations:",objj_msgSend(CPArray,"arrayWithObjects:",objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_82,CPViewAnimationTargetKey,objj_msgSend(_82,"frame"),CPViewAnimationStartFrameKey,objj_msgSend(_82,"frame"),CPViewAnimationEndFrameKey,CPViewAnimationFadeOutEffect,CPViewAnimationEffectKey),objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_83,CPViewAnimationTargetKey,objj_msgSend(_83,"frame"),CPViewAnimationStartFrameKey,objj_msgSend(_83,"frame"),CPViewAnimationEndFrameKey,CPViewAnimationFadeInEffect,CPViewAnimationEffectKey)));
objj_msgSend(_89,"startAnimation");
objj_msgSend(_84,"setFrame:display:animate:",_87,YES,YES);
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_88,_80,sel_getUid("_didTransitionWithTimer:"),objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_83,"toSubview",_82,"fromSubview"),NO);
}
}),new objj_method(sel_getUid("_didTransitionWithTimer:"),function(_8a,_8b,_8c){
with(_8a){
var _8d=objj_msgSend(_8c,"userInfo"),_8e=objj_msgSend(_8d,"objectForKey:","fromSubview"),_8f=objj_msgSend(_8d,"objectForKey:","toSubview");
objj_msgSend(_8a,"_didTransitionFromSubview:toSubview:",_8e,_8f);
}
}),new objj_method(sel_getUid("_willTransitionFromSubview:toSubview:"),function(_90,_91,_92,_93){
with(_90){
if(objj_msgSend(_93,"isEqual:",_resultView)){
objj_msgSend(_90,"_resultViewWillActivate");
}else{
if(objj_msgSend(_93,"isEqual:",_searchFormView)){
objj_msgSend(_90,"_searchViewWillActivate");
}
}
}
}),new objj_method(sel_getUid("_didTransitionFromSubview:toSubview:"),function(_94,_95,_96,_97){
with(_94){
if(objj_msgSend(_97,"isEqual:",_resultView)){
objj_msgSend(_94,"_resultViewDidActivate");
}else{
if(objj_msgSend(_97,"isEqual:",_searchFormView)){
objj_msgSend(_94,"_searchViewDidActivate");
}
}
}
}),new objj_method(sel_getUid("_resultViewWillActivate"),function(_98,_99){
with(_98){
objj_msgSend(objj_msgSend(objj_msgSend(_98,"view"),"window"),"setDefaultButton:",_selectButton);
objj_msgSend(_cancelButton,"setKeyEquivalent:",CPEscapeFunctionKey);
objj_msgSend(_cancelSearchButton,"setKeyEquivalent:",nil);
}
}),new objj_method(sel_getUid("_resultViewDidActivate"),function(_9a,_9b){
with(_9a){
objj_msgSend(objj_msgSend(objj_msgSend(_9a,"view"),"window"),"makeFirstResponder:",_matchesTableView);
}
}),new objj_method(sel_getUid("_searchViewWillActivate"),function(_9c,_9d){
with(_9c){
objj_msgSend(objj_msgSend(objj_msgSend(_9c,"view"),"window"),"setDefaultButton:",_submitSearchButton);
objj_msgSend(_cancelSearchButton,"setKeyEquivalent:",CPEscapeFunctionKey);
objj_msgSend(_cancelButton,"setKeyEquivalent:",nil);
}
}),new objj_method(sel_getUid("_searchViewDidActivate"),function(_9e,_9f){
with(_9e){
objj_msgSend(objj_msgSend(objj_msgSend(_9e,"view"),"window"),"makeFirstResponder:",_titleField);
objj_msgSend(_titleField,"selectAll:",_9e);
}
}),new objj_method(sel_getUid("tableViewRowWasDoubleClicked:"),function(_a0,_a1,_a2){
with(_a0){
objj_msgSend(_a0,"_selectSearchResult:",objj_msgSend(_a0,"_searchResultAtIndex:",objj_msgSend(_matchesTableView,"clickedRow")));
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_a3,_a4,_a5){
with(_a3){
return objj_msgSend(_searchResults,"count");
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_a6,_a7,_a8,_a9,_aa){
with(_a6){
return objj_msgSend(objj_msgSend(_searchResults,"objectAtIndex:",_aa),"valueForKey:",objj_msgSend(_a9,"identifier"));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("keyPathsForValuesAffectingMediaItemFileName"),function(_ab,_ac){
with(_ab){
return objj_msgSend(CPSet,"setWithObjects:","metadataItemWithFilePart","metadataItemWithFilePart.mainMediaItem.mainPart","metadataItemWithFilePart.mainMediaItem.mainPart.file");
}
})]);
p;38;DataSources/MMMediaMatchesDataSource.jt;3803;@STATIC;1.0;i;14;MMDataSource.ji;26;../Models/MMSearchResult.ji;26;../Models/MMMetadataItem.ji;19;../Models/MMAgent.ji;18;../Models/PMSURL.ji;27;../CPDictionary+URLParams.jt;3624;
objj_executeFile("MMDataSource.j",YES);
objj_executeFile("../Models/MMSearchResult.j",YES);
objj_executeFile("../Models/MMMetadataItem.j",YES);
objj_executeFile("../Models/MMAgent.j",YES);
objj_executeFile("../Models/PMSURL.j",YES);
objj_executeFile("../CPDictionary+URLParams.j",YES);
var _1=objj_allocateClassPair(MMDataSource,"MMMediaMatchesDataSource"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("refreshRecordsForMetadataItem:title:agent:language:year:manual:"),function(_3,_4,_5,_6,_7,_8,_9,_a){
with(_3){
objj_msgSend(_3,"refreshRecordsWithContextInfo:",objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_5||objj_msgSend(CPNull,"null"),"metadataItem",_6||objj_msgSend(CPNull,"null"),"title",_9||objj_msgSend(CPNull,"null"),"year",_7||objj_msgSend(CPNull,"null"),"agent",_8||objj_msgSend(CPNull,"null"),"language",_a||NO,"manual"));
}
}),new objj_method(sel_getUid("refreshRecordsWithContextInfo:manual:"),function(_b,_c,_d,_e){
with(_b){
_d=objj_msgSend(_d,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))?objj_msgSend(CPMutableDictionary,"dictionaryWithDictionary:",_d):objj_msgSend(CPMutableDictionary,"dictionaryWithObjectsAndKeys:",_d,"metadataItem");
objj_msgSend(_d,"setObject:forKey:",_e||NO,"manual");
objj_msgSend(_b,"refreshRecordsWithContextInfo:",_d);
}
}),new objj_method(sel_getUid("selectMatch:forMetadataItem:"),function(_f,_10,_11,_12){
with(_f){
objj_msgSend(_f,"updateRecord:contextInfo:URL:HTTPBody:",_11,_12,objj_msgSend(_f,"URLForUpdatedRecord:action:params:",_12,"match",objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[objj_msgSend(_11,"name"),objj_msgSend(_11,"guid")],["name","guid"])),objj_msgSend(_f,"HTTPBodyForUpdatedRecord:contextInfo:",_11,_12));
}
}),new objj_method(sel_getUid("refreshMatchForMetadataItem:"),function(_13,_14,_15){
with(_13){
objj_msgSend(_13,"updateRecord:contextInfo:URL:HTTPBody:",nil,_15,objj_msgSend(_13,"URLForUpdatedRecord:action:params:",_15,"refresh",nil),nil);
}
}),new objj_method(sel_getUid("unmatchItem:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_16,"updateRecord:contextInfo:URL:HTTPBody:",nil,_18,objj_msgSend(_16,"URLForUpdatedRecord:action:params:",_18,"unmatch",nil),nil);
}
}),new objj_method(sel_getUid("URLForUpdatedRecord:action:params:"),function(_19,_1a,_1b,_1c,_1d){
with(_19){
return objj_msgSend(PMSURL,"URLWithPath:params:",objj_msgSend(CPString,"stringWithFormat:","/library/metadata/%@/%@",objj_msgSend(_1b,"id"),_1c),_1d);
}
}),new objj_method(sel_getUid("URLForRecordsWithContextInfo:"),function(_1e,_1f,_20){
with(_1e){
var _21,_22;
if(objj_msgSend(_20,"isKindOfClass:",MMMetadataItem)){
_21=_20,_22=nil;
}else{
if(objj_msgSend(_20,"isKindOfClass:",CPDictionary)){
_20=objj_msgSend(_20,"copy");
_21=objj_msgSend(_20,"objectForKey:","metadataItem");
objj_msgSend(_20,"removeObjectForKey:","metadataItem");
_22=objj_msgSend(_20,"URLParamsOmittingNullValues:",YES);
}
}
return objj_msgSend(PMSURL,"URLWithPath:query:",objj_msgSend(CPString,"stringWithFormat:","/library/metadata/%@/matches",objj_msgSend(_21,"id")),_22);
}
}),new objj_method(sel_getUid("HTTPBodyForUpdatedRecord:contextInfo:"),function(_23,_24,_25,_26){
with(_23){
return nil;
}
}),new objj_method(sel_getUid("shouldProcessNode:contextInfo:"),function(_27,_28,_29,_2a){
with(_27){
return String(_29.nodeName)=="SearchResult";
}
}),new objj_method(sel_getUid("recordFromElement:contextInfo:"),function(_2b,_2c,_2d,_2e){
with(_2b){
var _2f=objj_msgSend(objj_msgSend(MMSearchResult,"alloc"),"init");
objj_msgSend(_2f,"setValuesForNodeAttributes:ignoreUndefinedKeys:",_2d,YES);
return _2f;
}
})]);
p;23;Models/MMSearchResult.jt;2680;@STATIC;1.0;I;21;Foundation/CPObject.jt;2635;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"MMSearchResult"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_guid"),new objj_ivar("_name"),new objj_ivar("_score"),new objj_ivar("_year")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("guid"),function(_3,_4){
with(_3){
return _guid;
}
}),new objj_method(sel_getUid("setGuid:"),function(_5,_6,_7){
with(_5){
_guid=_7;
}
}),new objj_method(sel_getUid("name"),function(_8,_9){
with(_8){
return _name;
}
}),new objj_method(sel_getUid("setName:"),function(_a,_b,_c){
with(_a){
_name=_c;
}
}),new objj_method(sel_getUid("score"),function(_d,_e){
with(_d){
return _score;
}
}),new objj_method(sel_getUid("setScore:"),function(_f,_10,_11){
with(_f){
_score=_11;
}
}),new objj_method(sel_getUid("year"),function(_12,_13){
with(_12){
return _year;
}
}),new objj_method(sel_getUid("setYear:"),function(_14,_15,_16){
with(_14){
_year=_16;
}
}),new objj_method(sel_getUid("setLanguage:"),function(_17,_18,_19){
with(_17){
if(objj_msgSend(_19,"isKindOfClass:",CPString)){
_language=objj_msgSend(objj_msgSend(LanguageConfig,"alloc"),"initWithCode:",_19);
}else{
if(objj_msgSend(_19,"isKindOfClass:",LanguageConfig)){
_language=_19;
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(CPString,"stringWithFormat:","language must be of type %@ (got %@)",LanguageConfig,objj_msgSend(_19,"class")));
}
}
}
}),new objj_method(sel_getUid("setLang:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSend(_1a,"setLanguage:",_1c);
}
}),new objj_method(sel_getUid("setScore:"),function(_1d,_1e,_1f){
with(_1d){
if(objj_msgSend(_1f,"isKindOfClass:",CPString)){
_score=parseInt(_1f,10);
}else{
if(objj_msgSend(_1f,"isKindOfClass:",CPNumber)){
_score=_1f;
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(CPString,"stringWithFormat:","score must be of type %@ (got %@)",CPNumber,objj_msgSend(_1f,"class")));
}
}
}
}),new objj_method(sel_getUid("setYear:"),function(_20,_21,_22){
with(_20){
if(objj_msgSend(_22,"isKindOfClass:",CPString)){
_year=parseInt(_22,10);
}else{
if(objj_msgSend(_22,"isKindOfClass:",CPNumber)){
_year=_22;
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(CPString,"stringWithFormat:","year must be of type %@ (got %@)",CPNumber,objj_msgSend(_22,"class")));
}
}
}
}),new objj_method(sel_getUid("description"),function(_23,_24){
with(_23){
return objj_msgSend(CPString,"stringWithFormat:","{MMSearchResult %@ (%@, %d) guid=%@/score=%d}",_name,objj_msgSend(_language,"languageCode"),_year,_guid,_score);
}
})]);
p;24;CPDictionary+URLParams.jt;1891;@STATIC;1.0;t;1872;
var _1=objj_getClass("CPDictionary");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPDictionary\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("URLParams"),function(_3,_4){
with(_3){
return objj_msgSend(_3,"URLParamsOmittingNullValues:",NO);
}
}),new objj_method(sel_getUid("URLParamsOmittingNullValues:"),function(_5,_6,_7){
with(_5){
var _8=objj_msgSend(CPArray,"array"),_9=objj_msgSend(_5,"keyEnumerator"),_a;
while(_a=objj_msgSend(_9,"nextObject")){
var _b=objj_msgSend(_5,"objectForKey:",_a);
if(!objj_msgSend(_b,"isKindOfClass:",CPArray)){
_b=objj_msgSend(CPArray,"arrayWithObject:",_b);
}
for(var i=0,_c=objj_msgSend(_b,"count");i<_c;i++){
var _d=_b[i];
if(objj_msgSend(_d,"respondsToSelector:",sel_getUid("asURLParam"))){
_d=objj_msgSend(_d,"asURLParam");
}
if(_7&&(_d===null||_d===undefined||objj_msgSend(objj_msgSend(CPNull,"null"),"isEqual:",_d))){
continue;
}
if(objj_msgSend(_d,"isEqual:",objj_msgSend(CPNull,"null"))){
_d="";
}
if(_d===true||_d===false){
_d=_d?"1":"0";
}
objj_msgSend(_8,"addObject:",objj_msgSend(CPString,"stringWithFormat:","%@=%@",encodeURIComponent(String(_a)),encodeURIComponent(String(_d))));
}
}
return objj_msgSend(_8,"componentsJoinedByString:","&");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("dictionaryFromURLParams:"),function(_e,_f,_10){
with(_e){
var _11=objj_msgSend(_10,"componentsSeparatedByString:","&"),_12=objj_msgSend(_11,"objectEnumerator"),_13,_14=objj_msgSend(_e,"dictionary");
while(_13=objj_msgSend(_12,"nextObject")){
var _15=objj_msgSend(_13,"rangeOfString:","="),key,_16;
if(CPEmptyRange(_15)){
key=_13,_16="";
}else{
key=objj_msgSend(_13,"substringToIndex:",_15.location),_16=objj_msgSend(_13,"substringFromIndex:",CPMaxRange(_15));
}
objj_msgSend(_14,"setObject:forKey:",decodeURIComponent(_16),decodeURIComponent(key));
}
return _14;
}
})]);
p;31;DataSources/MMAgentDataSource.jt;9713;@STATIC;1.0;i;14;MMDataSource.ji;19;../Models/MMAgent.ji;26;../Models/LanguageConfig.ji;18;../Models/PMSURL.jt;9597;
objj_executeFile("MMDataSource.j",YES);
objj_executeFile("../Models/MMAgent.j",YES);
objj_executeFile("../Models/LanguageConfig.j",YES);
objj_executeFile("../Models/PMSURL.j",YES);
var _1=objj_allocateClassPair(MMDataSource,"MMAgentDataSource"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_cache"),new objj_ivar("recordsByContributorConnection"),new objj_ivar("recordsByConfigConnection")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithDelegate:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMAgentDataSource").super_class},"initWithDelegate:",_5)){
_cache=objj_msgSend(CPDictionary,"dictionary");
recordsByContributorConnection=objj_msgSend(CPMutableDictionary,"dictionary");
recordsByConfigConnection=objj_msgSend(CPMutableDictionary,"dictionary");
}
return _3;
}
}),new objj_method(sel_getUid("cachedAgentsForMediaType:"),function(_6,_7,_8){
with(_6){
var _9=objj_msgSend(_6,"cacheValueForKey:",nil);
if(!_9){
return objj_msgSend(CPArray,"array");
}
if(_8==nil){
return _9;
}
var _a=objj_msgSend(CPMutableArray,"array");
objj_msgSend(_9,"enumerateObjectsUsingBlock:",function(_b){
if(objj_msgSend(objj_msgSend(_b,"mediaType"),"isEqual:",_8)){
objj_msgSend(_a,"addObject:",_b);
}
});
return _a;
}
}),new objj_method(sel_getUid("refreshRecord:contextInfo:"),function(_c,_d,_e,_f){
with(_c){
var _10,_11;
_10=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_c,"URLForRecordConfiguration:contextInfo:",_e,_f));
_11=objj_msgSend(objj_msgSend(MMURLConnection,"alloc"),"initWithRequest:delegate:startImmediately:",_10,_c,NO);
objj_msgSend(contextInfoByConnection,"setObject:forKey:",_f,_11);
objj_msgSend(recordsByConfigConnection,"setObject:forKey:",_e,_11);
objj_msgSend(_11,"start");
_10=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_c,"URLForRecordContributors:contextInfo:",_e,_f));
_11=objj_msgSend(objj_msgSend(MMURLConnection,"alloc"),"initWithRequest:delegate:startImmediately:",_10,_c,NO);
objj_msgSend(contextInfoByConnection,"setObject:forKey:",_f,_11);
objj_msgSend(recordsByContributorConnection,"setObject:forKey:",_e,_11);
objj_msgSend(_11,"start");
if(delegateRespondsTo_dataSource_didRequestRecord_contextInfo){
objj_msgSend(delegate,"dataSource:didRequestRecord:contextInfo:",_c,_e,_f);
}
objj_msgSend(notificationCenter,"postNotificationName:object:userInfo:",MMDataSourceDidRequestRecord,_c,objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[_f,_e],["contextInfo","record"]));
}
}),new objj_method(sel_getUid("updateContributors:forAgent:"),function(_12,_13,_14,_15){
with(_12){
var _16=objj_msgSend(CPMutableArray,"array");
objj_msgSend(_14,"enumerateObjectsUsingBlock:",function(_17){
objj_msgSend(_16,"addObject:",objj_msgSend(_17,"identifier"));
});
var _18=objj_msgSend(PMSURL,"URLWithPath:params:",objj_msgSend(_12,"URLForRecordConfiguration:contextInfo:",_15,nil),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_16,"componentsJoinedByString:",","),"order"));
objj_msgSend(_12,"updateRecord:contextInfo:URL:HTTPBody:",_15,nil,_18,nil);
}
}),new objj_method(sel_getUid("refreshRecordsWithContextInfo:"),function(_19,_1a,_1b){
with(_19){
var _1c=objj_msgSend(_19,"cacheValueForKey:",_1b);
if(!_1c){
objj_msgSendSuper({receiver:_19,super_class:objj_getClass("MMAgentDataSource").super_class},"refreshRecordsWithContextInfo:",_1b);
}else{
window.setTimeout(function(){
objj_msgSendSuper({receiver:_19,super_class:objj_getClass("MMAgentDataSource").super_class},"didReceiveRecords:connection:contextInfo:",_1c,nil,_1b);
},0);
}
}
}),new objj_method(sel_getUid("URLForRecordContributors:contextInfo:"),function(_1d,_1e,_1f,_20){
with(_1d){
return objj_msgSend(PMSURL,"URLWithPath:params:","/system/agents/contributors",objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[objj_msgSend(_1f,"identifier"),objj_msgSend(objj_msgSend(_1d,"class"),"codeForMediaTypeName:",objj_msgSend(_1f,"mediaType"))],["primaryAgent","mediaType"]));
}
}),new objj_method(sel_getUid("URLForRecordConfiguration:contextInfo:"),function(_21,_22,_23,_24){
with(_21){
return objj_msgSend(PMSURL,"URLWithPath:",objj_msgSend(CPString,"stringWithFormat:","/system/agents/%@/config/%@",objj_msgSend(_23,"identifier"),objj_msgSend(objj_msgSend(_21,"class"),"codeForMediaTypeName:",objj_msgSend(_23,"mediaType"))));
}
}),new objj_method(sel_getUid("URLForRecordsWithContextInfo:"),function(_25,_26,_27){
with(_25){
var _28=_27;
_28=objj_msgSend(objj_msgSend(_25,"class"),"codeForMediaTypeName:",_28)||_28;
return objj_msgSend(PMSURL,"URLWithPath:params:","/system/agents",_28&&objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_28,"mediaType"));
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_29,_2a,_2b,_2c){
with(_29){
var _2d=objj_msgSend(statusCodeByConnection,"objectForKey:",_2b),_2e=objj_msgSend(contextInfoByConnection,"objectForKey:",_2b),_2f=objj_msgSend(recordsByContributorConnection,"containsKey:",_2b)||objj_msgSend(recordsByConfigConnection,"containsKey:",_2b);
if(!_2d||_2d>=400){
objj_msgSendSuper({receiver:_29,super_class:objj_getClass("MMAgentDataSource").super_class},"connection:didReceiveData:",_2b,_2c);
}else{
if(_2f){
objj_msgSend(_29,"didReceiveRecordsAsData:connection:contextInfo:",_2c,_2b,_2f);
objj_msgSend(recordsByConfigConnection,"removeObjectForKey:",_2b);
objj_msgSend(recordsByContributorConnection,"removeObjectForKey:",_2b);
}else{
objj_msgSendSuper({receiver:_29,super_class:objj_getClass("MMAgentDataSource").super_class},"connection:didReceiveData:",_2b,_2c);
}
}
}
}),new objj_method(sel_getUid("shouldProcessNode:contextInfo:"),function(_30,_31,_32,_33){
with(_30){
return String(_32.nodeName)=="Agent";
}
}),new objj_method(sel_getUid("recordsFromElement:contextInfo:"),function(_34,_35,_36,_37){
with(_34){
var _38=objj_msgSend(CPArray,"array"),_39=objj_msgSend(objj_msgSend(MMAgent,"alloc"),"init");
objj_msgSend(_39,"setValuesForNodeAttributes:ignoreUndefinedKeys:",_36,YES);
if(_36.getAttribute("primary")!==null){
objj_msgSend(_39,"setPrimary:",_36.getAttribute("primary")=="1");
}
var _3a=_36.childNodes;
if(objj_msgSend(_37,"isKindOfClass:",objj_msgSend(MMAgent,"class"))){
objj_msgSend(_38,"addObject:",_39);
}else{
if(_37){
objj_msgSend(_39,"setLanguages:",objj_msgSend(_34,"languagesFromNodeList:",_3a));
objj_msgSend(_39,"setMediaType:",_37);
objj_msgSend(_38,"addObject:",_39);
}else{
for(var i=0,_3b=_3a.length;i<_3b;i++){
var _3c=_3a[i];
if(String(_3c.nodeName)!="MediaType"){
continue;
}
agentForMediaType=objj_msgSend(_39,"copy");
objj_msgSend(agentForMediaType,"setName:",String(_3c.getAttribute("name")));
objj_msgSend(agentForMediaType,"setLanguages:",objj_msgSend(_34,"languagesFromNodeList:",_3c.childNodes));
objj_msgSend(agentForMediaType,"setMediaType:",objj_msgSend(objj_msgSend(_34,"class"),"mediaTypeNameForCode:",String(_3c.getAttribute("mediaType"))));
objj_msgSend(_38,"addObject:",agentForMediaType);
}
}
}
return _38;
}
}),new objj_method(sel_getUid("languagesFromNodeList:"),function(_3d,_3e,_3f){
with(_3d){
var _40=objj_msgSend(CPArray,"array"),_41=nil;
for(var i=_3f.length;i--;){
var _41=_3f[i];
if(String(_41.nodeName)=="Language"){
var _42=objj_msgSend(objj_msgSend(LanguageConfig,"alloc"),"initWithCode:",_41.getAttribute("code"));
objj_msgSend(_40,"insertObject:atIndex:",_42,0);
}
}
return _40;
}
}),new objj_method(sel_getUid("didReceiveRecords:connection:contextInfo:"),function(_43,_44,_45,_46,_47){
with(_43){
if(objj_msgSend(recordsByConfigConnection,"containsKey:",_46)){
var _48=objj_msgSend(recordsByConfigConnection,"objectForKey:",_46);
objj_msgSend(_48,"setConfiguredAgents:",_45);
objj_msgSendSuper({receiver:_43,super_class:objj_getClass("MMAgentDataSource").super_class},"didReceiveRecords:connection:contextInfo:",[_48],_46,_48);
}else{
if(objj_msgSend(recordsByContributorConnection,"containsKey:",_46)){
var _48=objj_msgSend(recordsByContributorConnection,"objectForKey:",_46);
objj_msgSend(_48,"setContributingAgents:",_45);
objj_msgSendSuper({receiver:_43,super_class:objj_getClass("MMAgentDataSource").super_class},"didReceiveRecords:connection:contextInfo:",[_48],_46,_48);
}else{
objj_msgSend(_43,"setCacheValue:forKey:",_45,_47);
objj_msgSendSuper({receiver:_43,super_class:objj_getClass("MMAgentDataSource").super_class},"didReceiveRecords:connection:contextInfo:",_45,_46,_47);
}
}
}
}),new objj_method(sel_getUid("setCacheValue:forKey:"),function(_49,_4a,_4b,key){
with(_49){
CPLog.debug("[%@ %@] cache SET for key=%@",objj_msgSend(_49,"class"),_4a,key);
objj_msgSend(_cache,"setValue:forKey:",_4b,objj_msgSend(_49,"_cacheKeyForContextInfo:",key));
}
}),new objj_method(sel_getUid("cacheValueForKey:"),function(_4c,_4d,key){
with(_4c){
var _4e=objj_msgSend(_cache,"valueForKey:",objj_msgSend(_4c,"_cacheKeyForContextInfo:",key));
CPLog.debug("[%@ -cacheValueForKey:] cache %@ for key=%@",objj_msgSend(_4c,"class"),_4e?"HIT":"MISS",key);
return _4e;
}
}),new objj_method(sel_getUid("_cacheKeyForContextInfo:"),function(_4f,_50,_51){
with(_4f){
if(objj_msgSend(_51,"respondsToSelector:",sel_getUid("stringValue"))){
return objj_msgSend(_51,"stringValue");
}else{
return _51||"null";
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("codeForMediaTypeName:"),function(_52,_53,_54){
with(_52){
return objj_msgSend(MediaTypeCodeMap,"objectForKey:",_54);
}
}),new objj_method(sel_getUid("mediaTypeNameForCode:"),function(_55,_56,_57){
with(_55){
var _58=objj_msgSend(MediaTypeCodeMap,"allKeysForObject:",_57);
if(objj_msgSend(_58,"count")==0){
return nil;
}
return objj_msgSend(_58,"objectAtIndex:",0);
}
})]);
p;17;Views/MMSpinner.jt;4687;@STATIC;1.0;I;15;AppKit/CPView.jt;4648;
objj_executeFile("AppKit/CPView.j",NO);
var _1;
var _2=objj_allocateClassPair(CPView,"MMSpinner"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("lines"),new objj_ivar("length"),new objj_ivar("width"),new objj_ivar("radius"),new objj_ivar("trail"),new objj_ivar("speed"),new objj_ivar("shadow"),new objj_ivar("color"),new objj_ivar("spinner")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("lines"),function(_4,_5){
with(_4){
return lines;
}
}),new objj_method(sel_getUid("setLines:"),function(_6,_7,_8){
with(_6){
lines=_8;
}
}),new objj_method(sel_getUid("length"),function(_9,_a){
with(_9){
return length;
}
}),new objj_method(sel_getUid("setLength:"),function(_b,_c,_d){
with(_b){
length=_d;
}
}),new objj_method(sel_getUid("width"),function(_e,_f){
with(_e){
return width;
}
}),new objj_method(sel_getUid("setWidth:"),function(_10,_11,_12){
with(_10){
width=_12;
}
}),new objj_method(sel_getUid("radius"),function(_13,_14){
with(_13){
return radius;
}
}),new objj_method(sel_getUid("setRadius:"),function(_15,_16,_17){
with(_15){
radius=_17;
}
}),new objj_method(sel_getUid("trail"),function(_18,_19){
with(_18){
return trail;
}
}),new objj_method(sel_getUid("setTrail:"),function(_1a,_1b,_1c){
with(_1a){
trail=_1c;
}
}),new objj_method(sel_getUid("speed"),function(_1d,_1e){
with(_1d){
return speed;
}
}),new objj_method(sel_getUid("setSpeed:"),function(_1f,_20,_21){
with(_1f){
speed=_21;
}
}),new objj_method(sel_getUid("hasShadow"),function(_22,_23){
with(_22){
return shadow;
}
}),new objj_method(sel_getUid("setShadow:"),function(_24,_25,_26){
with(_24){
shadow=_26;
}
}),new objj_method(sel_getUid("color"),function(_27,_28){
with(_27){
return color;
}
}),new objj_method(sel_getUid("setColor:"),function(_29,_2a,_2b){
with(_29){
color=_2b;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_2c,_2d,_2e){
with(_2c){
if(_2c=objj_msgSendSuper({receiver:_2c,super_class:objj_getClass("MMSpinner").super_class},"initWithFrame:",_2e)){
if(!_1){
_1=new Spinner().opts;
}
objj_msgSend(_2c,"setLines:",_1.lines);
objj_msgSend(_2c,"setLength:",_1.length);
objj_msgSend(_2c,"setWidth:",_1.width);
objj_msgSend(_2c,"setRadius:",_1.radius);
objj_msgSend(_2c,"setTrail:",_1.trail);
objj_msgSend(_2c,"setSpeed:",_1.speed);
objj_msgSend(_2c,"setShadow:",_1.shadow);
objj_msgSend(_2c,"setColor:",objj_msgSend(CPColor,"colorWithHexString:",objj_msgSend(_1.color,"stringByReplacingOccurrencesOfString:withString:","#","")));
}
return _2c;
}
}),new objj_method(sel_getUid("start"),function(_2f,_30){
with(_2f){
objj_msgSend(_2f,"stop");
spinner=new Spinner(objj_msgSend(_2f,"spinnerOptions")).spin();
spinner.el.style.left=(CGRectGetWidth(objj_msgSend(_2f,"frame"))/2)+"px";
spinner.el.style.top=(CGRectGetHeight(objj_msgSend(_2f,"frame"))/2)+"px";
_2f._DOMElement.appendChild(spinner.el);
}
}),new objj_method(sel_getUid("stop"),function(_31,_32){
with(_31){
if(spinner){
spinner.stop();
}
spinner=nil;
}
}),new objj_method(sel_getUid("sync"),function(_33,_34){
with(_33){
if(spinner){
objj_msgSend(_33,"stop");
objj_msgSend(_33,"start");
}
}
}),new objj_method(sel_getUid("setLines:"),function(_35,_36,_37){
with(_35){
if(lines===_37){
return;
}
lines=_37;
objj_msgSend(_35,"sync");
}
}),new objj_method(sel_getUid("setLength:"),function(_38,_39,_3a){
with(_38){
if(length===_3a){
return;
}
length=_3a;
objj_msgSend(_38,"sync");
}
}),new objj_method(sel_getUid("setWidth:"),function(_3b,_3c,_3d){
with(_3b){
if(width===_3d){
return;
}
width=_3d;
objj_msgSend(_3b,"sync");
}
}),new objj_method(sel_getUid("setRadius:"),function(_3e,_3f,_40){
with(_3e){
if(radius===_40){
return;
}
radius=_40;
objj_msgSend(_3e,"sync");
}
}),new objj_method(sel_getUid("setTrail:"),function(_41,_42,_43){
with(_41){
if(trail===_43){
return;
}
trail=_43;
objj_msgSend(_41,"sync");
}
}),new objj_method(sel_getUid("setSpeed:"),function(_44,_45,_46){
with(_44){
if(speed===_46){
return;
}
speed=_46;
objj_msgSend(_44,"sync");
}
}),new objj_method(sel_getUid("setShadow:"),function(_47,_48,_49){
with(_47){
if(shadow===!!_49){
return;
}
shadow=!!_49;
objj_msgSend(_47,"sync");
}
}),new objj_method(sel_getUid("setColor:"),function(_4a,_4b,_4c){
with(_4a){
if(objj_msgSend(color,"isEqual:",_4c)){
return;
}
color=_4c;
objj_msgSend(_4a,"sync");
}
}),new objj_method(sel_getUid("spinnerOptions"),function(_4d,_4e){
with(_4d){
return {lines:objj_msgSend(_4d,"lines"),length:objj_msgSend(_4d,"length"),width:objj_msgSend(_4d,"width"),radius:objj_msgSend(_4d,"radius"),trail:objj_msgSend(_4d,"trail"),speed:objj_msgSend(_4d,"speed"),shadow:objj_msgSend(_4d,"hasShadow"),color:"#"+objj_msgSend(objj_msgSend(_4d,"color"),"hexString")};
}
})]);
p;38;DataSources/MMMetadataItemDataSource.jt;1958;@STATIC;1.0;I;21;Foundation/CPObject.ji;23;../Models/MMMediaItem.ji;26;MMLibraryMediaDataSource.ji;27;../CPObject+XMLAttributes.jt;1822;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("../Models/MMMediaItem.j",YES);
objj_executeFile("MMLibraryMediaDataSource.j",YES);
objj_executeFile("../CPObject+XMLAttributes.j",YES);
var _1=objj_allocateClassPair(MMLibraryMediaDataSource,"MMMetadataItemDataSource"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("URLForRecord:contextInfo:"),function(_3,_4,_5,_6){
with(_3){
return objj_msgSend(PMSURL,"URLWithPath:",objj_msgSend(CPString,"stringWithFormat:","/library/metadata/%@",objj_msgSend(_5,"id")));
}
}),new objj_method(sel_getUid("recordFromElement:contextInfo:"),function(_7,_8,_9,_a){
with(_7){
var _b=String(_9.getAttribute("key")),id=objj_msgSend(MMMetadataItem,"idFromKey:",_b),_c=_b;
if(!objj_msgSend(_c,"hasPrefix:","/")&&_a){
_c=objj_msgSend(CPString,"stringWithFormat:","%@/%@",objj_msgSend(_a,"path"),_b);
}
var _d=objj_msgSend(objj_msgSend(_7,"dataStore"),"recordWithClass:id:",objj_msgSend(MMMetadataItem,"class"),_c);
objj_msgSend(_d,"setPath:",_c);
objj_msgSend(_7,"readValuesForRecord:fromElement:",_d,_9);
if(_a){
objj_msgSend(_d,"setParent:",_a);
}
objj_msgSend(_d,"setWriters:",[]);
objj_msgSend(_d,"setDirectors:",[]);
objj_msgSend(_d,"setGenres:",[]);
objj_msgSend(_d,"setCollections:",[]);
objj_msgSend(_d,"unlockAllAttributes");
var _e=_9.childNodes;
for(var i=_e.length;i--;){
var _f=_e[i];
switch(String(_f.nodeName)){
case "Field":
var _10=_f.getAttribute("name"),_11=(_f.getAttribute("locked")=="1"),_12=_10+"Locked";
objj_msgSend(_d,"setValue:forKey:ignoreUndefinedKey:",_11,_12,YES);
break;
case "Writer":
case "Director":
case "Genre":
case "Collection":
objj_msgSend(_d,"addTag:forType:",_f.getAttribute("tag"),String(_f.nodeName).toLowerCase()+"s");
break;
}
}
objj_msgSend(_d,"acceptChangedAttributes");
return _d;
}
})]);
p;32;Views/MMCollectionViewItemCell.jt;5539;@STATIC;1.0;i;17;MMSelectionView.ji;12;MMLazyView.ji;13;MMImageView.jt;5463;
objj_executeFile("MMSelectionView.j",YES);
objj_executeFile("MMLazyView.j",YES);
objj_executeFile("MMImageView.j",YES);
var _1=4;
var _2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","BlankPoster.png"));
var _3=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","AlertCautionIcon.png"));
var _4=CGSizeMake(148,156);
var _5=objj_allocateClassPair(MMLazyView,"MMCollectionViewItemCell"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("_representedObject"),new objj_ivar("_image"),new objj_ivar("_imageView"),new objj_ivar("_titleLabel"),new objj_ivar("_subtitleLabel"),new objj_ivar("trashedFlagView"),new objj_ivar("_thumbSize"),new objj_ivar("_thumbMargin"),new objj_ivar("_selectionView"),new objj_ivar("_allowsSelection")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("representedObject"),function(_7,_8){
with(_7){
return _representedObject;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_9,_a,_b){
with(_9){
_representedObject=_b;
}
}),new objj_method(sel_getUid("image"),function(_c,_d){
with(_c){
return _image;
}
}),new objj_method(sel_getUid("setImage:"),function(_e,_f,_10){
with(_e){
_image=_10;
}
}),new objj_method(sel_getUid("imageView"),function(_11,_12){
with(_11){
return _imageView;
}
}),new objj_method(sel_getUid("setImageView:"),function(_13,_14,_15){
with(_13){
_imageView=_15;
}
}),new objj_method(sel_getUid("titleLabel"),function(_16,_17){
with(_16){
return _titleLabel;
}
}),new objj_method(sel_getUid("setTitleLabel:"),function(_18,_19,_1a){
with(_18){
_titleLabel=_1a;
}
}),new objj_method(sel_getUid("subtitleLabel"),function(_1b,_1c){
with(_1b){
return _subtitleLabel;
}
}),new objj_method(sel_getUid("setSubtitleLabel:"),function(_1d,_1e,_1f){
with(_1d){
_subtitleLabel=_1f;
}
}),new objj_method(sel_getUid("_allowsSelection"),function(_20,_21){
with(_20){
return _allowsSelection;
}
}),new objj_method(sel_getUid("_setAllowsSelection:"),function(_22,_23,_24){
with(_22){
_allowsSelection=_24;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_25,_26,_27){
with(_25){
if(_representedObject==_27){
return;
}
_representedObject=_27;
}
}),new objj_method(sel_getUid("loadView"),function(_28,_29){
with(_28){
if(_thumbSize===nil){
_thumbSize=_4;
}
if(_thumbMargin===nil){
_thumbMargin=12;
}
if(_allowsSelection===nil){
_allowsSelection=YES;
}
var _2a=CGRectGetWidth(objj_msgSend(_28,"frame")),_2b=CGRectGetHeight(objj_msgSend(_28,"frame"));
if(!_subtitleLabel){
_subtitleLabel=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(_subtitleLabel,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",10));
objj_msgSend(_subtitleLabel,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_subtitleLabel,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_subtitleLabel,"setFrame:",CGRectMake(0,_2b-15-CGRectGetHeight(objj_msgSend(_subtitleLabel,"frame")),_2a,CGRectGetHeight(objj_msgSend(_subtitleLabel,"frame"))));
objj_msgSend(_28,"addSubview:",_subtitleLabel);
}
if(!_titleLabel){
_titleLabel=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(_titleLabel,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_titleLabel,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_titleLabel,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_titleLabel,"setFrame:",CGRectMake(0,CGRectGetMinY(objj_msgSend(_subtitleLabel,"frame"))-CGRectGetHeight(objj_msgSend(_titleLabel,"frame")),_2a,CGRectGetHeight(objj_msgSend(_subtitleLabel,"frame"))));
objj_msgSend(_28,"addSubview:",_titleLabel);
}
if(!_imageView){
_imageView=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(_thumbMargin,0,CGRectGetWidth(objj_msgSend(_28,"frame"))-_thumbMargin*2,CGRectGetHeight(objj_msgSend(_28,"frame"))-CGRectGetHeight(objj_msgSend(_titleLabel,"frame"))-CGRectGetHeight(objj_msgSend(_subtitleLabel,"frame"))-3-_thumbMargin*2));
objj_msgSend(_imageView,"setBorderRadius:",4);
objj_msgSend(_imageView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_imageView,"setImageScaling:",CPScaleProportionally);
objj_msgSend(_imageView,"setImageAlignment:",CPImageAlignBottom);
objj_msgSend(_imageView,"setHasShadow:",YES);
objj_msgSend(_imageView,"setSizeConstraint:",_4);
objj_msgSend(_imageView,"setPlaceholder:",_2);
objj_msgSend(_imageView,"bind:toObject:withKeyPath:options:",CPValueBinding,_28,"image",nil);
objj_msgSend(_28,"addSubview:",_imageView);
}
if(!trashedFlagView){
var _2c=28,_2d=28;
trashedFlagView=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_imageView,"frame"))+14,CGRectGetMaxY(objj_msgSend(_imageView,"frame"))-_2d-14,_2c,_2d));
objj_msgSend(trashedFlagView,"setImage:",_3);
objj_msgSend(trashedFlagView,"bind:toObject:withKeyPath:options:","hidden",_28,"representedObject.deletedAt",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPIsNilTransformerName,CPValueTransformerNameBindingOption));
objj_msgSend(_28,"addSubview:",trashedFlagView);
}
}
}),new objj_method(sel_getUid("setSelected:"),function(_2e,_2f,_30){
with(_2e){
if(_allowsSelection&&_30&&!_selectionView&&_imageView){
_selectionView=objj_msgSend(MMSelectionView,"selectionViewForView:",_imageView);
}
objj_msgSend(_selectionView,"setSelected:",_30);
}
})]);
p;23;Views/MMSelectionView.jt;7803;@STATIC;1.0;i;13;MMImageView.jt;7766;
objj_executeFile("MMImageView.j",YES);
MMSelectionViewDefaultSelectionBorderRadius=4;
MMSelectionViewDefaultGradientStartColor=objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",225/255,170/255,84/255,1);
MMSelectionViewDefaultGradientEndColor=objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",121/255,69/255,30/255,1);
var _1=objj_allocateClassPair(CPView,"MMSelectionView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_selected"),new objj_ivar("_selectionBorderLayer"),new objj_ivar("_selectionBorderRadius"),new objj_ivar("_selectableView"),new objj_ivar("_autoresizeToFitSelectableView"),new objj_ivar("_originalHasShadowValue"),new objj_ivar("_gradientStartColor"),new objj_ivar("_gradientEndColor")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("isSelected"),function(_3,_4){
with(_3){
return _selected;
}
}),new objj_method(sel_getUid("setSelected:"),function(_5,_6,_7){
with(_5){
_selected=_7;
}
}),new objj_method(sel_getUid("selectionBorderRadius"),function(_8,_9){
with(_8){
return _selectionBorderRadius;
}
}),new objj_method(sel_getUid("setSelectionBorderRadius:"),function(_a,_b,_c){
with(_a){
_selectionBorderRadius=_c;
}
}),new objj_method(sel_getUid("selectableView"),function(_d,_e){
with(_d){
return _selectableView;
}
}),new objj_method(sel_getUid("setSelectableView:"),function(_f,_10,_11){
with(_f){
_selectableView=_11;
}
}),new objj_method(sel_getUid("shouldAutoresizeToFitSelectableView"),function(_12,_13){
with(_12){
return _autoresizeToFitSelectableView;
}
}),new objj_method(sel_getUid("setAutoresizesToFitSelectableView:"),function(_14,_15,_16){
with(_14){
_autoresizeToFitSelectableView=_16;
}
}),new objj_method(sel_getUid("gradientStartColor"),function(_17,_18){
with(_17){
return _gradientStartColor;
}
}),new objj_method(sel_getUid("setGradientStartColor:"),function(_19,_1a,_1b){
with(_19){
_gradientStartColor=_1b;
}
}),new objj_method(sel_getUid("gradientEndColor"),function(_1c,_1d){
with(_1c){
return _gradientEndColor;
}
}),new objj_method(sel_getUid("setGradientEndColor:"),function(_1e,_1f,_20){
with(_1e){
_gradientEndColor=_20;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_21,_22,_23){
with(_21){
if(_21=objj_msgSend(_21,"initWithFrame:borderRadius:",_23,MMSelectionViewDefaultSelectionBorderRadius)){
return _21;
}
}
}),new objj_method(sel_getUid("initWithFrame:borderRadius:"),function(_24,_25,_26,_27){
with(_24){
if(_24=objj_msgSendSuper({receiver:_24,super_class:objj_getClass("MMSelectionView").super_class},"initWithFrame:",_26)){
_selected=NO;
_selectionBorderRadius=_27;
_gradientStartColor=MMSelectionViewDefaultGradientStartColor;
_gradientEndColor=MMSelectionViewDefaultGradientEndColor;
_autoresizeToFitSelectableView=YES;
}
return _24;
}
}),new objj_method(sel_getUid("isSelected"),function(_28,_29){
with(_28){
return _selected;
}
}),new objj_method(sel_getUid("setSelected:"),function(_2a,_2b,_2c){
with(_2a){
if(_selected==_2c){
return;
}
_selected=_2c;
if(_2c&&!_selectionBorderLayer){
_selectionBorderLayer=objj_msgSend(CALayer,"layer");
objj_msgSend(_selectionBorderLayer,"setDelegate:",_2a);
objj_msgSend(_2a,"setLayer:",_selectionBorderLayer);
}
objj_msgSend(_2a,"setHidden:",!_2c);
}
}),new objj_method(sel_getUid("shouldAutoresizeToFitSelectableView"),function(_2d,_2e){
with(_2d){
return _autoresizeToFitSelectableView;
}
}),new objj_method(sel_getUid("setAutoresizesToFitSelectableView:"),function(_2f,_30,_31){
with(_2f){
if(_31==_autoresizeToFitSelectableView){
return;
}
if(!_31&&_selectableView){
objj_msgSend(_2f,"_stopObservingSelectableViewFrameChanges");
}else{
if(_31&&_selectableView){
objj_msgSend(_2f,"_startObservingSelectableViewFrameChanges");
}
}
}
}),new objj_method(sel_getUid("setSelectableView:"),function(_32,_33,_34){
with(_32){
if(objj_msgSend(_selectableView,"isEqual:",_34)){
return;
}
if(_selectableView&&_autoresizeToFitSelectableView){
objj_msgSend(_32,"_stopObservingSelectableViewFrameChanges");
}
_selectableView=_34;
if(_selectableView&&_autoresizeToFitSelectableView){
objj_msgSend(_32,"_startObservingSelectableViewFrameChanges");
}
if(objj_msgSend(_selectableView,"isKindOfClass:",CPImageView)){
_originalHasShadowValue=objj_msgSend(_selectableView,"hasShadow");
}
}
}),new objj_method(sel_getUid("_startObservingSelectableViewFrameChanges"),function(_35,_36){
with(_35){
if(objj_msgSend(_selectableView,"isKindOfClass:",MMImageView)){
objj_msgSend(_35,"bind:toObject:withKeyPath:options:","imageRect",_selectableView,"imageRect",nil);
}else{
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_35,sel_getUid("_selectableViewFrameDidChange:"),CPViewFrameDidChangeNotification,_selectableView);
objj_msgSend(_selectableView,"setPostsFrameChangedNotifications:",YES);
}
}
}),new objj_method(sel_getUid("_stopObservingSelectableViewFrameChanges"),function(_37,_38){
with(_37){
if(objj_msgSend(_selectableView,"isKindOfClass:",MMImageView)){
objj_msgSend(_37,"unbind:","imageRect");
}else{
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_37,CPViewFrameDidChangeNotification,_selectableView);
objj_msgSend(_selectableView,"setPostsFrameChangedNotifications:",NO);
}
}
}),new objj_method(sel_getUid("setImageRect:"),function(_39,_3a,_3b){
with(_39){
objj_msgSend(_39,"_selectableViewFrameDidChange:",nil);
}
}),new objj_method(sel_getUid("_selectableViewFrameDidChange:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(_3c,"setFrame:",objj_msgSend(objj_msgSend(_3c,"class"),"containerFrameForSelectableView:selectionBorderRadius:",_selectableView,_selectionBorderRadius));
}
}),new objj_method(sel_getUid("drawLayer:inContext:"),function(_3f,_40,_41,_42){
with(_3f){
var _43=_selectionBorderRadius,_44=objj_msgSend(_3f,"bounds");
CGContextSetFillColor(_42,_gradientStartColor);
CGContextFillRoundedRectangleInRect(_42,_44,_43,YES,YES,YES,YES);
if(!CPFeatureIsCompatible(CPHTMLCanvasFeature)){
return;
}
var _45;
var _46;
var _47=2;
var _48=[0,0.5];
var _49=[objj_msgSend(_gradientStartColor,"redComponent"),objj_msgSend(_gradientStartColor,"greenComponent"),objj_msgSend(_gradientStartColor,"blueComponent"),objj_msgSend(_gradientStartColor,"alphaComponent"),objj_msgSend(_gradientEndColor,"redComponent"),objj_msgSend(_gradientEndColor,"greenComponent"),objj_msgSend(_gradientEndColor,"blueComponent"),objj_msgSend(_gradientEndColor,"alphaComponent")];
_46=CGColorSpaceCreateDeviceRGB();
_45=CGGradientCreateWithColorComponents(_46,_49,_48,_47);
var _4a=CGPointMake(0,CGRectGetMinY(_44)),_4b=CGPointMake(1,CGRectGetMaxY(_44));
CGContextClip(_42);
CGContextDrawLinearGradient(_42,_45,_4a,_4b,0);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("selectionViewForView:"),function(_4c,_4d,_4e){
with(_4c){
return objj_msgSend(_4c,"selectionViewForView:selectionBorderRadius:",_4e,MMSelectionViewDefaultSelectionBorderRadius);
}
}),new objj_method(sel_getUid("selectionViewForView:selectionBorderRadius:"),function(_4f,_50,_51,_52){
with(_4f){
var _53=objj_msgSend(_4f,"containerFrameForSelectableView:selectionBorderRadius:",_51,_52),_54=objj_msgSend(objj_msgSend(_4f,"alloc"),"initWithFrame:borderRadius:",_53,_52);
objj_msgSend(_54,"setSelectableView:",_51);
objj_msgSend(objj_msgSend(_51,"superview"),"addSubview:positioned:relativeTo:",_54,CPWindowBelow,_51);
return _54;
}
}),new objj_method(sel_getUid("containerFrameForSelectableView:selectionBorderRadius:"),function(_55,_56,_57,_58){
with(_55){
var _59;
if(objj_msgSend(_57,"isKindOfClass:",CPImageView)){
if(_59=objj_msgSend(_57,"imageRect")){
_59=CGRectOffset(_59,CGRectGetMinX(objj_msgSend(_57,"frame")),CGRectGetMinY(objj_msgSend(_57,"frame")));
}
}
if(!_59){
_59=objj_msgSend(_57,"frame");
}
_59=CGRectInset(_59,-_58,-_58);
return _59;
}
})]);
p;19;Views/MMImageView.jt;9437;@STATIC;1.0;I;20;AppKit/CPImageView.jt;9393;
objj_executeFile("AppKit/CPImageView.j",NO);
var _1=["-o-","-moz-","-ms-","-webkit-","-khtml-",""];
DOMSupportsBorderRadius=(function(){
var _2=document.createElement("img");
for(var i=0;i<_1.length;i++){
_2.style.cssText=_1[i]+"border-radius:0;";
if(_2.style.cssText&&_2.style.cssText.length>0){
return YES;
}
}
return NO;
})();
DOMSupportsBoxShadow=(function(){
var _3=document.createElement("img");
for(var i=0;i<_1.length;i++){
_3.style.cssText=_1[i]+"box-shadow: 0 0 0 red;";
if(_3.style.cssText&&_3.style.cssText.length>0){
return YES;
}
}
return NO;
})();
var _4=objj_allocateClassPair(CPImageView,"MMImageView"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_borderRadius"),new objj_ivar("_shadowOffset"),new objj_ivar("_shadowBlurDistance"),new objj_ivar("_shadowColor"),new objj_ivar("_placeholder"),new objj_ivar("_imageToBeDrawn"),new objj_ivar("_sizeConstraint"),new objj_ivar("inverted")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("borderRadius"),function(_6,_7){
with(_6){
return _borderRadius;
}
}),new objj_method(sel_getUid("setBorderRadius:"),function(_8,_9,_a){
with(_8){
_borderRadius=_a;
}
}),new objj_method(sel_getUid("shadowOffset"),function(_b,_c){
with(_b){
return _shadowOffset;
}
}),new objj_method(sel_getUid("setShadowOffset:"),function(_d,_e,_f){
with(_d){
_shadowOffset=_f;
}
}),new objj_method(sel_getUid("shadowBlurDistance"),function(_10,_11){
with(_10){
return _shadowBlurDistance;
}
}),new objj_method(sel_getUid("setShadowBlurDistance:"),function(_12,_13,_14){
with(_12){
_shadowBlurDistance=_14;
}
}),new objj_method(sel_getUid("shadowColor"),function(_15,_16){
with(_15){
return _shadowColor;
}
}),new objj_method(sel_getUid("setShadowColor:"),function(_17,_18,_19){
with(_17){
_shadowColor=_19;
}
}),new objj_method(sel_getUid("placeholder"),function(_1a,_1b){
with(_1a){
return _placeholder;
}
}),new objj_method(sel_getUid("setPlaceholder:"),function(_1c,_1d,_1e){
with(_1c){
_placeholder=_1e;
}
}),new objj_method(sel_getUid("sizeConstraint"),function(_1f,_20){
with(_1f){
return _sizeConstraint;
}
}),new objj_method(sel_getUid("setSizeConstraint:"),function(_21,_22,_23){
with(_21){
_sizeConstraint=_23;
}
}),new objj_method(sel_getUid("inverted"),function(_24,_25){
with(_24){
return inverted;
}
}),new objj_method(sel_getUid("setInverted:"),function(_26,_27,_28){
with(_26){
inverted=_28;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_29,_2a,_2b){
with(_29){
if(_29=objj_msgSendSuper({receiver:_29,super_class:objj_getClass("MMImageView").super_class},"initWithFrame:",_2b)){
_shadowOffset=CGSizeMake(0,0);
_shadowBlurDistance=8;
_shadowColor=objj_msgSend(CPColor,"colorWithWhite:alpha:",10/255,1);
}
return _29;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_2c,_2d,_2e){
with(_2c){
if(_sizeConstraint){
_2e=objj_msgSend(_2e,"constrainedToSize:",_sizeConstraint);
}
if(_2e&&(!_placeholder||(objj_msgSend(_2e,"loadStatus")==CPImageLoadStatusCompleted))){
objj_msgSendSuper({receiver:_2c,super_class:objj_getClass("MMImageView").super_class},"setObjectValue:",_2e);
objj_msgSend(_2e,"load");
objj_msgSend(objj_msgSend(_2c,"layer"),"setNeedsDisplay");
}else{
if(_imageToBeDrawn){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_2c,CPImageDidLoadNotification,_imageToBeDrawn);
}
_imageToBeDrawn=_2e;
objj_msgSendSuper({receiver:_2c,super_class:objj_getClass("MMImageView").super_class},"setObjectValue:",_placeholder);
objj_msgSend(objj_msgSend(_2c,"layer"),"setNeedsDisplay");
if(_imageToBeDrawn){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_2c,sel_getUid("_imageDidLoad:"),CPImageDidLoadNotification,_imageToBeDrawn);
objj_msgSend(_imageToBeDrawn,"load");
}
}
}
}),new objj_method(sel_getUid("setPlaceholder:"),function(_2f,_30,_31){
with(_2f){
_placeholder=_31;
if(_imageToBeDrawn){
objj_msgSend(_2f,"setObjectValue:",_imageToBeDrawn);
}
}
}),new objj_method(sel_getUid("_imageDidLoad:"),function(_32,_33,_34){
with(_32){
if(_imageToBeDrawn!==objj_msgSend(_34,"object")){
return;
}
_imageToBeDrawn=nil;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_32,sel_getUid("_imageDidLoad:"),CPImageDidLoadNotification,objj_msgSend(_34,"object"));
objj_msgSend(_32,"setObjectValue:",objj_msgSend(_34,"object"));
}
}),new objj_method(sel_getUid("imageDidLoad:"),function(_35,_36,_37){
with(_35){
objj_msgSendSuper({receiver:_35,super_class:objj_getClass("MMImageView").super_class},"imageDidLoad:",_37);
objj_msgSend(objj_msgSend(_35,"layer"),"setNeedsDisplay");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_38,_39){
with(_38){
objj_msgSend(_38,"willChangeValueForKey:","imageRect");
objj_msgSendSuper({receiver:_38,super_class:objj_getClass("MMImageView").super_class},"layoutSubviews");
objj_msgSend(_38,"didChangeValueForKey:","imageRect");
}
}),new objj_method(sel_getUid("setBorderRadius:"),function(_3a,_3b,_3c){
with(_3a){
_borderRadius=_3c;
if(!DOMSupportsBorderRadius){
return;
}
_DOMImageElement.style.borderRadius=(_borderRadius||0)+"px";
}
}),new objj_method(sel_getUid("setShadowOffset:"),function(_3d,_3e,_3f){
with(_3d){
_shadowOffset=_3f;
objj_msgSend(_3d,"_updateShadow");
}
}),new objj_method(sel_getUid("setShadowBlurDistance:"),function(_40,_41,_42){
with(_40){
_shadowBlurDistance=_42;
objj_msgSend(_40,"_updateShadow");
}
}),new objj_method(sel_getUid("setShadowColor:"),function(_43,_44,_45){
with(_43){
_shadowColor=_45;
objj_msgSend(_43,"_updateShadow");
}
}),new objj_method(sel_getUid("setHasShadow:"),function(_46,_47,_48){
with(_46){
if(!DOMSupportsBoxShadow){
objj_msgSendSuper({receiver:_46,super_class:objj_getClass("MMImageView").super_class},"setHasShadow:",_48);
return;
}
_hasShadow=_48;
objj_msgSend(_46,"_updateShadow");
}
}),new objj_method(sel_getUid("_updateShadow"),function(_49,_4a){
with(_49){
if(!DOMSupportsBoxShadow){
return;
}
var css="box-shadow:";
if(!_hasShadow){
css+="none";
_DOMElement.style.overflow="hidden";
}else{
css+=_shadowOffset.width+"px "+_shadowOffset.height+"px "+_shadowBlurDistance+"px "+objj_msgSend(_shadowColor,"cssString");
_DOMElement.style.overflow="visible";
}
var _4b="";
for(var i=0;i<_1.length;i++){
_4b+=_1[i]+css+";";
}
_DOMImageElement.style.cssText+=_4b;
if(objj_msgSend(_49,"layer")){
objj_msgSend(_49,"layer")._DOMElement.style.cssText+=_4b;
}
}
}),new objj_method(sel_getUid("setInverted:"),function(_4c,_4d,_4e){
with(_4c){
_4e=!!_4e;
if(inverted==_4e){
return;
}
inverted=_4e;
if(CPBrowserIsEngine(CPInternetExplorerBrowserEngine)){
_DOMImageElement.style.filter=inverted?"progid:DXImageTransform.Microsoft.BasicImage(invert=1)":"";
}else{
if(inverted){
var _4f=objj_msgSend(objj_msgSend(CALayer,"alloc"),"init");
objj_msgSend(_4f,"setDelegate:",_4c);
objj_msgSend(_4c,"setLayer:",_4f);
_DOMElement.removeChild(_DOMImageElement);
}else{
objj_msgSend(objj_msgSend(_4c,"layer"),"setDelegate:",nil);
objj_msgSend(_4c,"setLayer:",nil);
_DOMElement.appendChild(_DOMImageElement);
}
}
}
}),new objj_method(sel_getUid("drawLayer:inContext:"),function(_50,_51,_52,_53){
with(_50){
if(!_imageRect){
return;
}
try{
var x=FLOOR(CGRectGetMinX(_imageRect)),y=FLOOR(CGRectGetMinY(_imageRect)),w=FLOOR(CGRectGetWidth(_imageRect)),h=FLOOR(CGRectGetHeight(_imageRect));
_53.drawImage(_DOMImageElement,x,y,w,h);
var _54=_53.getImageData(x,y,w,h);
var _55=_54.data;
for(var i=0,n=_55.length;i<n;i+=4){
_55[i]=255-_55[i];
_55[i+1]=255-_55[i+1];
_55[i+2]=255-_55[i+2];
}
_53.putImageData(_54,x,y);
}
catch(e){
}
}
})]);
var _56="MMImageViewBorderRadiusKey";
var _57="MMImageViewShadowOffsetKey";
var _58="MMImageViewShadowBlurDistanceKey";
var _59="MMImageViewShadowColorKey";
var _5a="MMImageViewSizeConstraintKey";
var _5b="MMImageViewImageToBeDrawnKey";
var _5c="MMImageViewPlaceholderKey";
var _5d="MMImageViewInvertedKey";
var _4=objj_getClass("MMImageView");
if(!_4){
throw new SyntaxError("*** Could not find definition for class \"MMImageView\"");
}
var _5=_4.isa;
class_addMethods(_4,[new objj_method(sel_getUid("initWithCoder:"),function(_5e,_5f,_60){
with(_5e){
_borderRadius=objj_msgSend(_60,"decodeObjectForKey:",_56);
_shadowOffset=objj_msgSend(_60,"decodeObjectForKey:",_57);
_shadowBlurDistance=objj_msgSend(_60,"decodeObjectForKey:",_58);
_shadowColor=objj_msgSend(_60,"decodeObjectForKey:",_59);
_sizeConstraint=objj_msgSend(_60,"decodeObjectForKey:",_5a);
_imageToBeDrawn=objj_msgSend(_60,"decodeObjectForKey:",_5b);
_placeholder=objj_msgSend(_60,"decodeObjectForKey:",_5c);
inverted=objj_msgSend(_60,"decodeObjectForKey:",_5d);
return objj_msgSendSuper({receiver:_5e,super_class:objj_getClass("MMImageView").super_class},"initWithCoder:",_60);
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_61,_62,_63){
with(_61){
objj_msgSendSuper({receiver:_61,super_class:objj_getClass("MMImageView").super_class},"encodeWithCoder:",_63);
objj_msgSend(_63,"encodeObject:forKey:",_borderRadius,_56);
objj_msgSend(_63,"encodeObject:forKey:",_shadowOffset,_57);
objj_msgSend(_63,"encodeObject:forKey:",_shadowBlurDistance,_58);
objj_msgSend(_63,"encodeObject:forKey:",_shadowColor,_59);
objj_msgSend(_63,"encodeObject:forKey:",_sizeConstraint,_5a);
objj_msgSend(_63,"encodeObject:forKey:",_imageToBeDrawn,_5b);
objj_msgSend(_63,"encodeObject:forKey:",_placeholder,_5c);
objj_msgSend(_63,"encodeObject:forKey:",inverted,_5d);
}
})]);
p;18;Views/MMLazyView.jt;2924;@STATIC;1.0;I;15;AppKit/CPView.jt;2885;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"MMLazyView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_loading"),new objj_ivar("_loaded"),new objj_ivar("_visible"),new objj_ivar("_dirty")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("isLoading"),function(_3,_4){
with(_3){
return _loading;
}
}),new objj_method(sel_getUid("setLoading:"),function(_5,_6,_7){
with(_5){
_loading=_7;
}
}),new objj_method(sel_getUid("isLoaded"),function(_8,_9){
with(_8){
return _loaded;
}
}),new objj_method(sel_getUid("setLoaded:"),function(_a,_b,_c){
with(_a){
_loaded=_c;
}
}),new objj_method(sel_getUid("isVisible"),function(_d,_e){
with(_d){
return _visible;
}
}),new objj_method(sel_getUid("setVisible:"),function(_f,_10,_11){
with(_f){
_visible=_11;
}
}),new objj_method(sel_getUid("isDirty"),function(_12,_13){
with(_12){
return _dirty;
}
}),new objj_method(sel_getUid("setDirty:"),function(_14,_15,_16){
with(_14){
_dirty=_16;
}
}),new objj_method(sel_getUid("visibilityDidChange:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_17,"setVisible:",_19);
if(!_19){
return;
}
objj_msgSend(_17,"load");
if(objj_msgSend(_17,"isDirty")){
objj_msgSend(_17,"refresh");
}
}
}),new objj_method(sel_getUid("isDirty"),function(_1a,_1b){
with(_1a){
return _dirty;
}
}),new objj_method(sel_getUid("setDirty:"),function(_1c,_1d,_1e){
with(_1c){
_dirty=_1e;
if(_1e&&objj_msgSend(_1c,"isVisible")){
objj_msgSend(_1c,"refresh");
}
}
}),new objj_method(sel_getUid("isVisible"),function(_1f,_20){
with(_1f){
return _visible;
}
}),new objj_method(sel_getUid("isLoaded"),function(_21,_22){
with(_21){
return _loaded;
}
}),new objj_method(sel_getUid("isLoading"),function(_23,_24){
with(_23){
return _loading;
}
}),new objj_method(sel_getUid("load"),function(_25,_26){
with(_25){
if(_loading||_loaded){
return;
}
objj_msgSend(_25,"willLoadView");
objj_msgSend(_25,"setLoading:",YES);
objj_msgSend(_25,"loadView");
objj_msgSend(_25,"setDirty:",NO);
objj_msgSend(_25,"setLoading:",NO);
objj_msgSend(_25,"setLoaded:",YES);
objj_msgSend(_25,"didLoadView");
objj_msgSend(_25,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("willLoadView"),function(_27,_28){
with(_27){
}
}),new objj_method(sel_getUid("loadView"),function(_29,_2a){
with(_29){
}
}),new objj_method(sel_getUid("didLoadView"),function(_2b,_2c){
with(_2b){
}
}),new objj_method(sel_getUid("refresh"),function(_2d,_2e){
with(_2d){
if(_loading){
return;
}
objj_msgSend(_2d,"willRefreshView");
objj_msgSend(_2d,"refreshView");
objj_msgSend(_2d,"setDirty:",NO);
objj_msgSend(_2d,"didRefreshView");
objj_msgSend(_2d,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("willRefreshView"),function(_2f,_30){
with(_2f){
}
}),new objj_method(sel_getUid("refreshView"),function(_31,_32){
with(_31){
}
}),new objj_method(sel_getUid("didRefreshView"),function(_33,_34){
with(_33){
}
})]);
p;16;Views/MMPrompt.jt;4383;@STATIC;1.0;I;16;AppKit/CPAlert.ji;19;../CPWindow+Shake.jt;4319;
objj_executeFile("AppKit/CPAlert.j",NO);
objj_executeFile("../CPWindow+Shake.j",YES);
var _1=150;
var _2=objj_allocateClassPair(CPAlert,"MMPrompt"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("labels"),new objj_ivar("inputs")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_4,_5,_6){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("MMPrompt").super_class},"initWithFrame:",_6)){
labels=objj_msgSend(CPMutableArray,"array");
inputs=objj_msgSend(CPMutableArray,"array");
objj_msgSend(_4,"setAccessoryView:",objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero()));
}
return _4;
}
}),new objj_method(sel_getUid("addFieldWithLabel:value:"),function(_7,_8,_9,_a){
with(_7){
objj_msgSend(_7,"addFieldWithLabel:value:placeholder:secure:",_9,_a,"",NO);
}
}),new objj_method(sel_getUid("addFieldWithLabel:value:placeholder:secure:"),function(_b,_c,_d,_e,_f,_10){
with(_b){
objj_msgSend(_b,"addFieldWithLabel:value:placeholder:secure:width:",_d,_e,"",_10,_1);
}
}),new objj_method(sel_getUid("addFieldWithLabel:value:placeholder:secure:width:"),function(_11,_12,_13,_14,_15,_16,_17){
with(_11){
var _18=objj_msgSend(CPTextField,"labelWithTitle:",_13),_19=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:",_14,_15,_17);
objj_msgSend(_18,"setAlignment:",CPRightTextAlignment);
objj_msgSend(_19,"setSecure:",_16);
objj_msgSend(labels,"addObject:",_18);
objj_msgSend(inputs,"addObject:",_19);
objj_msgSend(objj_msgSend(_11,"accessoryView"),"addSubview:",_18);
objj_msgSend(objj_msgSend(_11,"accessoryView"),"addSubview:",_19);
_needsLayout=YES;
}
}),new objj_method(sel_getUid("stringValueAtIndex:"),function(_1a,_1b,_1c){
with(_1a){
return objj_msgSend(objj_msgSend(inputs,"objectAtIndex:",_1c),"stringValue");
}
}),new objj_method(sel_getUid("shake"),function(_1d,_1e){
with(_1d){
objj_msgSend(_window,"shake");
}
}),new objj_method(sel_getUid("dismissPrompt"),function(_1f,_20){
with(_1f){
if(objj_msgSend(_window,"isSheet")){
objj_msgSend(CPApp,"endSheet:returnCode:",_window,-1);
}else{
objj_msgSend(CPApp,"abortModal");
objj_msgSend(_window,"close");
}
}
}),new objj_method(sel_getUid("_takeReturnCodeFrom:"),function(_21,_22,_23){
with(_21){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("prompt:userDidActivateButtonWithReturnCode:"))){
objj_msgSend(_delegate,"prompt:userDidActivateButtonWithReturnCode:",_21,objj_msgSend(_23,"tag"));
}else{
objj_msgSendSuper({receiver:_21,super_class:objj_getClass("MMPrompt").super_class},"_takeReturnCodeFrom:",_23);
}
}
}),new objj_method(sel_getUid("runModal"),function(_24,_25){
with(_24){
objj_msgSendSuper({receiver:_24,super_class:objj_getClass("MMPrompt").super_class},"runModal");
objj_msgSend(_24,"activateFirstResponder");
}
}),new objj_method(sel_getUid("beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:"),function(_26,_27,_28,_29,_2a,_2b){
with(_26){
objj_msgSendSuper({receiver:_26,super_class:objj_getClass("MMPrompt").super_class},"beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:",_28,_29,_2a,_2b);
objj_msgSend(_26,"activateFirstResponder");
}
}),new objj_method(sel_getUid("activateFirstResponder"),function(_2c,_2d){
with(_2c){
if(objj_msgSend(inputs,"count")){
var _2e=objj_msgSend(inputs,"objectAtIndex:",0);
objj_msgSend(objj_msgSend(_2c,"window"),"makeFirstResponder:",_2e);
objj_msgSend(_2e,"selectAll:",nil);
}
}
}),new objj_method(sel_getUid("layout"),function(_2f,_30){
with(_2f){
var _31=0,_32=0;
for(var i=0,_33=objj_msgSend(labels,"count");i<_33;i++){
var _34=objj_msgSend(labels,"objectAtIndex:",i),_35=CGRectGetWidth(objj_msgSend(_34,"frame"));
if(_35>_32){
_32=_35;
}
}
for(var i=0,_33=objj_msgSend(labels,"count");i<_33;i++){
var _34=objj_msgSend(labels,"objectAtIndex:",i),_36=objj_msgSend(inputs,"objectAtIndex:",i);
objj_msgSend(_36,"setFrameOrigin:",CGPointMake(_32,_31));
objj_msgSend(_34,"setFrame:",CGRectMake(0,_31+(CGRectGetHeight(objj_msgSend(_36,"frame"))-CGRectGetHeight(objj_msgSend(_34,"frame")))/2,_32,CGRectGetHeight(objj_msgSend(_34,"frame"))));
_31=CGRectGetMaxY(objj_msgSend(_36,"frame"))+5;
}
objj_msgSend(objj_msgSend(_2f,"accessoryView"),"sizeToFit");
objj_msgSendSuper({receiver:_2f,super_class:objj_getClass("MMPrompt").super_class},"layout");
}
})]);
p;16;CPWindow+Shake.jt;1288;@STATIC;1.0;t;1269;
var _1=objj_getClass("CPWindow");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPWindow\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("shake"),function(_3,_4){
with(_3){
var _5=30,_6=3,_7=0.18,_8=0,_9=objj_msgSend(_3,"frame").origin,_a=_9.x,_b=_9.y;
for(var i=0;i<_6;i++){
var _c;
_c=_7/_6/4;
objj_msgSend(_3,"animateOriginToPoint:duration:afterDelay:",CGPointMake(_a-_5,_b),_c,_8);
_8+=_c;
_c=_7/_6/2;
objj_msgSend(_3,"animateOriginToPoint:duration:afterDelay:",CGPointMake(_a+_5,_b),_c,_8);
_8+=_c;
_c=_7/_6/4;
objj_msgSend(_3,"animateOriginToPoint:duration:afterDelay:",CGPointMake(_a,_b),_c,_8);
_8+=_c;
}
}
}),new objj_method(sel_getUid("animateOriginToPoint:duration:afterDelay:"),function(_d,_e,_f,_10,_11){
with(_d){
setTimeout(function(){
var _12=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithDuration:animationCurve:",_10,CPAnimationEaseInOut),_13=objj_msgSend(_d,"frame"),_14=CGRectMake(_f.x,_f.y,CGRectGetWidth(_13),CGRectGetHeight(_13));
objj_msgSend(_12,"setViewAnimations:",[objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_d,CPViewAnimationTargetKey,_13,CPViewAnimationStartFrameKey,_14,CPViewAnimationEndFrameKey)]);
objj_msgSend(_12,"startAnimation");
},_11*1000);
}
})]);
p;40;Controllers/MMMetadataEditorController.jt;17963;@STATIC;1.0;I;25;AppKit/CPViewController.ji;22;../CPDateTransformer.ji;26;../Models/MMMetadataItem.ji;21;../CPView+sizeToFit.ji;27;../Views/MMSheetContainer.ji;23;../Views/MMLockButton.jt;17769;
objj_executeFile("AppKit/CPViewController.j",NO);
objj_executeFile("../CPDateTransformer.j",YES);
objj_executeFile("../Models/MMMetadataItem.j",YES);
objj_executeFile("../CPView+sizeToFit.j",YES);
objj_executeFile("../Views/MMSheetContainer.j",YES);
objj_executeFile("../Views/MMLockButton.j",YES);
var _1=objj_allocateClassPair(CPViewController,"MMMetadataEditorController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_delegate"),new objj_ivar("metadataItem"),new objj_ivar("originalMetadataItem"),new objj_ivar("_sheetPanel"),new objj_ivar("_initialFirstResponder")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("delegate"),function(_3,_4){
with(_3){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_5,_6,_7){
with(_5){
_delegate=_7;
}
}),new objj_method(sel_getUid("metadataItem"),function(_8,_9){
with(_8){
return metadataItem;
}
}),new objj_method(sel_getUid("setMetadataItem:"),function(_a,_b,_c){
with(_a){
metadataItem=_c;
}
}),new objj_method(sel_getUid("initWithDelegate:"),function(_d,_e,_f){
with(_d){
if(_d=objj_msgSend(_d,"init")){
_delegate=_f;
}
return _d;
}
}),new objj_method(sel_getUid("loadView"),function(_10,_11){
with(_10){
var _12=260,_13=186,_14=122,_15=10,_16=objj_msgSend(CPFont,"boldSystemFontOfSize:",12);
var _17=objj_msgSend(objj_msgSend(MMSheetContainer,"alloc"),"initWithFrame:",CGRectMakeZero());
var _18=objj_msgSend(_17,"currentValueForThemeAttribute:","content-inset");
var _19=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","","",_13);
var _1a=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Title","Title"));
objj_msgSend(_1a,"setFont:",_16);
objj_msgSend(_1a,"sizeToFit");
objj_msgSend(_1a,"setFrameOrigin:",CGPointMake(_18.left,_18.top));
objj_msgSend(_19,"setFrameOrigin:",CGPointMake(_18.left,CGRectGetMaxY(objj_msgSend(_1a,"frame"))));
objj_msgSend(_19,"bind:toObject:withKeyPath:options:",CPValueBinding,_10,"metadataItem.title",nil);
objj_msgSend(_17,"addSubview:",_19);
objj_msgSend(_17,"addSubview:",_1a);
var _1b=objj_msgSend(MMLockButton,"buttonForField:",_19);
objj_msgSend(_1b,"bind:toObject:withKeyPath:options:","locked",_10,"metadataItem.titleLocked",nil);
objj_msgSend(_17,"addSubview:",_1b);
var _1c=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","","",_13);
var _1d=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Sort Title","Sort Title"));
objj_msgSend(_1d,"setFont:",_16);
objj_msgSend(_1d,"sizeToFit");
objj_msgSend(_1d,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(_1b,"frame"))+_15,CGRectGetMinY(objj_msgSend(_1a,"frame"))));
objj_msgSend(_1c,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_1d,"frame")),CGRectGetMinY(objj_msgSend(_19,"frame"))));
objj_msgSend(_1c,"bind:toObject:withKeyPath:options:",CPValueBinding,_10,"metadataItem.titleSort",nil);
objj_msgSend(_17,"addSubview:",_1c);
objj_msgSend(_17,"addSubview:",_1d);
var _1e=objj_msgSend(MMLockButton,"buttonForField:",_1c);
objj_msgSend(_1e,"bind:toObject:withKeyPath:options:","locked",_10,"metadataItem.titleSortLocked",nil);
objj_msgSend(_17,"addSubview:",_1e);
var _1f=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","","",_14);
var _20=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Year","Year"));
objj_msgSend(_20,"setFont:",_16);
objj_msgSend(_20,"sizeToFit");
objj_msgSend(_20,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(_1e,"frame"))+_15,CGRectGetMinY(objj_msgSend(_1d,"frame"))));
objj_msgSend(_1f,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_20,"frame")),CGRectGetMinY(objj_msgSend(_1c,"frame"))));
objj_msgSend(_1f,"bind:toObject:withKeyPath:options:",CPValueBinding,_10,"metadataItem.year",nil);
objj_msgSend(_17,"addSubview:",_1f);
objj_msgSend(_17,"addSubview:",_20);
var _21=objj_msgSend(MMLockButton,"buttonForField:",_1f);
objj_msgSend(_21,"bind:toObject:withKeyPath:options:","locked",_10,"metadataItem.yearLocked",nil);
objj_msgSend(_17,"addSubview:",_21);
var _22=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","","",_13);
var _23=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Original Title","Original Title"));
objj_msgSend(_23,"setFont:",_16);
objj_msgSend(_23,"sizeToFit");
objj_msgSend(_23,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_1a,"frame")),CGRectGetMaxY(objj_msgSend(_19,"frame"))+_15));
objj_msgSend(_22,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_23,"frame")),CGRectGetMaxY(objj_msgSend(_23,"frame"))));
objj_msgSend(_22,"bind:toObject:withKeyPath:options:",CPValueBinding,_10,"metadataItem.originalTitle",nil);
objj_msgSend(_17,"addSubview:",_22);
objj_msgSend(_17,"addSubview:",_23);
var _24=objj_msgSend(MMLockButton,"buttonForField:",_22);
objj_msgSend(_24,"bind:toObject:withKeyPath:options:","locked",_10,"metadataItem.originalTitleLocked",nil);
objj_msgSend(_17,"addSubview:",_24);
var _25=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","","",_13);
var _26=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Tagline","Tagline"));
objj_msgSend(_26,"setFont:",_16);
objj_msgSend(_26,"sizeToFit");
objj_msgSend(_26,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(_24,"frame"))+_15,CGRectGetMinY(objj_msgSend(_23,"frame"))));
objj_msgSend(_25,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_26,"frame")),CGRectGetMinY(objj_msgSend(_22,"frame"))));
objj_msgSend(_25,"bind:toObject:withKeyPath:options:",CPValueBinding,_10,"metadataItem.tagline",nil);
objj_msgSend(_17,"addSubview:",_25);
objj_msgSend(_17,"addSubview:",_26);
var _27=objj_msgSend(MMLockButton,"buttonForField:",_25);
objj_msgSend(_27,"bind:toObject:withKeyPath:options:","locked",_10,"metadataItem.taglineLocked",nil);
objj_msgSend(_17,"addSubview:",_27);
var _28=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","","",_14);
var _29=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Rating","Rating"));
objj_msgSend(_29,"setFont:",_16);
objj_msgSend(_29,"sizeToFit");
objj_msgSend(_29,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(_27,"frame"))+_15,CGRectGetMinY(objj_msgSend(_26,"frame"))));
objj_msgSend(_28,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_29,"frame")),CGRectGetMinY(objj_msgSend(_25,"frame"))));
objj_msgSend(_28,"bind:toObject:withKeyPath:options:",CPValueBinding,_10,"metadataItem.rating",nil);
objj_msgSend(_17,"addSubview:",_28);
objj_msgSend(_17,"addSubview:",_29);
var _2a=objj_msgSend(MMLockButton,"buttonForField:",_28);
objj_msgSend(_2a,"bind:toObject:withKeyPath:options:","locked",_10,"metadataItem.ratingLocked",nil);
objj_msgSend(_17,"addSubview:",_2a);
var _2b=objj_msgSend(LPMultiLineTextField,"textFieldWithStringValue:placeholder:width:","","",CGRectGetMaxX(objj_msgSend(_28,"frame"))-CGRectGetMinX(objj_msgSend(_22,"frame")));
var _2c=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Summary","Summary"));
objj_msgSend(_2c,"setFont:",_16);
objj_msgSend(_2c,"sizeToFit");
objj_msgSend(_2c,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_23,"frame")),CGRectGetMaxY(objj_msgSend(_22,"frame"))+_15));
objj_msgSend(_2b,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_2c,"frame")),CGRectGetMaxY(objj_msgSend(_2c,"frame")),CGRectGetWidth(objj_msgSend(_2b,"frame")),96));
objj_msgSend(_2b,"bind:toObject:withKeyPath:options:",CPValueBinding,_10,"metadataItem.summary",nil);
objj_msgSend(_17,"addSubview:",_2b);
objj_msgSend(_17,"addSubview:",_2c);
var _2d=objj_msgSend(MMLockButton,"buttonForField:",_2b);
objj_msgSend(_2d,"bind:toObject:withKeyPath:options:","locked",_10,"metadataItem.summaryLocked",nil);
objj_msgSend(_17,"addSubview:",_2d);
var _2e=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","","",_12);
var _2f=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Studio","Studio"));
objj_msgSend(_2f,"setFont:",_16);
objj_msgSend(_2f,"sizeToFit");
objj_msgSend(_2f,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_2c,"frame")),CGRectGetMaxY(objj_msgSend(_2b,"frame"))+_15));
objj_msgSend(_2e,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_2f,"frame")),CGRectGetMaxY(objj_msgSend(_2f,"frame"))));
objj_msgSend(_2e,"bind:toObject:withKeyPath:options:",CPValueBinding,_10,"metadataItem.studio",nil);
objj_msgSend(_17,"addSubview:",_2e);
objj_msgSend(_17,"addSubview:",_2f);
var _30=objj_msgSend(MMLockButton,"buttonForField:",_2e);
objj_msgSend(_30,"bind:toObject:withKeyPath:options:","locked",_10,"metadataItem.studioLocked",nil);
objj_msgSend(_17,"addSubview:",_30);
var _31=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","","",_14);
var _32=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Originally Available","Originally Available"));
objj_msgSend(_32,"setFont:",_16);
objj_msgSend(_32,"sizeToFit");
objj_msgSend(_32,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_2d,"frame"))-CGRectGetWidth(objj_msgSend(_31,"frame")),CGRectGetMinY(objj_msgSend(_2f,"frame"))));
objj_msgSend(_31,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_32,"frame")),CGRectGetMaxY(objj_msgSend(_32,"frame"))));
objj_msgSend(_31,"bind:toObject:withKeyPath:options:",CPValueBinding,_10,"metadataItem.originallyAvailableAt",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(objj_msgSend(CPDateTransformer,"alloc"),"init"),CPValueTransformerBindingOption));
objj_msgSend(_17,"addSubview:",_31);
objj_msgSend(_17,"addSubview:",_32);
var _33=objj_msgSend(MMLockButton,"buttonForField:",_31);
objj_msgSend(_33,"bind:toObject:withKeyPath:options:","locked",_10,"metadataItem.originallyAvailableAtLocked",nil);
objj_msgSend(_17,"addSubview:",_33);
var _34=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","","",CGRectGetMinX(objj_msgSend(_31,"frame"))-CGRectGetMaxX(objj_msgSend(_30,"frame"))-_15*2-CGRectGetWidth(objj_msgSend(_30,"frame")));
var _35=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Content Rating","Content Rating"));
objj_msgSend(_35,"setFont:",_16);
objj_msgSend(_35,"sizeToFit");
objj_msgSend(_35,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(_30,"frame"))+_15,CGRectGetMinY(objj_msgSend(_2f,"frame"))));
objj_msgSend(_34,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_35,"frame")),CGRectGetMaxY(objj_msgSend(_35,"frame"))));
objj_msgSend(_34,"bind:toObject:withKeyPath:options:",CPValueBinding,_10,"metadataItem.contentRating",nil);
objj_msgSend(_17,"addSubview:",_34);
objj_msgSend(_17,"addSubview:",_35);
var _36=objj_msgSend(MMLockButton,"buttonForField:",_34);
objj_msgSend(_36,"bind:toObject:withKeyPath:options:","locked",_10,"metadataItem.contentRatingLocked",nil);
objj_msgSend(_17,"addSubview:",_36);
var _37=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Writers","Writers"));
objj_msgSend(_37,"setFont:",_16);
objj_msgSend(_37,"sizeToFit");
objj_msgSend(_37,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_2f,"frame")),CGRectGetMaxY(objj_msgSend(_2e,"frame"))+_15));
var _38=objj_msgSend(objj_msgSend(CPTokenField,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_37,"frame")),CGRectGetMaxY(objj_msgSend(_37,"frame")),0,0));
objj_msgSend(_38,"sizeToFit");
objj_msgSend(_38,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_2e,"frame")),CGRectGetHeight(objj_msgSend(_38,"frame"))));
objj_msgSend(_38,"setEditable:",YES);
objj_msgSend(_38,"bind:toObject:withKeyPath:options:",CPValueBinding,_10,"metadataItem.writers",nil);
objj_msgSend(_17,"addSubview:",_38);
objj_msgSend(_17,"addSubview:",_37);
var _39=objj_msgSend(MMLockButton,"buttonForField:",_38);
objj_msgSend(_39,"bind:toObject:withKeyPath:options:","locked",_10,"metadataItem.writersLocked",nil);
objj_msgSend(_17,"addSubview:",_39);
var _3a=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Directors","Directors"));
objj_msgSend(_3a,"setFont:",_16);
objj_msgSend(_3a,"sizeToFit");
objj_msgSend(_3a,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(_39,"frame"))+_15,CGRectGetMinY(objj_msgSend(_37,"frame"))));
var _3b=objj_msgSend(objj_msgSend(CPTokenField,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_3a,"frame")),CGRectGetMaxY(objj_msgSend(_3a,"frame")),0,0));
objj_msgSend(_3b,"sizeToFit");
objj_msgSend(_3b,"setFrameSize:",CGSizeMake(CGRectGetMinX(objj_msgSend(_33,"frame"))-CGRectGetMinX(objj_msgSend(_39,"frame"))-_15-CGRectGetWidth(objj_msgSend(_39,"frame")),CGRectGetHeight(objj_msgSend(_3b,"frame"))));
objj_msgSend(_3b,"setEditable:",YES);
objj_msgSend(_3b,"bind:toObject:withKeyPath:options:",CPValueBinding,_10,"metadataItem.directors",nil);
objj_msgSend(_17,"addSubview:",_3b);
objj_msgSend(_17,"addSubview:",_3a);
var _3c=objj_msgSend(MMLockButton,"buttonForField:",_3b);
objj_msgSend(_3c,"bind:toObject:withKeyPath:options:","locked",_10,"metadataItem.directorsLocked",nil);
objj_msgSend(_17,"addSubview:",_3c);
var _3d=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Genres","Genres"));
objj_msgSend(_3d,"setFont:",_16);
objj_msgSend(_3d,"sizeToFit");
objj_msgSend(_3d,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_37,"frame")),CGRectGetMaxY(objj_msgSend(_38,"frame"))+_15));
var _3e=objj_msgSend(objj_msgSend(CPTokenField,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_3d,"frame")),CGRectGetMaxY(objj_msgSend(_3d,"frame")),0,0));
objj_msgSend(_3e,"sizeToFit");
objj_msgSend(_3e,"setFrameSize:",CGSizeMake(_12,CGRectGetHeight(objj_msgSend(_3e,"frame"))));
objj_msgSend(_3e,"setEditable:",YES);
objj_msgSend(_3e,"bind:toObject:withKeyPath:options:",CPValueBinding,_10,"metadataItem.genres",nil);
objj_msgSend(_17,"addSubview:",_3e);
objj_msgSend(_17,"addSubview:",_3d);
var _3f=objj_msgSend(MMLockButton,"buttonForField:",_3e);
objj_msgSend(_3f,"bind:toObject:withKeyPath:options:","locked",_10,"metadataItem.genresLocked",nil);
objj_msgSend(_17,"addSubview:",_3f);
var _40=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Collections","Collections"));
objj_msgSend(_40,"setFont:",_16);
objj_msgSend(_40,"sizeToFit");
objj_msgSend(_40,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(_3f,"frame"))+_15,CGRectGetMinY(objj_msgSend(_3d,"frame"))));
var _41=objj_msgSend(objj_msgSend(CPTokenField,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_40,"frame")),CGRectGetMaxY(objj_msgSend(_40,"frame")),CGRectGetWidth(objj_msgSend(_3b,"frame")),CGRectGetHeight(objj_msgSend(_3b,"frame"))));
objj_msgSend(_41,"setEditable:",YES);
objj_msgSend(_41,"bind:toObject:withKeyPath:options:",CPValueBinding,_10,"metadataItem.collections",nil);
objj_msgSend(_17,"addSubview:",_41);
objj_msgSend(_17,"addSubview:",_40);
var _42=objj_msgSend(MMLockButton,"buttonForField:",_41);
objj_msgSend(_42,"bind:toObject:withKeyPath:options:","locked",_10,"metadataItem.collectionLocked",nil);
objj_msgSend(_17,"addSubview:",_42);
var _43=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Save","Save"));
objj_msgSend(_43,"setKeyEquivalent:",CPCarriageReturnCharacter);
objj_msgSend(_43,"setFrameOrigin:",CGPointMake(CGRectGetWidth(objj_msgSend(_17,"frame"))-_18.right-CGRectGetWidth(objj_msgSend(_43,"frame")),CGRectGetHeight(objj_msgSend(_17,"frame"))-_18.bottom-CGRectGetHeight(objj_msgSend(_43,"frame"))));
objj_msgSend(_43,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(_43,"setTarget:",_10);
objj_msgSend(_43,"setAction:",sel_getUid("save:"));
objj_msgSend(_17,"addSubview:",_43);
var _44=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Cancel","Cancel"));
objj_msgSend(_44,"setKeyEquivalent:",CPEscapeFunctionKey);
objj_msgSend(_44,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_43,"frame"))-5-CGRectGetWidth(objj_msgSend(_44,"frame")),CGRectGetMinY(objj_msgSend(_43,"frame"))));
objj_msgSend(_44,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(_44,"setTarget:",_10);
objj_msgSend(_44,"setAction:",sel_getUid("cancel:"));
objj_msgSend(_17,"addSubview:",_44);
_initialFirstResponder=_19;
objj_msgSend(_10,"setView:",_17);
}
}),new objj_method(sel_getUid("presentSheetInWindow:"),function(_45,_46,_47){
with(_45){
if(_sheetPanel){
return;
}
objj_msgSend(objj_msgSend(_45,"view"),"sizeToFit");
_sheetPanel=objj_msgSend(objj_msgSend(CPPanel,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(objj_msgSend(_45,"view"),"bounds"),CPDocModalWindowMask);
objj_msgSend(_sheetPanel,"setInitialFirstResponder:",_initialFirstResponder);
objj_msgSend(_sheetPanel,"setContentView:",objj_msgSend(_45,"view"));
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",_sheetPanel,_47,nil,nil,nil);
}
}),new objj_method(sel_getUid("presentMetadataItem:inWindow:"),function(_48,_49,_4a,_4b){
with(_48){
originalMetadataItem=_4a;
objj_msgSend(_48,"setMetadataItem:",objj_msgSend(originalMetadataItem,"copy"));
objj_msgSend(_48,"presentSheetInWindow:",_4b);
}
}),new objj_method(sel_getUid("dismissSheet"),function(_4c,_4d){
with(_4c){
if(!_sheetPanel){
return;
}
objj_msgSend(CPApp,"endSheet:returnCode:",_sheetPanel,0),_sheetPanel=nil;
}
}),new objj_method(sel_getUid("save:"),function(_4e,_4f,_50){
with(_4e){
objj_msgSend(originalMetadataItem,"takeAttributesFromRecord:onlyChanges:",metadataItem,YES);
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("metadataEditor:didCommitMetadataItem:"))){
objj_msgSend(_delegate,"metadataEditor:didCommitMetadataItem:",_4e,originalMetadataItem);
}
}
}),new objj_method(sel_getUid("cancel:"),function(_51,_52,_53){
with(_51){
objj_msgSend(_51,"dismissSheet");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("metadataEditorDidCancel:"))){
objj_msgSend(_delegate,"metadataEditorDidCancel:",_51);
}
}
})]);
p;19;CPDateTransformer.jt;951;@STATIC;1.0;I;31;Foundation/CPValueTransformer.jt;897;
objj_executeFile("Foundation/CPValueTransformer.j",NO);
var _1=objj_allocateClassPair(CPValueTransformer,"CPDateTransformer"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("reverseTransformedValue:"),function(_3,_4,_5){
with(_3){
if(!_5){
return nil;
}
var _6;
if(_6=_5.match(/^(\d{4})-(\d\d?)-(\d\d?)$/)){
return new Date(Number(_6[1]),Number(_6[2])-1,Number(_6[3]));
}else{
return Date.parse(_5);
}
}
}),new objj_method(sel_getUid("transformedValue:"),function(_7,_8,_9){
with(_7){
return _9&&objj_msgSend(CPString,"stringWithFormat:","%d-%02d-%02d",_9.getFullYear(),_9.getMonth()+1,_9.getDate());
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("allowsReverseTransformation"),function(_a,_b){
with(_a){
return YES;
}
}),new objj_method(sel_getUid("transformedValueClass"),function(_c,_d){
with(_c){
return objj_msgSend(CPDate,"class");
}
})]);
p;24;Views/MMSheetContainer.jt;324;@STATIC;1.0;t;306;
var _1=objj_allocateClassPair(CPView,"MMSheetContainer"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("themeAttributes"),function(_3,_4){
with(_3){
return objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CGInsetMake(15,15,15,15),"content-inset");
}
})]);
p;20;Views/MMLockButton.jt;3495;@STATIC;1.0;I;17;AppKit/CPButton.jt;3454;
objj_executeFile("AppKit/CPButton.j",NO);
var _1=nil;
var _2=nil;
var _3=objj_allocateClassPair(CPButton,"MMLockButton"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("locked")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("isLocked"),function(_5,_6){
with(_5){
return locked;
}
}),new objj_method(sel_getUid("setLocked:"),function(_7,_8,_9){
with(_7){
locked=_9;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_a,_b,_c){
with(_a){
if(_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("MMLockButton").super_class},"initWithFrame:",_c)){
locked=NO;
objj_msgSend(_a,"setImage:",objj_msgSend(objj_msgSend(_a,"class"),"unlockImage"));
objj_msgSend(_a,"setImagePosition:",CPImageOnly);
}
return _a;
}
}),new objj_method(sel_getUid("lock:"),function(_d,_e,_f){
with(_d){
objj_msgSend(_d,"setLocked:",YES);
}
}),new objj_method(sel_getUid("setLocked:"),function(_10,_11,_12){
with(_10){
_12=!!_12;
if(_12===locked){
return;
}
locked=_12;
objj_msgSend(objj_msgSend(CPBinder,"getBinding:forObject:","locked",_10),"reverseSetValueFor:","locked");
objj_msgSend(_10,"setImage:",locked?objj_msgSend(objj_msgSend(_10,"class"),"lockImage"):objj_msgSend(objj_msgSend(_10,"class"),"unlockImage"));
objj_msgSend(_10,"setHighlighted:",_12);
}
}),new objj_method(sel_getUid("sendAction:to:"),function(_13,_14,_15,_16){
with(_13){
objj_msgSend(_13,"highlight:",YES);
objj_msgSend(_13,"willChangeValueForKey:","locked");
locked=!locked;
objj_msgSend(_13,"setImage:",locked?objj_msgSend(objj_msgSend(_13,"class"),"lockImage"):objj_msgSend(objj_msgSend(_13,"class"),"unlockImage"));
objj_msgSend(_13,"didChangeValueForKey:","locked");
objj_msgSend(objj_msgSend(CPBinder,"getBinding:forObject:","locked",_13),"reverseSetValueFor:","locked");
try{
objj_msgSendSuper({receiver:_13,super_class:objj_getClass("MMLockButton").super_class},"sendAction:to:",_15,_16);
}
catch(e){
throw e;
}
finally{
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.1,_13,sel_getUid("toggleButtonTimerDidFinish:"),nil,NO);
}
}
}),new objj_method(sel_getUid("toggleButtonTimerDidFinish:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_17,"setHighlighted:",locked);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("lockImage"),function(_1a,_1b){
with(_1a){
if(!_1){
_1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","lock.png"),CGSizeMake(17,17));
}
return _1;
}
}),new objj_method(sel_getUid("unlockImage"),function(_1c,_1d){
with(_1c){
if(!_2){
_2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","unlock.png"),CGSizeMake(17,17));
}
return _2;
}
}),new objj_method(sel_getUid("button"),function(_1e,_1f){
with(_1e){
var _20=objj_msgSend(objj_msgSend(_1e,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_20,"sizeToFit");
return _20;
}
}),new objj_method(sel_getUid("buttonForField:"),function(_21,_22,_23){
with(_21){
var _24=objj_msgSend(_21,"button"),_25=objj_msgSend(_23,"frame");
objj_msgSend(_23,"setSendsActionOnEndEditing:",YES);
objj_msgSend(_23,"setTarget:",_24);
objj_msgSend(_23,"setAction:",sel_getUid("lock:"));
objj_msgSend(_24,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(_25),CGRectGetMinY(_25)+(CGRectGetHeight(_25)-CGRectGetHeight(objj_msgSend(_24,"frame")))/2));
return _24;
}
})]);
p;39;Frameworks/LPKit/LPMultiLineTextField.jt;8329;@STATIC;1.0;I;20;AppKit/CPTextField.jt;8285;
objj_executeFile("AppKit/CPTextField.j",NO);
var _1=nil;
var _2=objj_allocateClassPair(CPTextField,"LPMultiLineTextField"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_DOMTextareaElement"),new objj_ivar("_stringValue"),new objj_ivar("_hideOverflow")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("_DOMTextareaElement"),function(_4,_5){
with(_4){
if(!_DOMTextareaElement){
_DOMTextareaElement=document.createElement("textarea");
_DOMTextareaElement.style.position="absolute";
_DOMTextareaElement.style.background="none";
_DOMTextareaElement.style.border="0";
_DOMTextareaElement.style.outline="0";
_DOMTextareaElement.style.zIndex="100";
_DOMTextareaElement.style.resize="none";
_DOMTextareaElement.style.padding="0";
_DOMTextareaElement.style.margin="0";
_DOMTextareaElement.onblur=function(){
objj_msgSend(objj_msgSend(_1,"window"),"makeFirstResponder:",nil);
_1=nil;
};
_4._DOMElement.appendChild(_DOMTextareaElement);
}
return _DOMTextareaElement;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
if(_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("LPMultiLineTextField").super_class},"initWithFrame:",_8)){
}
return _6;
}
}),new objj_method(sel_getUid("isScrollable"),function(_9,_a){
with(_9){
return !_hideOverflow;
}
}),new objj_method(sel_getUid("setScrollable:"),function(_b,_c,_d){
with(_b){
_hideOverflow=!_d;
}
}),new objj_method(sel_getUid("setEditable:"),function(_e,_f,_10){
with(_e){
objj_msgSend(_e,"_DOMTextareaElement").style.cursor=_10?"cursor":"default";
objj_msgSendSuper({receiver:_e,super_class:objj_getClass("LPMultiLineTextField").super_class},"setEditable:",_10);
}
}),new objj_method(sel_getUid("selectText:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_11,"_DOMTextareaElement").select();
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_14,_15){
with(_14){
objj_msgSendSuper({receiver:_14,super_class:objj_getClass("LPMultiLineTextField").super_class},"layoutSubviews");
var _16=objj_msgSend(_14,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
objj_msgSend(_16,"setHidden:",YES);
var _17=objj_msgSend(_14,"_DOMTextareaElement"),_18=objj_msgSend(_14,"currentValueForThemeAttribute:","content-inset"),_19=objj_msgSend(_14,"bounds");
_17.style.top=_18.top+"px";
_17.style.bottom=_18.bottom+"px";
_17.style.left=_18.left+"px";
_17.style.right=_18.right+"px";
_17.style.width=(CGRectGetWidth(_19)-_18.left-_18.right)+"px";
_17.style.height=(CGRectGetHeight(_19)-_18.top-_18.bottom)+"px";
_17.style.color=objj_msgSend(objj_msgSend(_14,"currentValueForThemeAttribute:","text-color"),"cssString");
_17.style.font=objj_msgSend(objj_msgSend(_14,"currentValueForThemeAttribute:","font"),"cssString");
switch(objj_msgSend(_14,"currentValueForThemeAttribute:","alignment")){
case CPLeftTextAlignment:
_17.style.textAlign="left";
break;
case CPJustifiedTextAlignment:
_17.style.textAlign="justify";
break;
case CPCenterTextAlignment:
_17.style.textAlign="center";
break;
case CPRightTextAlignment:
_17.style.textAlign="right";
break;
default:
_17.style.textAlign="left";
}
_17.value=_stringValue||"";
if(_hideOverflow){
_17.style.overflow="hidden";
}
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_1a,_1b,_1c){
with(_1a){
var _1d=objj_msgSend(_1a,"_DOMTextareaElement");
_1d.scrollLeft+=_1c._deltaX;
_1d.scrollTop+=_1c._deltaY;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_1e,_1f,_20){
with(_1e){
if(objj_msgSend(_1e,"isEditable")&&objj_msgSend(_1e,"isEnabled")){
objj_msgSend(objj_msgSend(objj_msgSend(_1e,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}else{
objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("LPMultiLineTextField").super_class},"mouseDown:",_20);
}
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_21,_22,_23){
with(_21){
return objj_msgSend(objj_msgSend(objj_msgSend(_23,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("keyDown:"),function(_24,_25,_26){
with(_24){
if(objj_msgSend(_26,"keyCode")===CPTabKeyCode){
if(objj_msgSend(_26,"modifierFlags")&CPShiftKeyMask){
objj_msgSend(objj_msgSend(_24,"window"),"selectPreviousKeyView:",_24);
}else{
objj_msgSend(objj_msgSend(_24,"window"),"selectNextKeyView:",_24);
}
if(objj_msgSend(objj_msgSend(objj_msgSend(_24,"window"),"firstResponder"),"respondsToSelector:",sel_getUid("selectText:"))){
objj_msgSend(objj_msgSend(objj_msgSend(_24,"window"),"firstResponder"),"selectText:",_24);
}
objj_msgSend(objj_msgSend(objj_msgSend(_24,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",NO);
}else{
objj_msgSend(objj_msgSend(objj_msgSend(_24,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("keyUp:"),function(_27,_28,_29){
with(_27){
if(_stringValue!==objj_msgSend(_27,"stringValue")){
_stringValue=objj_msgSend(_27,"stringValue");
if(!_isEditing){
_isEditing=YES;
objj_msgSend(_27,"textDidBeginEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_27,nil));
}
objj_msgSend(_27,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_27,nil));
}
objj_msgSend(objj_msgSend(objj_msgSend(_27,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_2a,_2b){
with(_2a){
_stringValue=objj_msgSend(_2a,"stringValue");
objj_msgSend(_2a,"setThemeState:",CPThemeStateEditing);
setTimeout(function(){
objj_msgSend(_2a,"_DOMTextareaElement").focus();
_1=_2a;
},0);
objj_msgSend(_2a,"textDidFocus:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidFocusNotification,_2a,nil));
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_2c,_2d){
with(_2c){
objj_msgSend(_2c,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_2c,"setStringValue:",objj_msgSend(_2c,"stringValue"));
objj_msgSend(_2c,"_DOMTextareaElement").blur();
if(_isEditing){
_isEditing=NO;
objj_msgSend(_2c,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_2c,nil));
if(objj_msgSend(_2c,"sendsActionOnEndEditing")){
objj_msgSend(_2c,"sendAction:to:",objj_msgSend(_2c,"action"),objj_msgSend(_2c,"target"));
}
}
objj_msgSend(_2c,"textDidBlur:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidBlurNotification,_2c,nil));
return YES;
}
}),new objj_method(sel_getUid("stringValue"),function(_2e,_2f){
with(_2e){
return (!!_DOMTextareaElement)?_DOMTextareaElement.value:"";
}
}),new objj_method(sel_getUid("setStringValue:"),function(_30,_31,_32){
with(_30){
objj_msgSend(_30,"willChangeValueForKey:",CPValueBinding);
_stringValue=_32;
objj_msgSend(_30,"didChangeValueForKey:",CPValueBinding);
objj_msgSend(_30,"setNeedsLayout");
}
}),new objj_method(sel_getUid("objectValue"),function(_33,_34){
with(_33){
return objj_msgSend(_33,"stringValue");
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_35,_36,_37){
with(_35){
objj_msgSend(_35,"setStringValue:",_37);
}
})]);
var _38="LPMultiLineTextFieldStringValueKey",_39="LPMultiLineTextFieldScrollableKey";
var _2=objj_getClass("LPMultiLineTextField");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"LPMultiLineTextField\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_3a,_3b,_3c){
with(_3a){
if(_3a=objj_msgSendSuper({receiver:_3a,super_class:objj_getClass("LPMultiLineTextField").super_class},"initWithCoder:",_3c)){
objj_msgSend(_3a,"setStringValue:",objj_msgSend(_3c,"decodeObjectForKey:",_38));
objj_msgSend(_3a,"setScrollable:",objj_msgSend(_3c,"decodeBoolForKey:",_39));
}
return _3a;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_3d,_3e,_3f){
with(_3d){
objj_msgSendSuper({receiver:_3d,super_class:objj_getClass("LPMultiLineTextField").super_class},"encodeWithCoder:",_3f);
objj_msgSend(_3f,"encodeObject:forKey:",_stringValue,_38);
objj_msgSend(_3f,"encodeBool:forKey:",(_hideOverflow?NO:YES),_39);
}
})]);
p;20;Views/MMScrollView.jt;1374;@STATIC;1.0;I;21;AppKit/CPScrollView.ji;12;MMClipView.jt;1312;
objj_executeFile("AppKit/CPScrollView.j",NO);
objj_executeFile("MMClipView.j",YES);
var _1=objj_allocateClassPair(CPScrollView,"MMScrollView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_lastClipViewScrollPoint")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("scrollPoint"),function(_3,_4){
with(_3){
return _lastClipViewScrollPoint;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_5,_6,_7){
with(_5){
if(_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("MMScrollView").super_class},"initWithFrame:",_7)){
objj_msgSend(_5,"setContentView:",objj_msgSend(objj_msgSend(MMClipView,"alloc"),"init"));
objj_msgSend(objj_msgSend(_5,"contentView"),"setDelegate:",_5);
objj_msgSend(_5,"setAutohidesScrollers:",YES);
}
return _5;
}
}),new objj_method(sel_getUid("clipView:didScrollToPoint:"),function(_8,_9,_a,_b){
with(_8){
if(_lastClipViewScrollPoint&&CGPointEqualToPoint(_lastClipViewScrollPoint,_b)){
return;
}
objj_msgSend(_8,"willChangeValueForKey:","scrollPoint");
_lastClipViewScrollPoint=_b;
objj_msgSend(_8,"didChangeValueForKey:","scrollPoint");
if(objj_msgSend(objj_msgSend(_8,"documentView"),"respondsToSelector:",sel_getUid("clipView:didScrollToPoint:"))){
objj_msgSend(objj_msgSend(_8,"documentView"),"clipView:didScrollToPoint:",_a,_b);
}
}
})]);
p;18;Views/MMClipView.jt;4388;@STATIC;1.0;I;33;Foundation/CPNotificationCenter.jI;19;AppKit/CPClipView.jt;4307;
objj_executeFile("Foundation/CPNotificationCenter.j",NO);
objj_executeFile("AppKit/CPClipView.j",NO);
MMClipViewDefaultBackgroundColor=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",34/255,1);
MMClipViewInsetShadowAlignNone=0;
MMClipViewInsetShadowAlignTop=1;
MMClipViewInsetShadowAlignRight=2;
MMClipViewInsetShadowAlignBottom=3;
MMClipViewInsetShadowAlignLeft=4;
var _1=objj_allocateClassPair(CPClipView,"MMClipView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_delegate"),new objj_ivar("_delegateRespondsTo_clipView_didScrollToPoint_"),new objj_ivar("_insetShadowAlignment")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("delegate"),function(_3,_4){
with(_3){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_5,_6,_7){
with(_5){
_delegate=_7;
}
}),new objj_method(sel_getUid("insetShadowAlignment"),function(_8,_9){
with(_8){
return _insetShadowAlignment;
}
}),new objj_method(sel_getUid("setInsetShadowAlignment:"),function(_a,_b,_c){
with(_a){
_insetShadowAlignment=_c;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
if(_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("MMClipView").super_class},"initWithFrame:",_f)){
_insetShadowAlignment=MMClipViewInsetShadowAlignNone;
objj_msgSend(_d,"setBackgroundColor:",MMClipViewDefaultBackgroundColor);
}
return _d;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_10,_11,_12){
with(_10){
_delegate=_12;
_delegateRespondsTo_clipView_didScrollToPoint_=objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("clipView:didScrollToPoint:"));
}
}),new objj_method(sel_getUid("scrollToPoint:"),function(_13,_14,_15){
with(_13){
objj_msgSendSuper({receiver:_13,super_class:objj_getClass("MMClipView").super_class},"scrollToPoint:",_15);
if(_delegateRespondsTo_clipView_didScrollToPoint_){
objj_msgSend(_delegate,"clipView:didScrollToPoint:",_13,_15);
}
}
}),new objj_method(sel_getUid("drawRect:"),function(_16,_17,_18){
with(_16){
if(CPFeatureIsCompatible(CPHTMLCanvasFeature)&&_insetShadowAlignment!==MMClipViewInsetShadowAlignNone){
var _19,_1a=objj_msgSend(_16,"frame"),_1b=10;
if(_insetShadowAlignment===MMClipViewInsetShadowAlignTop||_insetShadowAlignment===MMClipViewInsetShadowAlignBottom){
_19=CGRectMake(0,0,CGRectGetWidth(_1a),_1b);
}else{
if(_insetShadowAlignment===MMClipViewInsetShadowAlignLeft||_insetShadowAlignment===MMClipViewInsetShadowAlignRight){
_19=CGRectMake(0,0,_1b,CGRectGetHeight(_1a));
}
}
if(_insetShadowAlignment===MMClipViewInsetShadowAlignBottom){
_19=CGRectOffset(_19,0,CGRectGetHeight(_1a)-_1b);
}else{
if(_insetShadowAlignment===MMClipViewInsetShadowAlignRight){
_19=CGRectOffset(_19,CGRectGetWidth(_1a)-_1b,0);
}
}
if(CGRectIntersectsRect(_18,_19)){
var _1c=_19.origin,_1d=nil;
if(_insetShadowAlignment===MMClipViewInsetShadowAlignTop||_insetShadowAlignment===MMClipViewInsetShadowAlignBottom){
_1d=CGPointMake(CGRectGetMinX(_19),CGRectGetMaxY(_19));
}else{
if(_insetShadowAlignment===MMClipViewInsetShadowAlignLeft||_insetShadowAlignment===MMClipViewInsetShadowAlignRight){
_1d=CGPointMake(CGRectGetMaxX(_19),CGRectGetMinY(_19));
}
}
if(_insetShadowAlignment===MMClipViewInsetShadowAlignTop||_insetShadowAlignment===MMClipViewInsetShadowAlignLeft){
objj_msgSend(_16,"drawShadowInRect:startPoint:endPoint:",_19,_1c,_1d);
}else{
if(_insetShadowAlignment===MMClipViewInsetShadowAlignBottom||_insetShadowAlignment===MMClipViewInsetShadowAlignRight){
objj_msgSend(_16,"drawShadowInRect:startPoint:endPoint:",_19,_1d,_1c);
}
}
}
}
objj_msgSendSuper({receiver:_16,super_class:objj_getClass("MMClipView").super_class},"drawRect:",_18);
}
}),new objj_method(sel_getUid("drawShadowInRect:startPoint:endPoint:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
var _23=objj_msgSend(objj_msgSend(CPGraphicsContext,"currentContext"),"graphicsPort");
var _24;
var _25;
var _26=2;
var _27=[0,1];
var _28=[36/255,36/255,36/255,1,50/255,50/255,50/255,1];
_25=CGColorSpaceCreateDeviceRGB();
_24=CGGradientCreateWithColorComponents(_25,_28,_27,_26);
CGContextAddRect(_23,_20);
CGContextClip(_23);
CGContextDrawLinearGradient(_23,_24,_21,_22,0);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("initialize"),function(_29,_2a){
with(_29){
CachedNotificationCenter=objj_msgSend(CPNotificationCenter,"defaultCenter");
}
})]);
p;17;Views/MMToolbar.jt;1050;@STATIC;1.0;I;15;AppKit/CPView.jt;1011;
objj_executeFile("AppKit/CPView.j",NO);
MMToolbarCocoaStyle="MMToolbarCocoaStyle";
MMToolbarHUDStyle="MMToolbarHUDStyle";
var _1=objj_allocateClassPair(CPView,"MMToolbar"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_3,"initWithFrame:style:",_5,MMToolbarCocoaStyle);
}
}),new objj_method(sel_getUid("initWithFrame:style:"),function(_6,_7,_8,_9){
with(_6){
if(_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("MMToolbar").super_class},"initWithFrame:",_8)){
objj_msgSend(_6,"setStyle:",_9);
}
return _6;
}
}),new objj_method(sel_getUid("setStyle:"),function(_a,_b,_c){
with(_a){
var _d=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",objj_msgSend(CPString,"stringWithFormat:","%@Background.png",_c)));
objj_msgSend(_a,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_d));
}
})]);
p;17;Views/HUDButton.jt;382;@STATIC;1.0;I;17;AppKit/CPButton.jt;342;
objj_executeFile("AppKit/CPButton.j",NO);
var _1=objj_allocateClassPair(CPButton,"HUDButton"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("buttonWithTitle:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_3,"buttonWithTitle:theme:",_5,objj_msgSend(CPTheme,"themeNamed:","Aristo-HUD"));
}
})]);
p;30;Views/MMSectionSettingsSheet.jt;31505;@STATIC;1.0;I;27;AppKit/CPSegmentedControl.jI;15;AppKit/CPView.ji;16;MMFileListView.ji;23;../Models/SectionType.ji;34;../DataSources/MMAgentDataSource.ji;36;../DataSources/MMScannerDataSource.ji;29;../Views/MMPathBrowserSheet.jt;31270;
objj_executeFile("AppKit/CPSegmentedControl.j",NO);
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("MMFileListView.j",YES);
objj_executeFile("../Models/SectionType.j",YES);
objj_executeFile("../DataSources/MMAgentDataSource.j",YES);
objj_executeFile("../DataSources/MMScannerDataSource.j",YES);
objj_executeFile("../Views/MMPathBrowserSheet.j",YES);
MMSectionSettingsSheetReturnSuccess=0;
MMSectionSettingsSheetReturnCancel=1;
var _1=objj_msgSend(CPArray,"arrayWithObjects:","movie","show","artist","photo");
var _2;
var _3=0;
var _4=1;
var _5=24;
var _6=objj_allocateClassPair(CPView,"MMSectionSettingsSheet"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("_settingsPanel"),new objj_ivar("_sectionPopUp"),new objj_ivar("_sectionNameField"),new objj_ivar("_mediaScannerPopUp"),new objj_ivar("_agentPopUp"),new objj_ivar("_languagePopUp"),new objj_ivar("_sourceFolderView"),new objj_ivar("_confirmButton"),new objj_ivar("_cancelButton"),new objj_ivar("advancedButton"),new objj_ivar("addFolderButton"),new objj_ivar("removeFolderButton"),new objj_ivar("advancedView"),new objj_ivar("_didEndSelector"),new objj_ivar("_modalDelegate"),new objj_ivar("_librarySectionsDataSource"),new objj_ivar("_selectedAgentIndex"),new objj_ivar("agentDataSource"),new objj_ivar("scannerDataSource"),new objj_ivar("agents"),new objj_ivar("scanners"),new objj_ivar("savingSection")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("initWithDataSource:"),function(_8,_9,_a){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("MMSectionSettingsSheet").super_class},"init")){
_settingsPanel=nil;
_selectedAgentIndex=CPNotFound;
agentDataSource=objj_msgSend(objj_msgSend(MMAgentDataSource,"alloc"),"initWithDelegate:",_8);
scannerDataSource=objj_msgSend(objj_msgSend(MMScannerDataSource,"alloc"),"initWithDelegate:",_8);
_librarySectionsDataSource=_a;
CPLog.debug("[%@ %@] observing %@",objj_msgSend(_8,"class"),_9,_librarySectionsDataSource);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_8,sel_getUid("dataSourceDidCreateRecord:"),MMDataSourceDidCreateRecord,_librarySectionsDataSource);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_8,sel_getUid("dataSourceDidFailToCreateRecord:"),MMDataSourceDidFailToCreateRecord,_librarySectionsDataSource);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_8,sel_getUid("dataSourceDidUpdateRecord:"),MMDataSourceDidUpdateRecord,_librarySectionsDataSource);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_8,sel_getUid("dataSourceDidFailToUpdateRecord:"),MMDataSourceDidFailToUpdateRecord,_librarySectionsDataSource);
}
return _8;
}
}),new objj_method(sel_getUid("sectionName"),function(_b,_c){
with(_b){
return objj_msgSend(_sectionNameField,"stringValue");
}
}),new objj_method(sel_getUid("sectionType"),function(_d,_e){
with(_d){
return objj_msgSend(_librarySection,"type");
}
}),new objj_method(sel_getUid("sectionScanner"),function(_f,_10){
with(_f){
return objj_msgSend(objj_msgSend(_mediaScannerPopUp,"selectedItem"),"title");
}
}),new objj_method(sel_getUid("sectionAgent"),function(_11,_12){
with(_11){
return objj_msgSend(objj_msgSend(agents,"objectAtIndex:",objj_msgSend(_agentPopUp,"indexOfSelectedItem")),"identifier");
}
}),new objj_method(sel_getUid("layoutPanel"),function(_13,_14){
with(_13){
if(!_settingsPanel){
objj_msgSend(_13,"_createPanel");
}
}
}),new objj_method(sel_getUid("_createPanel"),function(_15,_16){
with(_15){
var _17=16;
_settingsPanel=objj_msgSend(objj_msgSend(CPPanel,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,435,496),CPDocModalWindowMask);
var _18=objj_msgSend(_settingsPanel,"contentView");
var _19=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Name:","Section settings folder list label"));
objj_msgSend(_19,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_19,"sizeToFit");
objj_msgSend(_19,"setFrameOrigin:",CGPointMake(_17,_17));
objj_msgSend(_18,"addSubview:",_19);
_sectionNameField=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","","",CGRectGetWidth(objj_msgSend(_18,"frame"))-(_17-4)*2);
objj_msgSend(_sectionNameField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",24));
objj_msgSend(_sectionNameField,"sizeToFit");
objj_msgSend(_sectionNameField,"setFrameOrigin:",CGPointMake(_17-4,CGRectGetMaxY(objj_msgSend(_19,"frame"))));
objj_msgSend(_sectionNameField,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(_18,"addSubview:",_sectionNameField);
objj_msgSend(_settingsPanel,"setInitialFirstResponder:",_sectionNameField);
var _1a=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Media folders:","Section settings folder list label"));
objj_msgSend(_1a,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(_1a,"sizeToFit");
objj_msgSend(_1a,"setFrameOrigin:",CGPointMake(_17,CGRectGetMaxY(objj_msgSend(_sectionNameField,"frame"))+8));
objj_msgSend(_18,"addSubview:",_1a);
var _1b=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(_17,CGRectGetMaxY(objj_msgSend(_1a,"frame")),CGRectGetWidth(objj_msgSend(_18,"frame"))-_17*2,100));
objj_msgSend(_1b,"setBorderType:",CPLineBorder);
objj_msgSend(_1b,"setHasHorizontalScroller:",NO);
objj_msgSend(_1b,"setAutohidesScrollers:",YES);
objj_msgSend(_18,"addSubview:",_1b);
_sourceFolderView=objj_msgSend(objj_msgSend(MMFileListView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_sourceFolderView,"setFrameSize:",objj_msgSend(_1b,"contentSize"));
objj_msgSend(_sourceFolderView,"setAutoresizingMask:",CPViewWidthSizable|CPViewMaxYMargin);
objj_msgSend(_sourceFolderView,"addObserver:forKeyPath:options:context:",_15,"selectionIndexes",CPKeyValueChangeNewKey,nil);
objj_msgSend(_1b,"setDocumentView:",_sourceFolderView);
addFolderButton=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Add","Add"));
objj_msgSend(addFolderButton,"setTarget:",_15);
objj_msgSend(addFolderButton,"setAction:",sel_getUid("addFolder:"));
objj_msgSend(addFolderButton,"setFrameOrigin:",CGPointMake(_17,CGRectGetMaxY(objj_msgSend(_1b,"frame"))+6));
objj_msgSend(_18,"addSubview:",addFolderButton);
removeFolderButton=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Remove","Remove"));
objj_msgSend(removeFolderButton,"setTarget:",_15);
objj_msgSend(removeFolderButton,"setAction:",sel_getUid("removeFolder:"));
objj_msgSend(removeFolderButton,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(addFolderButton,"frame"))+4,CGRectGetMinY(objj_msgSend(addFolderButton,"frame"))));
objj_msgSend(_18,"addSubview:",removeFolderButton);
var _1c=objj_msgSend(objj_msgSend(CPBox,"alloc"),"initWithFrame:",CGRectMake(_17-4,CGRectGetMaxY(objj_msgSend(removeFolderButton,"frame"))+8,CGRectGetWidth(objj_msgSend(_18,"frame"))-(_17-4)*2,1));
objj_msgSend(_18,"addSubview:",_1c);
advancedView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(_1c,"frame"))+8,CGRectGetWidth(objj_msgSend(_18,"frame")),0));
_mediaScannerPopUp=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_mediaScannerPopUp,"sizeToFit");
objj_msgSend(_mediaScannerPopUp,"setFrame:",CGRectMake(161,0,CGRectGetWidth(objj_msgSend(_18,"frame"))-161-_17,CGRectGetHeight(objj_msgSend(_mediaScannerPopUp,"frame"))));
objj_msgSend(_mediaScannerPopUp,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(advancedView,"addSubview:",_mediaScannerPopUp);
var _1d=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_1d,"setStringValue:",CPLocalizedString("Media scanner:","Media scanner label"));
objj_msgSend(_1d,"sizeToFit");
objj_msgSend(_1d,"setFrameOrigin:",CGPointMake(_17,CGRectGetMinY(objj_msgSend(_mediaScannerPopUp,"frame"))+ROUND((CGRectGetHeight(objj_msgSend(_mediaScannerPopUp,"frame"))-CGRectGetHeight(objj_msgSend(_1d,"frame")))/2)));
objj_msgSend(advancedView,"addSubview:",_1d);
_agentPopUp=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_agentPopUp,"sizeToFit");
objj_msgSend(_agentPopUp,"setFrame:",CGRectMake(161,CGRectGetMaxY(objj_msgSend(_mediaScannerPopUp,"frame"))+6,CGRectGetWidth(objj_msgSend(_18,"frame"))-161-_17,CGRectGetHeight(objj_msgSend(_agentPopUp,"frame"))));
objj_msgSend(_agentPopUp,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(_agentPopUp,"setTarget:",_15);
objj_msgSend(_agentPopUp,"setAction:",sel_getUid("_agentWasClicked"));
objj_msgSend(advancedView,"addSubview:",_agentPopUp);
var _1e=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_1e,"setStringValue:",CPLocalizedString("Primary metadata agent:","Primary metadata agent label"));
objj_msgSend(_1e,"sizeToFit");
objj_msgSend(_1e,"setFrameOrigin:",CGPointMake(_17,CGRectGetMinY(objj_msgSend(_agentPopUp,"frame"))+ROUND((CGRectGetHeight(objj_msgSend(_agentPopUp,"frame"))-CGRectGetHeight(objj_msgSend(_1e,"frame")))/2)));
objj_msgSend(advancedView,"addSubview:",_1e);
_languagePopUp=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_languagePopUp,"sizeToFit");
objj_msgSend(_languagePopUp,"setFrame:",CGRectMake(161,CGRectGetMaxY(objj_msgSend(_agentPopUp,"frame"))+6,CGRectGetWidth(objj_msgSend(_18,"frame"))-161-_17,CGRectGetHeight(objj_msgSend(_languagePopUp,"frame"))));
objj_msgSend(_languagePopUp,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(advancedView,"addSubview:",_languagePopUp);
var _1f=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_1f,"setStringValue:",CPLocalizedString("Language:","Language label"));
objj_msgSend(_1f,"sizeToFit");
objj_msgSend(_1f,"setFrameOrigin:",CGPointMake(_17,CGRectGetMinY(objj_msgSend(_languagePopUp,"frame"))+ROUND((CGRectGetHeight(objj_msgSend(_languagePopUp,"frame"))-CGRectGetHeight(objj_msgSend(_1f,"frame")))/2)));
objj_msgSend(advancedView,"addSubview:",_1f);
var _20=objj_msgSend(objj_msgSend(CPBox,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_1c,"frame")),CGRectGetMaxY(objj_msgSend(_languagePopUp,"frame"))+8,CGRectGetWidth(objj_msgSend(_1c,"frame")),1));
objj_msgSend(advancedView,"addSubview:",_20);
objj_msgSend(advancedView,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(advancedView,"frame")),CGRectGetMaxY(objj_msgSend(_20,"frame"))+8));
objj_msgSend(advancedView,"setHidden:",YES);
objj_msgSend(_18,"addSubview:",advancedView);
_confirmButton=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Add Section","Add section confirm button text"));
objj_msgSend(_confirmButton,"setTag:",MMSectionSettingsSheetReturnSuccess);
objj_msgSend(_confirmButton,"setKeyEquivalent:",CPCarriageReturnCharacter);
objj_msgSend(_confirmButton,"setTarget:",_15);
objj_msgSend(_confirmButton,"setAction:",sel_getUid("_confirmButtonClicked:"));
objj_msgSend(_confirmButton,"sizeToFit");
objj_msgSend(_confirmButton,"setFrameOrigin:",CGPointMake(CGRectGetWidth(objj_msgSend(_18,"frame"))-CGRectGetWidth(objj_msgSend(_confirmButton,"frame"))-_17,CGRectGetMinY(objj_msgSend(advancedView,"frame"))));
objj_msgSend(_18,"addSubview:",_confirmButton);
_cancelButton=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Cancel","Cancel"));
objj_msgSend(_cancelButton,"setTag:",MMSectionSettingsSheetReturnCancel);
objj_msgSend(_cancelButton,"setKeyEquivalent:",CPEscapeFunctionKey);
objj_msgSend(_cancelButton,"setTarget:",_15);
objj_msgSend(_cancelButton,"setAction:",sel_getUid("_cancelButtonClicked:"));
objj_msgSend(_cancelButton,"sizeToFit");
objj_msgSend(_cancelButton,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_confirmButton,"frame"))-CGRectGetWidth(objj_msgSend(_cancelButton,"frame"))-4,CGRectGetMinY(objj_msgSend(_confirmButton,"frame"))));
objj_msgSend(_18,"addSubview:",_cancelButton);
advancedButton=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Advanced…","Section editor Advanced button title"));
objj_msgSend(advancedButton,"setTarget:",_15);
objj_msgSend(advancedButton,"setAction:",sel_getUid("_advancedButtonClicked:"));
objj_msgSend(_18,"addSubview:",advancedButton);
objj_msgSend(_settingsPanel,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_settingsPanel,"frame")),CGRectGetMaxY(objj_msgSend(_cancelButton,"frame"))+_17));
objj_msgSend(_confirmButton,"setAutoresizingMask:",CPViewMinYMargin|CPViewMinXMargin);
objj_msgSend(_cancelButton,"setAutoresizingMask:",CPViewMinYMargin|CPViewMinXMargin);
objj_msgSend(advancedButton,"setAutoresizingMask:",CPViewMinYMargin);
objj_msgSend(_15,"_sectionTypeWasClicked");
}
}),new objj_method(sel_getUid("_setConfirmButtonTitle:"),function(_21,_22,_23){
with(_21){
var _24=CGRectGetMaxX(objj_msgSend(_confirmButton,"frame")),_25=CGRectGetWidth(objj_msgSend(_confirmButton,"frame"));
objj_msgSend(_confirmButton,"setTitle:",_23);
objj_msgSend(_confirmButton,"sizeToFit");
var _26=CGRectGetWidth(objj_msgSend(_confirmButton,"frame")),_27=_26-_25;
objj_msgSend(_confirmButton,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_confirmButton,"frame"))-_27,CGRectGetMinY(objj_msgSend(_confirmButton,"frame"))));
objj_msgSend(_cancelButton,"sizeToFit");
objj_msgSend(_cancelButton,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_cancelButton,"frame"))-_27,CGRectGetMinY(objj_msgSend(_cancelButton,"frame"))));
objj_msgSend(advancedButton,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(addFolderButton,"frame")),CGRectGetMinY(objj_msgSend(_confirmButton,"frame"))));
}
}),new objj_method(sel_getUid("sectionTypeDidChange"),function(_28,_29){
with(_28){
CPLog.trace("[%@ %@] START",objj_msgSend(_28,"class"),_29);
objj_msgSend(_mediaScannerPopUp,"removeAllItems");
objj_msgSend(_agentPopUp,"removeAllItems");
CPLog.trace("TYPE: [%@]",objj_msgSend(objj_msgSend(_28,"sectionType"),"key"));
var _2a=objj_msgSend(objj_msgSend(_28,"sectionType"),"key"),_2b=_2[_2a];
CPLog.debug("[%@ %@] activating name placeholder text: %@",objj_msgSend(_28,"class"),_29,_2b.namePlaceholder);
objj_msgSend(_sectionNameField,"setPlaceholderString:",_2b.namePlaceholder);
objj_msgSend(agentDataSource,"refreshRecordsWithContextInfo:",_2a);
objj_msgSend(scannerDataSource,"refreshRecordsWithContextInfo:",_2a);
CPLog.trace("[%@ %@] END",objj_msgSend(_28,"class"),_29);
}
}),new objj_method(sel_getUid("_selectedScanner"),function(_2c,_2d){
with(_2c){
return objj_msgSend(scanners,"objectAtIndex:",objj_msgSend(_mediaScannerPopUp,"indexOfSelectedItem"));
}
}),new objj_method(sel_getUid("_setSelectedScanner:"),function(_2e,_2f,_30){
with(_2e){
CPLog.trace("[%@ -_setSelectedScanner:] START",objj_msgSend(_2e,"class"));
objj_msgSend(_mediaScannerPopUp,"selectItemAtIndex:",objj_msgSend(scanners,"indexOfObject:",_30));
CPLog.trace("[%@ -_setSelectedScanner:] END",objj_msgSend(_2e,"class"));
}
}),new objj_method(sel_getUid("_selectedAgent"),function(_31,_32){
with(_31){
return objj_msgSend(agents,"objectAtIndex:",objj_msgSend(_agentPopUp,"indexOfSelectedItem"));
}
}),new objj_method(sel_getUid("_setSelectedAgent:"),function(_33,_34,_35){
with(_33){
CPLog.trace("[%@ -_setSelectedAgent:] START",objj_msgSend(_33,"class"));
for(var i=0,_36=objj_msgSend(agents,"count");i<_36;i++){
var _37=objj_msgSend(agents,"objectAtIndex:",i);
if(objj_msgSend(_37,"isEqual:",_35)||objj_msgSend(objj_msgSend(_37,"identifier"),"isEqual:",_35)){
objj_msgSend(_agentPopUp,"selectItemAtIndex:",i);
break;
}
}
objj_msgSend(_33,"_agentWasClicked");
CPLog.trace("[%@ -_setSelectedAgent:] END",objj_msgSend(_33,"class"));
}
}),new objj_method(sel_getUid("_selectDefaultAgent"),function(_38,_39){
with(_38){
var _3a=objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"bundleLocale");
var _3b=nil;
var _3c=nil;
var _3d=nil;
for(var i=0,_3e=objj_msgSend(agents,"count");i<_3e;i++){
var _3f=objj_msgSend(agents,"objectAtIndex:",i),_40=objj_msgSend(_3f,"languages");
for(var j=0,_41=objj_msgSend(_40,"count");j<_41;j++){
var _42=objj_msgSend(_40,"objectAtIndex:",j);
if(objj_msgSend(objj_msgSend(_42,"languageCode"),"caseInsensitiveCompare:",_3a)==CPOrderedSame){
_3c=_3f;
_3d=_42;
break;
}
}
}
if(objj_msgSend(_3a,"isEqualToString:","en")==NO&&_3c){
objj_msgSend(_38,"_setSelectedAgent:",_3c);
objj_msgSend(_38,"_setSelectedLanguage:",_3d);
}else{
if(objj_msgSend(objj_msgSend(_38,"sectionType"),"key")==MMLibrarySectionTypeMovie){
objj_msgSend(_38,"_setSelectedAgent:",MMLibrarySectionDefaultMoviesAgent);
}else{
if(objj_msgSend(objj_msgSend(_38,"sectionType"),"key")==MMLibrarySectionTypeShow){
objj_msgSend(_38,"_setSelectedAgent:",MMLibrarySectionDefaultTVAgent);
}else{
if(objj_msgSend(objj_msgSend(_38,"sectionType"),"key")==MMLibrarySectionTypeArtist){
objj_msgSend(_38,"_setSelectedAgent:",MMLibrarySectionDefaultArtistAgent);
}else{
if(objj_msgSend(objj_msgSend(_38,"sectionType"),"key")==MMLibrarySectionTypePhoto){
objj_msgSend(_38,"_setSelectedAgent:",MMLibrarySectionDefaultPhotoAgent);
}else{
objj_msgSend(_38,"_setSelectedAgent:",objj_msgSend(agents,"objectAtIndex:",0));
}
}
}
}
}
}
}),new objj_method(sel_getUid("_selectedLanguage"),function(_43,_44){
with(_43){
var _45=objj_msgSend(objj_msgSend(_43,"_selectedAgent"),"languages"),_46=objj_msgSend(_languagePopUp,"indexOfSelectedItem");
if(_46==CPNotFound){
return nil;
}
if(_46>=objj_msgSend(_45,"count")){
CPLog.warn("[%@ -_selectedLanguage] index of selected language (%D) out of bounds for languages %@",objj_msgSend(_43,"class"),_46,_45);
return nil;
}
return objj_msgSend(_45,"objectAtIndex:",_46);
}
}),new objj_method(sel_getUid("_setSelectedLanguage:"),function(_47,_48,_49){
with(_47){
CPLog.trace("[%@ -_setSelectedLanguage:] START",objj_msgSend(_47,"class"));
var _4a=objj_msgSend(objj_msgSend(_47,"_selectedAgent"),"languages"),_4b=objj_msgSend(_4a,"indexOfObject:",_49);
if(_4b==CPNotFound){
CPLog.warn("[%@ -_setSelectedLanguage:] unable to find language %@ in %@",objj_msgSend(_47,"class"),_49,_4a);
}else{
CPLog.debug("[%@ -_setSelectedLanguage:] selecting language %@ at index %d",objj_msgSend(_47,"class"),_49,_4b);
objj_msgSend(_languagePopUp,"selectItemAtIndex:",_4b);
}
CPLog.trace("[%@ -_setSelectedLanguage:] END",objj_msgSend(_47,"class"));
}
}),new objj_method(sel_getUid("_savingSection"),function(_4c,_4d){
with(_4c){
return savingSection;
}
}),new objj_method(sel_getUid("_setSavingSection:"),function(_4e,_4f,_50){
with(_4e){
savingSection=_50;
objj_msgSend(_confirmButton,"setEnabled:",!savingSection);
}
}),new objj_method(sel_getUid("_sectionLocations"),function(_51,_52){
with(_51){
return objj_msgSend(_sourceFolderView,"files");
}
}),new objj_method(sel_getUid("_setSectionLocations:"),function(_53,_54,_55){
with(_53){
objj_msgSend(_sourceFolderView,"setFiles:",_55);
}
}),new objj_method(sel_getUid("_sectionTypeWasClicked"),function(_56,_57){
with(_56){
}
}),new objj_method(sel_getUid("_agentWasClicked"),function(_58,_59){
with(_58){
CPLog.trace("[%@ -_agentWasClicked] START",objj_msgSend(_58,"class"));
_selectedAgentIndex=objj_msgSend(_agentPopUp,"indexOfSelectedItem");
objj_msgSend(_languagePopUp,"removeAllItems");
var _5a=objj_msgSend(agents,"objectAtIndex:",_selectedAgentIndex),_5b=objj_msgSend(_5a,"languages");
CPLog.debug("[%@ -_agentWasClicked] activating language options: %@",objj_msgSend(_58,"class"),_5b);
for(var i=0;i<objj_msgSend(_5b,"count");i++){
objj_msgSend(_languagePopUp,"addItemWithTitle:",objj_msgSend(objj_msgSend(_5b,"objectAtIndex:",i),"name"));
}
if(objj_msgSend(_librarySection,"language")){
objj_msgSend(_58,"_setSelectedLanguage:",objj_msgSend(_librarySection,"language"));
}else{
if(objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"bundleLocale")){
objj_msgSend(_58,"_setSelectedLanguage:",objj_msgSend(objj_msgSend(LanguageConfig,"alloc"),"initWithCode:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"bundleLocale")));
}
}
if(objj_msgSend(_58,"_selectedLanguage")===nil){
objj_msgSend(_58,"_setSelectedLanguage:",objj_msgSend(LanguageConfig,"noLanguage"));
}
CPLog.trace("[%@ -_agentWasClicked] END",objj_msgSend(_58,"class"));
}
}),new objj_method(sel_getUid("dataSource:didReceiveRecords:contextInfo:"),function(_5c,_5d,_5e,_5f,_60){
with(_5c){
if(objj_msgSend(_5e,"isEqual:",agentDataSource)){
if(!objj_msgSend(_60,"isEqual:",objj_msgSend(objj_msgSend(_5c,"sectionType"),"key"))){
CPLog.debug("[%@ %@] ignoring agent response for deselected section type %@ (selected is %@)",objj_msgSend(_5c,"class"),_5d,_60,objj_msgSend(objj_msgSend(_5c,"sectionType"),"key"));
return;
}
agents=_5f;
objj_msgSend(_agentPopUp,"removeAllItems");
CPLog.debug("[%@ %@] activating agent options: %@",objj_msgSend(_5c,"class"),_5d,agents);
for(var i=0;i<objj_msgSend(agents,"count");i++){
objj_msgSend(_agentPopUp,"addItemWithTitle:",objj_msgSend(objj_msgSend(agents,"objectAtIndex:",i),"name"));
}
if(objj_msgSend(_librarySection,"agent")){
objj_msgSend(_5c,"_setSelectedAgent:",objj_msgSend(_librarySection,"agent"));
}else{
objj_msgSend(_5c,"_selectDefaultAgent");
}
objj_msgSend(_5c,"_agentWasClicked");
}else{
if(objj_msgSend(_5e,"isEqual:",scannerDataSource)){
if(!objj_msgSend(_60,"isEqual:",objj_msgSend(objj_msgSend(_5c,"sectionType"),"key"))){
CPLog.debug("[%@ %@] ignoring scanner response for deselected section type %@ (selected is %@)",objj_msgSend(_5c,"class"),_5d,_60,objj_msgSend(objj_msgSend(_5c,"sectionType"),"key"));
return;
}
scanners=_5f;
objj_msgSend(_mediaScannerPopUp,"removeAllItems");
CPLog.debug("[%@ %@] activating scanner options: %@",objj_msgSend(_5c,"class"),_5d,scanners);
for(var i=0,_61=objj_msgSend(scanners,"count");i<_61;i++){
objj_msgSend(_mediaScannerPopUp,"addItemWithTitle:",objj_msgSend(objj_msgSend(scanners,"objectAtIndex:",i),"name"));
}
objj_msgSend(_5c,"_setSelectedScanner:",objj_msgSend(_librarySection,"scanner")||objj_msgSend(objj_msgSend(_5c,"sectionType"),"defaultScanner"));
}
}
}
}),new objj_method(sel_getUid("dataSourceDidCreateRecord:"),function(_62,_63,_64){
with(_62){
objj_msgSend(_62,"_dismissPanelWithReturnCode:",MMSectionSettingsSheetReturnSuccess);
objj_msgSend(_62,"_setSavingSection:",NO);
}
}),new objj_method(sel_getUid("dataSourceDidFailToCreateRecord:"),function(_65,_66,_67){
with(_65){
var _68=objj_msgSend(objj_msgSend(_67,"userInfo"),"objectForKey:","error"),_69=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"init");
objj_msgSend(_69,"setAlertStyle:",CPCriticalAlertStyle);
objj_msgSend(_69,"setTitle:",CPLocalizedString("Unable to create library section","Unable to create library section"));
objj_msgSend(_69,"setMessageText:",objj_msgSend(CPString,"stringWithFormat:",_68));
objj_msgSend(_69,"runModal");
objj_msgSend(_65,"_setSavingSection:",NO);
}
}),new objj_method(sel_getUid("dataSourceDidUpdateRecord:"),function(_6a,_6b,_6c){
with(_6a){
objj_msgSend(_6a,"_dismissPanelWithReturnCode:",MMSectionSettingsSheetReturnSuccess);
objj_msgSend(_6a,"_setSavingSection:",NO);
}
}),new objj_method(sel_getUid("dataSourceDidFailToUpdateRecord:"),function(_6d,_6e,_6f){
with(_6d){
var _70=objj_msgSend(objj_msgSend(_6f,"userInfo"),"objectForKey:","error"),_71=objj_msgSend(objj_msgSend(CPAlert,"alloc"),"init");
objj_msgSend(_71,"setAlertStyle:",CPCriticalAlertStyle);
objj_msgSend(_71,"setTitle:",CPLocalizedString("Unable to update library section","Unable to update library section"));
objj_msgSend(_71,"setMessageText:",objj_msgSend(CPString,"stringWithFormat:",_70));
objj_msgSend(_71,"runModal");
objj_msgSend(_6d,"_setSavingSection:",NO);
}
}),new objj_method(sel_getUid("runModal"),function(_72,_73){
with(_72){
objj_msgSend(_72,"layoutPanel");
objj_msgSend(CPApp,"runModalForWindow:",_settingsPanel);
}
}),new objj_method(sel_getUid("beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:"),function(_74,_75,_76,_77,_78,_79){
with(_74){
objj_msgSend(_74,"layoutPanel");
_didEndSelector=_78;
_modalDelegate=_77;
_librarySection=_79;
if(_librarySection){
objj_msgSend(_sectionNameField,"setStringValue:",objj_msgSend(_librarySection,"title"));
if(objj_msgSend(_librarySection,"type")){
objj_msgSend(_74,"sectionTypeDidChange");
objj_msgSend(_74,"_sectionTypeWasClicked");
}
if(objj_msgSend(_librarySection,"scanner")){
objj_msgSend(_74,"_setSelectedScanner:",objj_msgSend(_librarySection,"scanner"));
}
if(objj_msgSend(_librarySection,"agent")){
objj_msgSend(_74,"_setSelectedAgent:",objj_msgSend(_librarySection,"agent"));
}
if(objj_msgSend(_librarySection,"language")){
objj_msgSend(_74,"_setSelectedLanguage:",objj_msgSend(_librarySection,"language"));
}
if(objj_msgSend(objj_msgSend(_librarySection,"locations"),"count")){
objj_msgSend(_74,"_setSectionLocations:",objj_msgSend(_librarySection,"locations"));
}
objj_msgSend(_74,"_setConfirmButtonTitle:",objj_msgSend(_librarySection,"isNewRecord")?CPLocalizedString("Add Section","Add section confirm button text"):CPLocalizedString("Update Section","Update section confirm button text"));
}
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",_settingsPanel,_76,_74,sel_getUid("_editDidEnd:returnCode:contextInfo:"),_79);
}
}),new objj_method(sel_getUid("beginSheetModalForWindow:"),function(_7a,_7b,_7c){
with(_7a){
objj_msgSend(_7a,"layoutPanel");
_didEndSelector=nil;
_modalDelegate=nil;
_librarySection=nil;
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",_settingsPanel,_7c,_7a,sel_getUid("_editDidEnd:returnCode:contextInfo:"),nil);
}
}),new objj_method(sel_getUid("_editDidEnd:returnCode:contextInfo:"),function(_7d,_7e,_7f,_80,_81){
with(_7d){
if(_didEndSelector){
objj_msgSend(_modalDelegate,_didEndSelector,_7d,_80,_81);
}
_didEndSelector=nil;
_modalDelegate=nil;
_librarySection=nil;
}
}),new objj_method(sel_getUid("_confirmButtonClicked:"),function(_82,_83,_84){
with(_82){
if(savingSection){
return;
}
var _85=objj_msgSend(_82,"_selectedAgent"),_86=objj_msgSend(_82,"_selectedLanguage");
objj_msgSend(_librarySection,"setTitle:",objj_msgSend(_sectionNameField,"stringValue"));
objj_msgSend(_librarySection,"setScanner:",objj_msgSend(_82,"_selectedScanner"));
objj_msgSend(_librarySection,"setAgent:",_85);
objj_msgSend(_librarySection,"setType:",objj_msgSend(objj_msgSend(_82,"sectionType"),"key"));
objj_msgSend(_librarySection,"setLocations:",objj_msgSend(_82,"_sectionLocations"));
objj_msgSend(_librarySection,"setLanguage:",_86);
if(objj_msgSend(_librarySection,"isNewRecord")){
objj_msgSend(_librarySectionsDataSource,"createRecord:",_librarySection);
}else{
objj_msgSend(_librarySectionsDataSource,"updateRecord:",_librarySection);
}
objj_msgSend(_82,"_setSavingSection:",YES);
}
}),new objj_method(sel_getUid("_cancelButtonClicked:"),function(_87,_88,_89){
with(_87){
objj_msgSend(_87,"_dismissPanelWithReturnCode:",objj_msgSend(_89,"tag"));
}
}),new objj_method(sel_getUid("_advancedButtonClicked:"),function(_8a,_8b,_8c){
with(_8a){
if(!objj_msgSend(advancedView,"isHidden")){
return;
}
var _8d=objj_msgSend(advancedView,"window"),_8e=objj_msgSend(_8d,"frame"),_8f=CGRectMake(CGRectGetMinX(_8e),CGRectGetMinY(_8e),CGRectGetWidth(_8e),CGRectGetHeight(_8e)+CGRectGetHeight(objj_msgSend(advancedView,"frame"))),_90=objj_msgSend(_8d,"animationResizeTime:",_8f),_91=CGRectMake(CGRectGetMinX(objj_msgSend(advancedView,"frame")),CGRectGetMinY(objj_msgSend(advancedView,"frame")),CGRectGetWidth(objj_msgSend(advancedView,"frame")),0),_92=objj_msgSend(advancedView,"frame");
var _93=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithDuration:animationCurve:",_90,CPAnimationLinear);
objj_msgSend(_93,"setViewAnimations:",objj_msgSend(CPArray,"arrayWithObjects:",objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",advancedView,CPViewAnimationTargetKey,_91,CPViewAnimationStartFrameKey,_92,CPViewAnimationEndFrameKey)));
objj_msgSend(_93,"startAnimation");
objj_msgSend(_8d,"setFrame:display:animate:",_8f,YES,YES);
objj_msgSend(_8c,"setHidden:",YES);
}
}),new objj_method(sel_getUid("_dismissPanelWithReturnCode:"),function(_94,_95,_96){
with(_94){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_94,MMDataSourceDidCreateRecord,_librarySectionsDataSource);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_94,MMDataSourceDidFailToCreateRecord,_librarySectionsDataSource);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_94,MMDataSourceDidUpdateRecord,_librarySectionsDataSource);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_94,MMDataSourceDidFailToUpdateRecord,_librarySectionsDataSource);
if(objj_msgSend(_settingsPanel,"isSheet")){
objj_msgSend(CPApp,"endSheet:returnCode:",_settingsPanel,_96);
}else{
objj_msgSend(CPApp,"abortModal");
objj_msgSend(_settingsPanel,"close");
objj_msgSend(_94,"_editDidEnd:returnCode:contextInfo:",nil,_96,_librarySection);
}
}
}),new objj_method(sel_getUid("addFolder:"),function(_97,_98,_99){
with(_97){
var _9a=objj_msgSend(objj_msgSend(MMPathBrowserSheet,"alloc"),"initWithContentRect:styleMask:",CGRectMake(0,0,400,300),CPDocModalWindowMask);
objj_msgSend(_9a,"setTitle:",CPLocalizedString("Select a path for this section:","Path-browser title when adding/editing sections"));
objj_msgSend(_9a,"setDelegate:",_97);
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",_9a,_settingsPanel,nil,nil,nil);
}
}),new objj_method(sel_getUid("removeFolder:"),function(_9b,_9c,_9d){
with(_9b){
objj_msgSend(_sourceFolderView,"removeFilesAtIndexes:",objj_msgSend(_sourceFolderView,"selectionIndexes"));
}
}),new objj_method(sel_getUid("pathBrowserSheet:didChoosePath:"),function(_9e,_9f,_a0,_a1){
with(_9e){
objj_msgSend(_sourceFolderView,"addFileWithPath:",objj_msgSend(_a1,"path"));
objj_msgSend(CPApp,"endSheet:returnCode:",_a0,0);
}
}),new objj_method(sel_getUid("pathBrowserSheetDidCancel:"),function(_a2,_a3,_a4){
with(_a2){
objj_msgSend(CPApp,"endSheet:returnCode:",_a4,1);
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_a5,_a6,_a7,_a8,_a9,_aa){
with(_a5){
if(_a8==_sourceFolderView&&_a7=="selectionIndexes"){
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,_a5,sel_getUid("_syncRemoveButtonEnabled"),nil,NO);
}
}
}),new objj_method(sel_getUid("_syncRemoveButtonEnabled"),function(_ab,_ac){
with(_ab){
objj_msgSend(removeFolderButton,"setEnabled:",(objj_msgSend(objj_msgSend(_sourceFolderView,"selectionIndexes"),"count")!=0));
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("initialize"),function(_ad,_ae){
with(_ad){
_2={movie:{namePlaceholder:CPLocalizedString("My Movies","Movie section name placeholder")},show:{namePlaceholder:CPLocalizedString("My TV Shows","TV Shows section name placeholder")},artist:{namePlaceholder:CPLocalizedString("My Music","Music section name placeholder")},photo:{namePlaceholder:CPLocalizedString("My Photos","Photo section name placeholder")}};
}
}),new objj_method(sel_getUid("_menuItemWithTitle:tag:"),function(_af,_b0,_b1,tag){
with(_af){
var _b2=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_b1,nil,nil);
objj_msgSend(_b2,"setTag:",tag);
return _b2;
}
})]);
p;22;Views/MMFileListView.jt;5933;@STATIC;1.0;I;25;AppKit/CPCollectionView.ji;20;MMFileListViewItem.jt;5859;
objj_executeFile("AppKit/CPCollectionView.j",NO);
objj_executeFile("MMFileListViewItem.j",YES);
var _1=objj_allocateClassPair(CPCollectionView,"MMFileListView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_filesController")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMFileListView").super_class},"initWithFrame:",_5)){
var _6=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init");
objj_msgSend(_6,"setView:",objj_msgSend(objj_msgSend(MMFileListViewItem,"alloc"),"initWithFrame:",CGRectMakeZero()));
objj_msgSend(_3,"setItemPrototype:",_6);
objj_msgSend(_3,"setMaxNumberOfColumns:",1);
objj_msgSend(_3,"setMinItemSize:",CGSizeMake(20,45));
objj_msgSend(_3,"setMaxItemSize:",CGSizeMake(1000,45));
objj_msgSend(_3,"setVerticalMargin:",0);
objj_msgSend(_3,"setBackgroundColors:",MMFileListViewItemBackgroundColors);
objj_msgSend(_3,"setBackgroundColor:",objj_msgSend(MMFileListViewItemBackgroundColors,"objectAtIndex:",0));
var _7=function(e){
e.preventDefault();
return false;
},_8=class_getMethodImplementation(objj_msgSend(_3,"class"),sel_getUid("dropPerformedWithPasteboard:")),_9=function(e){
var _a=objj_msgSend(_CPDOMDataTransferPasteboard,"DOMDataTransferPasteboard");
objj_msgSend(_a,"_setDataTransfer:",e.dataTransfer);
if(e.preventDefault){
e.preventDefault();
}
_8(_3,nil,_a);
};
if(document.attachEvent){
_DOMElement.attachEvent("ondragenter",_7);
_DOMElement.attachEvent("ondragover",_7);
_DOMElement.attachEvent("ondrop",_9);
}else{
_DOMElement.addEventListener("dragenter",_7,false);
_DOMElement.addEventListener("dragover",_7,false);
_DOMElement.addEventListener("drop",_9,false);
}
_filesController=objj_msgSend(objj_msgSend(CPArrayController,"alloc"),"init");
objj_msgSend(_3,"bind:toObject:withKeyPath:options:","selectionIndexes",_filesController,"selectionIndexes",nil);
}
return _3;
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_b,_c){
with(_b){
objj_msgSend(_items,"enumerateObjectsUsingBlock:",function(_d){
objj_msgSend(objj_msgSend(_d,"view"),"setNeedsDisplay:",YES);
});
return objj_msgSendSuper({receiver:_b,super_class:objj_getClass("MMFileListView").super_class},"becomeFirstResponder");
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_e,_f){
with(_e){
objj_msgSend(_items,"enumerateObjectsUsingBlock:",function(_10){
objj_msgSend(objj_msgSend(_10,"view"),"setNeedsDisplay:",YES);
});
return objj_msgSendSuper({receiver:_e,super_class:objj_getClass("MMFileListView").super_class},"resignFirstResponder");
}
}),new objj_method(sel_getUid("reloadContent"),function(_11,_12){
with(_11){
objj_msgSendSuper({receiver:_11,super_class:objj_getClass("MMFileListView").super_class},"reloadContent");
var _13=0,_14=objj_msgSend(_11,"backgroundColors"),_15=objj_msgSend(_14,"count"),_16=objj_msgSend(_items,"count");
if(!_15){
return;
}
CPLog.trace("[%@ -%@] repainting background for %d item(s) with %d background(s)",objj_msgSend(_11,"class"),_12,_16,_15);
for(var _17=0;_17<_16;_17++,_13++){
if(objj_msgSend(_selectionIndexes,"containsIndex:",_17)){
continue;
}
_13=_13%_15;
objj_msgSend(objj_msgSend(_items[_17],"view"),"setBackgroundColor:",_14[_13]);
}
}
}),new objj_method(sel_getUid("dropPerformedWithPasteboard:"),function(_18,_19,_1a){
with(_18){
var _1b=objj_msgSend(objj_msgSend(_1a,"dataForType:","text/uri-list"),"rawString");
CPLog.debug("[%@ -%@:] got a drop with files: %@",objj_msgSend(_18,"class"),_19,_1b);
if(!_1b){
return;
}
var _1c=objj_msgSend(CPString,"stringWithString:",_1b).split(/\s+/);
for(var i=0;i<objj_msgSend(_1c,"count");i++){
objj_msgSend(_18,"addFileWithURI:",objj_msgSend(_1c,"objectAtIndex:",i));
}
}
}),new objj_method(sel_getUid("addFileWithURI:"),function(_1d,_1e,uri){
with(_1d){
var _1f=objj_msgSend(CPArray,"arrayWithObjects:","file://localhost","file://"),_20;
for(var i=0;i<objj_msgSend(_1f,"count");i++){
_20=objj_msgSend(uri,"rangeOfString:",objj_msgSend(_1f,"objectAtIndex:",i));
if(_20.location==0){
uri=objj_msgSend(uri,"stringByReplacingCharactersInRange:withString:",_20,"");
}
}
objj_msgSend(_1d,"addFileWithPath:",decodeURIComponent(uri));
}
}),new objj_method(sel_getUid("addFileWithPath:"),function(_21,_22,_23){
with(_21){
objj_msgSend(_21,"addFileWithPath:reload:",_23,YES);
}
}),new objj_method(sel_getUid("addFileWithPath:reload:"),function(_24,_25,_26,_27){
with(_24){
_26=objj_msgSend(_26,"stringByReplacingOccurrencesOfString:withString:","\\","/");
if(objj_msgSend(objj_msgSend(_26,"substringFromIndex:",objj_msgSend(_26,"length")-1),"isEqualToString:","/")){
_26=objj_msgSend(_26,"substringToIndex:",objj_msgSend(_26,"length")-1);
}
if(objj_msgSend(objj_msgSend(_filesController,"content"),"containsObject:",_26)){
CPLog.warn("[%@ -%@] skipping %@ since we already have it",objj_msgSend(_24,"class"),_25,_26);
return;
}
CPLog.debug("[%@ -%@] adding %@",objj_msgSend(_24,"class"),_25,_26);
objj_msgSend(_filesController,"addObject:",_26);
if(_27){
objj_msgSend(_24,"reload");
}
}
}),new objj_method(sel_getUid("files"),function(_28,_29){
with(_28){
return objj_msgSend(_filesController,"arrangedObjects");
}
}),new objj_method(sel_getUid("setFiles:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_filesController,"setContent:",[]);
for(var i=0;i<objj_msgSend(_2c,"count");i++){
objj_msgSend(_2a,"addFileWithPath:reload:",objj_msgSend(_2c,"objectAtIndex:",i),NO);
}
objj_msgSend(_2a,"reload");
}
}),new objj_method(sel_getUid("removeFilesAtIndexes:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(_filesController,"removeObjectsAtArrangedObjectIndexes:",_2f);
objj_msgSend(_2d,"reload");
}
}),new objj_method(sel_getUid("reload"),function(_30,_31){
with(_30){
objj_msgSend(_30,"setContent:",objj_msgSend(_filesController,"content"));
objj_msgSend(_30,"needsDisplay");
}
})]);
p;26;Views/MMFileListViewItem.jt;4934;@STATIC;1.0;I;15;AppKit/CPView.jt;4895;
objj_executeFile("AppKit/CPView.j",NO);
var _1=10;
var _2=CGSizeMake(36,36);
MMFileListViewItemSelectedColor=objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",56/255,117/255,215/255,1);
MMFileListViewItemSelectedBlurredColor=objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",212/255,1);
MMFileListViewItemBackgroundColors=objj_msgSend(CPArray,"arrayWithObjects:",objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",237/255,243/255,254/255,1));
MMFileListViewItemFolderIcon=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","folder.png"),CGSizeMake(128,128));
MMFileListViewItemFileIcon=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","file.png"),CGSizeMake(128,128));
var _3=objj_allocateClassPair(CPView,"MMFileListViewItem"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("pathImage"),new objj_ivar("pathLabel"),new objj_ivar("originalBackgroundColor"),new objj_ivar("selected")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("isSelected"),function(_5,_6){
with(_5){
return selected;
}
}),new objj_method(sel_getUid("setSelected:"),function(_7,_8,_9){
with(_7){
selected=_9;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_a,_b,_c){
with(_a){
if(_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("MMFileListViewItem").super_class},"initWithFrame:",_c)){
pathImage=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(_1,(CGRectGetHeight(objj_msgSend(_a,"frame"))-_2.height)/2,_2.width,_2.height));
objj_msgSend(pathImage,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_a,"addSubview:",pathImage);
pathLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(pathLabel,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(pathLabel,"sizeToFit");
objj_msgSend(pathLabel,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(pathImage,"frame"))+8,(CGRectGetHeight(objj_msgSend(_a,"frame"))-CGRectGetHeight(objj_msgSend(pathLabel,"frame")))/2));
objj_msgSend(pathLabel,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_a,"frame"))-CGRectGetMinX(objj_msgSend(pathLabel,"frame")),CGRectGetHeight(objj_msgSend(pathLabel,"frame"))));
objj_msgSend(pathLabel,"setAutoresizingMask:",CPViewWidthSizable|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(pathLabel,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_a,"addSubview:",pathLabel);
}
return _a;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_d,_e,_f){
with(_d){
objj_msgSend(pathLabel,"setStringValue:",_f);
objj_msgSend(pathImage,"setObjectValue:",!_f?nil:(objj_msgSend(objj_msgSend(_f,"lastPathComponent"),"rangeOfString:",".").location==CPNotFound)?MMFileListViewItemFolderIcon:MMFileListViewItemFileIcon);
}
}),new objj_method(sel_getUid("setSelected:"),function(_10,_11,_12){
with(_10){
selected=_12;
objj_msgSend(_10,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("drawRect:"),function(_13,_14,_15){
with(_13){
if(!originalBackgroundColor){
originalBackgroundColor=objj_msgSend(_13,"backgroundColor");
}
var _16=!objj_msgSend(objj_msgSend(_13,"superview"),"isFirstResponder");
objj_msgSend(_13,"setBackgroundColor:",(selected&&_16)?MMFileListViewItemSelectedBlurredColor:selected?MMFileListViewItemSelectedColor:originalBackgroundColor);
objj_msgSend(pathLabel,"setTextColor:",(selected&&!_16)?objj_msgSend(CPColor,"whiteColor"):objj_msgSend(CPColor,"blackColor"));
objj_msgSendSuper({receiver:_13,super_class:objj_getClass("MMFileListViewItem").super_class},"drawRect:",_15);
}
})]);
var _17="MMFileListViewItemPathLabelKey";
var _18="MMFileListViewItemOriginalBackgroundColorKey";
var _19="MMFileListViewItemPathImageKey";
var _3=objj_getClass("MMFileListViewItem");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"MMFileListViewItem\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("initWithCoder:"),function(_1a,_1b,_1c){
with(_1a){
if(_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("MMFileListViewItem").super_class},"initWithCoder:",_1c)){
pathLabel=objj_msgSend(_1c,"decodeObjectForKey:",_17);
pathImage=objj_msgSend(_1c,"decodeObjectForKey:",_19);
originalBackgroundColor=objj_msgSend(_1c,"decodeObjectForKey:",_18);
}
return _1a;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_1d,_1e,_1f){
with(_1d){
objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("MMFileListViewItem").super_class},"encodeWithCoder:",_1f);
objj_msgSend(_1f,"encodeObject:forKey:",pathLabel,_17);
objj_msgSend(_1f,"encodeObject:forKey:",pathImage,_19);
objj_msgSend(_1f,"encodeObject:forKey:",originalBackgroundColor,_18);
}
})]);
p;33;DataSources/MMScannerDataSource.jt;2171;@STATIC;1.0;i;14;MMDataSource.ji;21;../Models/MMScanner.jt;2107;
objj_executeFile("MMDataSource.j",YES);
objj_executeFile("../Models/MMScanner.j",YES);
var _1=objj_msgSend(CPMutableDictionary,"dictionaryWithObjectsAndKeys:",objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(objj_msgSend(MMScanner,"alloc"),"initWithName:","Plex Movie Scanner")),MMLibrarySectionTypeMovie,objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(objj_msgSend(MMScanner,"alloc"),"initWithName:","Plex Series Scanner")),MMLibrarySectionTypeShow,objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(objj_msgSend(MMScanner,"alloc"),"initWithName:","Plex Music Scanner")),MMLibrarySectionTypeArtist);
var _2=objj_allocateClassPair(MMDataSource,"MMScannerDataSource"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("URLForRecordsWithContextInfo:"),function(_4,_5,_6){
with(_4){
var _7=_6;
if(objj_msgSend(MediaTypeCodeMap,"containsKey:",_7)){
_7=objj_msgSend(MediaTypeCodeMap,"objectForKey:",_7);
}
return objj_msgSend(PMSURL,"URLWithPath:",objj_msgSend(CPString,"stringWithFormat:","/system/scanners/%@",_7));
}
}),new objj_method(sel_getUid("shouldProcessNode:contextInfo:"),function(_8,_9,_a,_b){
with(_8){
return objj_msgSend(String(_a.tagName),"isEqualToString:","Scanner");
}
}),new objj_method(sel_getUid("recordsFromElement:contextInfo:"),function(_c,_d,_e,_f){
with(_c){
return objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(objj_msgSend(MMScanner,"alloc"),"initWithName:",String(_e.getAttribute("name"))));
}
}),new objj_method(sel_getUid("connection:didFailWithError:"),function(_10,_11,_12,_13){
with(_10){
var _14=objj_msgSend(statusCodeByConnection,"objectForKey:",_12),_15=objj_msgSend(contextInfoByConnection,"objectForKey:",_12);
if(objj_msgSend(recordsByRefreshConnection,"containsKey:",_12)&&_14==404){
objj_msgSend(recordsByRefreshConnection,"removeObjectForKey:",_12);
objj_msgSend(_10,"didReceiveRecords:connection:contextInfo:",objj_msgSend(_1,"objectForKey:",_15),_12,_15);
}else{
objj_msgSendSuper({receiver:_10,super_class:objj_getClass("MMScannerDataSource").super_class},"connection:didFailWithError:",_12,_13);
}
}
})]);
p;26;Views/MMPathBrowserSheet.jt;4856;@STATIC;1.0;I;16;AppKit/CPPanel.ji;19;MMPathBrowserView.jt;4792;
objj_executeFile("AppKit/CPPanel.j",NO);
objj_executeFile("MMPathBrowserView.j",YES);
var _1=objj_allocateClassPair(CPPanel,"MMPathBrowserSheet"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_delegate"),new objj_ivar("_title"),new objj_ivar("_titleLabel"),new objj_ivar("_browser"),new objj_ivar("_browserContainer")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("delegate"),function(_3,_4){
with(_3){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_5,_6,_7){
with(_5){
_delegate=_7;
}
}),new objj_method(sel_getUid("title"),function(_8,_9){
with(_8){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_a,_b,_c){
with(_a){
_title=_c;
}
}),new objj_method(sel_getUid("initWithContentRect:styleMask:"),function(_d,_e,_f,_10){
with(_d){
if(_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("MMPathBrowserSheet").super_class},"initWithContentRect:styleMask:",_f,_10)){
var _11=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_f),_12=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Select Folder","Select Folder")),_13=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Cancel","Cancel")),_14=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Manual Entry","Button text for the path browser to allow the user to type in a path manually"));
_titleLabel=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(_titleLabel,"setFrame:",CGRectMake(15,10,CGRectGetWidth(objj_msgSend(_11,"frame"))-30,CGRectGetHeight(objj_msgSend(_titleLabel,"frame"))));
objj_msgSend(_12,"setFrameOrigin:",CGPointMake(CGRectGetWidth(objj_msgSend(_11,"frame"))-15-CGRectGetWidth(objj_msgSend(_12,"frame")),CGRectGetHeight(objj_msgSend(_11,"frame"))-15-CGRectGetHeight(objj_msgSend(_12,"frame"))));
objj_msgSend(_13,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_12,"frame"))-4-CGRectGetWidth(objj_msgSend(_13,"frame")),CGRectGetMinY(objj_msgSend(_12,"frame"))));
objj_msgSend(_14,"setFrameOrigin:",CGPointMake(15,CGRectGetMinY(objj_msgSend(_12,"frame"))));
objj_msgSend(_12,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(_13,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(_14,"setAutoresizingMask:",CPViewMaxXMargin|CPViewMinYMargin);
objj_msgSend(_12,"setKeyEquivalent:",CPCarriageReturnCharacter);
objj_msgSend(_13,"setKeyEquivalent:",CPEscapeFunctionKey);
objj_msgSend(_12,"setTarget:",_d);
objj_msgSend(_12,"setAction:",sel_getUid("choose:"));
objj_msgSend(_13,"setTarget:",_d);
objj_msgSend(_13,"setAction:",sel_getUid("cancel:"));
objj_msgSend(_14,"setTarget:",_d);
objj_msgSend(_14,"setAction:",sel_getUid("promptForManualEntry:"));
_browser=objj_msgSend(objj_msgSend(MMPathBrowserView,"alloc"),"initWithFrame:",CGRectMake(15,CGRectGetMaxY(objj_msgSend(_titleLabel,"frame")),CGRectGetWidth(objj_msgSend(_11,"frame"))-30,CGRectGetHeight(objj_msgSend(_11,"frame"))-20-CGRectGetMaxY(objj_msgSend(_titleLabel,"frame"))-CGRectGetHeight(objj_msgSend(_12,"frame"))));
objj_msgSend(_12,"bind:toObject:withKeyPath:options:","enabled",_browser,"selectedPath",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPIsNotNilTransformerName,CPValueTransformerNameBindingOption));
objj_msgSend(_11,"addSubview:",_titleLabel);
objj_msgSend(_11,"addSubview:",_browser);
objj_msgSend(_11,"addSubview:",_12);
objj_msgSend(_11,"addSubview:",_13);
objj_msgSend(_11,"addSubview:",_14);
_browserContainer=objj_msgSend(CPBox,"boxEnclosingView:",_browser);
objj_msgSend(_d,"setContentView:",_11);
}
return _d;
}
}),new objj_method(sel_getUid("choose:"),function(_15,_16,_17){
with(_15){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("pathBrowserSheet:didChoosePath:"))&&objj_msgSend(_browser,"selectedPath")){
objj_msgSend(_delegate,"pathBrowserSheet:didChoosePath:",_15,objj_msgSend(_browser,"selectedPath"));
}
}
}),new objj_method(sel_getUid("cancel:"),function(_18,_19,_1a){
with(_18){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("pathBrowserSheetDidCancel:"))){
objj_msgSend(_delegate,"pathBrowserSheetDidCancel:",_18);
}
}
}),new objj_method(sel_getUid("promptForManualEntry:"),function(_1b,_1c,_1d){
with(_1b){
var _1e=prompt(CPLocalizedString("Path of the directory you'd like to add:","Instruction text for the prompt to add directories manually"));
if(_1e){
var _1f=objj_msgSend(objj_msgSend(MMPath,"alloc"),"init");
objj_msgSend(_1f,"setPath:",_1e);
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("pathBrowserSheet:didChoosePath:"))){
objj_msgSend(_delegate,"pathBrowserSheet:didChoosePath:",_1b,_1f);
}
}
}
}),new objj_method(sel_getUid("setTitle:"),function(_20,_21,_22){
with(_20){
if(_22==_title){
return;
}
_title=_22;
objj_msgSend(_titleLabel,"setStringValue:",_title);
}
})]);
p;25;Views/MMPathBrowserView.jt;4017;@STATIC;1.0;I;15;AppKit/CPView.jI;22;AppKit/CPOutlineView.ji;40;../DataSources/MMPathBrowserDataSource.ji;18;../Models/MMPath.jt;3883;
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("AppKit/CPOutlineView.j",NO);
objj_executeFile("../DataSources/MMPathBrowserDataSource.j",YES);
objj_executeFile("../Models/MMPath.j",YES);
var _1=objj_msgSend(objj_msgSend(CPObject,"alloc"),"init");
var _2=objj_allocateClassPair(CPView,"MMPathBrowserView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("dataSource"),new objj_ivar("childrenByPath"),new objj_ivar("outlineView")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_4,_5,_6){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("MMPathBrowserView").super_class},"initWithFrame:",_6)){
dataSource=objj_msgSend(objj_msgSend(MMPathBrowserDataSource,"alloc"),"initWithDelegate:",_4);
childrenByPath=objj_msgSend(CPDictionary,"dictionary");
var _7=objj_msgSend(objj_msgSend(MMScrollView,"alloc"),"initWithFrame:",objj_msgSend(_4,"bounds"));
objj_msgSend(_7,"setHasHorizontalScroller:",NO);
outlineView=objj_msgSend(objj_msgSend(CPOutlineView,"alloc"),"initWithFrame:",objj_msgSend(objj_msgSend(_7,"contentView"),"bounds"));
objj_msgSend(outlineView,"setRowHeight:",17);
objj_msgSend(outlineView,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_7,"setDocumentView:",outlineView);
var _8=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","TextColumn");
objj_msgSend(_8,"setWidth:",CGRectGetWidth(objj_msgSend(outlineView,"frame"))-10);
objj_msgSend(outlineView,"setHeaderView:",nil);
objj_msgSend(outlineView,"setCornerView:",nil);
objj_msgSend(outlineView,"addTableColumn:",_8);
objj_msgSend(outlineView,"setOutlineTableColumn:",_8);
objj_msgSend(outlineView,"setDataSource:",_4);
objj_msgSend(outlineView,"setDelegate:",_4);
objj_msgSend(_4,"addSubview:",_7);
}
return _4;
}
}),new objj_method(sel_getUid("selectedPath"),function(_9,_a){
with(_9){
return objj_msgSend(outlineView,"itemAtRow:",objj_msgSend(outlineView,"selectedRow"));
}
}),new objj_method(sel_getUid("childrenOfPath:"),function(_b,_c,_d){
with(_b){
var _e=objj_msgSend(childrenByPath,"objectForKey:",_d);
if(!_e){
objj_msgSend(dataSource,"refreshRecordsWithContextInfo:",_d);
}
return _e;
}
}),new objj_method(sel_getUid("hasLoadedChildrenOfPath:"),function(_f,_10,_11){
with(_f){
return objj_msgSend(childrenByPath,"containsKey:",_11);
}
}),new objj_method(sel_getUid("dataSource:didReceiveRecords:contextInfo:"),function(_12,_13,_14,_15,_16){
with(_12){
objj_msgSend(childrenByPath,"setObject:forKey:",_15,_16);
objj_msgSend(outlineView,"reloadItem:reloadChildren:",_16,YES);
}
}),new objj_method(sel_getUid("outlineView:child:ofItem:"),function(_17,_18,_19,_1a,_1b){
with(_17){
if(objj_msgSend(_17,"hasLoadedChildrenOfPath:",_1b)){
return objj_msgSend(objj_msgSend(_17,"childrenOfPath:",_1b),"objectAtIndex:",_1a);
}
return _1;
}
}),new objj_method(sel_getUid("outlineView:numberOfChildrenOfItem:"),function(_1c,_1d,_1e,_1f){
with(_1c){
var _20=objj_msgSend(_1c,"childrenOfPath:",_1f);
if(_20){
return objj_msgSend(_20,"count");
}
return 1;
}
}),new objj_method(sel_getUid("outlineView:isItemExpandable:"),function(_21,_22,_23,_24){
with(_21){
if(objj_msgSend(_21,"hasLoadedChildrenOfPath:",_24)){
return objj_msgSend(objj_msgSend(_21,"childrenOfPath:",_24),"count")>0;
}
return YES;
}
}),new objj_method(sel_getUid("outlineView:objectValueForTableColumn:byItem:"),function(_25,_26,_27,_28,_29){
with(_25){
switch(_29){
case nil:
return "/";
case _1:
return CPLocalizedString("Loading…","Loading label");
default:
return objj_msgSend(_29,"title");
}
}
}),new objj_method(sel_getUid("outlineViewSelectionIsChanging:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_2a,"willChangeValueForKey:","selectedPath");
}
}),new objj_method(sel_getUid("outlineViewSelectionDidChange:"),function(_2d,_2e,_2f){
with(_2d){
objj_msgSend(_2d,"didChangeValueForKey:","selectedPath");
}
})]);
p;37;DataSources/MMPathBrowserDataSource.jt;838;@STATIC;1.0;i;14;MMDataSource.ji;18;../Models/MMPath.jt;778;
objj_executeFile("MMDataSource.j",YES);
objj_executeFile("../Models/MMPath.j",YES);
var _1=objj_allocateClassPair(MMDataSource,"MMPathBrowserDataSource"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("URLForRecordsWithContextInfo:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(PMSURL,"URLWithPath:",objj_msgSend(_5,"key")||"/services/browse");
}
}),new objj_method(sel_getUid("shouldProcessNode:contextInfo:"),function(_6,_7,_8,_9){
with(_6){
return String(_8.nodeName)=="Path";
}
}),new objj_method(sel_getUid("recordFromElement:contextInfo:"),function(_a,_b,_c,_d){
with(_a){
var _e=objj_msgSend(objj_msgSend(MMPath,"alloc"),"init");
objj_msgSend(_e,"setValuesForNodeAttributes:ignoreUndefinedKeys:",_c,YES);
return _e;
}
})]);
p;15;Models/MMPath.jt;2270;@STATIC;1.0;I;21;Foundation/CPObject.jt;2225;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"MMPath"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("title"),new objj_ivar("key"),new objj_ivar("path"),new objj_ivar("children")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("title"),function(_3,_4){
with(_3){
return title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_5,_6,_7){
with(_5){
title=_7;
}
}),new objj_method(sel_getUid("key"),function(_8,_9){
with(_8){
return key;
}
}),new objj_method(sel_getUid("setKey:"),function(_a,_b,_c){
with(_a){
key=_c;
}
}),new objj_method(sel_getUid("path"),function(_d,_e){
with(_d){
return path;
}
}),new objj_method(sel_getUid("setPath:"),function(_f,_10,_11){
with(_f){
path=_11;
}
}),new objj_method(sel_getUid("children"),function(_12,_13){
with(_12){
return children;
}
}),new objj_method(sel_getUid("setChildren:"),function(_14,_15,_16){
with(_14){
children=_16;
}
}),new objj_method(sel_getUid("isRoot"),function(_17,_18){
with(_17){
return path==nil||objj_msgSend(path,"isEqualToString:","")||objj_msgSend(path,"isEqualToString:","/");
}
}),new objj_method(sel_getUid("setTitle:"),function(_19,_1a,_1b){
with(_19){
objj_msgSend(_19,"willChangeValueForKey:","title");
title=_1b;
objj_msgSend(_19,"didChangeValueForKey:","title");
}
}),new objj_method(sel_getUid("setPath:"),function(_1c,_1d,_1e){
with(_1c){
objj_msgSend(_1c,"willChangeValueForKey:","path");
path=_1e;
objj_msgSend(_1c,"didChangeValueForKey:","path");
}
}),new objj_method(sel_getUid("setKey:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(_1f,"willChangeValueForKey:","key");
key=_21;
objj_msgSend(_1f,"didChangeValueForKey:","key");
}
}),new objj_method(sel_getUid("description"),function(_22,_23){
with(_22){
return path||objj_msgSendSuper({receiver:_22,super_class:objj_getClass("MMPath").super_class},"description");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("keyPathsForValuesAffectingTitle"),function(_24,_25){
with(_24){
return objj_msgSend(CPSet,"setWithObjects:","path","key","title");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingKey"),function(_26,_27){
with(_26){
return objj_msgSend(CPSet,"setWithObjects:","title","path");
}
})]);
p;41;DataSources/MMLibrarySectionsDataSource.jt;4359;@STATIC;1.0;i;28;../Models/MMLibrarySection.ji;18;../Models/PMSURL.ji;14;MMDataSource.jt;4265;
objj_executeFile("../Models/MMLibrarySection.j",YES);
objj_executeFile("../Models/PMSURL.j",YES);
objj_executeFile("MMDataSource.j",YES);
var _1=objj_allocateClassPair(MMDataSource,"MMLibrarySectionsDataSource"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("refreshSection:forceUpdate:withDeepScan:"),function(_3,_4,_5,_6,_7){
with(_3){
var _8=objj_msgSend(CPMutableDictionary,"dictionary");
if(_6){
objj_msgSend(_8,"setObject:forKey:",1,"force");
}
if(_7){
objj_msgSend(_8,"setObject:forKey:",1,"deep");
}
objj_msgSend(_3,"updateRecord:contextInfo:URL:HTTPBody:",_5,nil,objj_msgSend(PMSURL,"URLWithPath:params:",objj_msgSend(CPString,"stringWithFormat:","%@/refresh",objj_msgSend(objj_msgSend(_5,"URL"),"path")),_8),nil);
}
}),new objj_method(sel_getUid("stopRefresh:"),function(_9,_a,_b){
with(_9){
objj_msgSend(_9,"updateRecord:contextInfo:URL:HTTPMethod:HTTPBody:",_b,nil,objj_msgSend(PMSURL,"URLWithPath:",objj_msgSend(CPString,"stringWithFormat:","%@/refresh",objj_msgSend(objj_msgSend(_b,"URL"),"path"))),"DELETE",nil);
}
}),new objj_method(sel_getUid("URLForRecordsWithContextInfo:"),function(_c,_d,_e){
with(_c){
return objj_msgSend(PMSURL,"URLWithPath:","/library/sections");
}
}),new objj_method(sel_getUid("URLForRecord:contextInfo:"),function(_f,_10,_11,_12){
with(_f){
return objj_msgSend(_11,"URL");
}
}),new objj_method(sel_getUid("URLForNewRecord:contextInfo:"),function(_13,_14,_15,_16){
with(_13){
return objj_msgSend(PMSURL,"URLWithPath:params:","/library/sections",objj_msgSend(_13,"_paramsForRecord:",_15));
}
}),new objj_method(sel_getUid("URLForUpdatedRecord:contextInfo:"),function(_17,_18,_19,_1a){
with(_17){
return objj_msgSend(PMSURL,"URLWithPath:params:",objj_msgSend(objj_msgSend(_19,"URL"),"path"),objj_msgSend(_17,"_paramsForRecord:",_19));
}
}),new objj_method(sel_getUid("_paramsForRecord:"),function(_1b,_1c,_1d){
with(_1b){
return objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",objj_msgSend(_1d,"title")||objj_msgSend(CPNull,"null"),"name",objj_msgSend(_1d,"type")||objj_msgSend(CPNull,"null"),"type",objj_msgSend(_1d,"agent")||objj_msgSend(CPNull,"null"),"agent",objj_msgSend(_1d,"scanner")||objj_msgSend(CPNull,"null"),"scanner",objj_msgSend(_1d,"language")||objj_msgSend(CPNull,"null"),"language",objj_msgSend(_1d,"locations")||objj_msgSend(CPNull,"null"),"location");
}
}),new objj_method(sel_getUid("connection:didReceiveResponse:"),function(_1e,_1f,_20,_21){
with(_1e){
objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("MMLibrarySectionsDataSource").super_class},"connection:didReceiveResponse:",_20,_21);
var _22=objj_msgSend(recordsByCreateConnection,"objectForKey:",_20),_23=objj_msgSend(_20,"locationHeader");
if(_22&&_23){
objj_msgSend(_22,"setKey:",objj_msgSend(objj_msgSend(_22,"class"),"keyFromURL:",objj_msgSend(CPURL,"URLWithString:",_23)));
}
}
}),new objj_method(sel_getUid("HTTPBodyForNewRecord:contextInfo:"),function(_24,_25,_26,_27){
with(_24){
return nil;
}
}),new objj_method(sel_getUid("HTTPBodyForUpdatedRecord:contextInfo:"),function(_28,_29,_2a,_2b){
with(_28){
return nil;
}
}),new objj_method(sel_getUid("shouldProcessNode:contextInfo:"),function(_2c,_2d,_2e,_2f){
with(_2c){
return String(_2e.nodeName)=="Directory";
}
}),new objj_method(sel_getUid("recordFromElement:contextInfo:"),function(_30,_31,_32,_33){
with(_30){
var key=String(_32.getAttribute("key")),id=objj_msgSend(MMLibrarySection,"idFromKey:",key),_34=key;
if(!objj_msgSend(_34,"hasPrefix:","/")){
_34=objj_msgSend(CPString,"stringWithFormat:","%@/%@",objj_msgSend(objj_msgSend(_30,"URLForRecordsWithContextInfo:",_33),"path"),key);
}
var _35=objj_msgSend(objj_msgSend(_30,"dataStore"),"recordWithClass:id:",MMLibrarySection,_34);
objj_msgSend(_35,"setValuesForNodeAttributes:ignoreUndefinedKeys:",_32,YES);
objj_msgSend(_35,"setMediaFlagPrefix:",_32.parentNode.getAttribute("mediaTagPrefix"));
objj_msgSend(_35,"setMediaFlagVersion:",Number(_32.parentNode.getAttribute("mediaTagVersion")));
var _36=objj_msgSend(CPArray,"array"),_37=_32.childNodes;
for(var j=_37.length;j--;){
var _38=_37[j];
if(String(_38.nodeName)!="Location"){
continue;
}
objj_msgSend(_36,"addObject:",String(_38.getAttribute("path")));
}
objj_msgSend(_35,"setLocations:",_36);
return _35;
}
})]);
p;32;Controllers/MMSeasonController.jt;6660;@STATIC;1.0;i;26;../Models/MMMetadataItem.ji;29;../Views/MMSeasonDetailView.ji;24;../Views/MMEpisodeCell.ji;21;MMEpisodeController.jt;6521;
objj_executeFile("../Models/MMMetadataItem.j",YES);
objj_executeFile("../Views/MMSeasonDetailView.j",YES);
objj_executeFile("../Views/MMEpisodeCell.j",YES);
objj_executeFile("MMEpisodeController.j",YES);
var _1=objj_allocateClassPair(MMViewController,"MMSeasonController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("content"),new objj_ivar("metadataItemDataSource"),new objj_ivar("childrenController"),new objj_ivar("detailView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("content"),function(_3,_4){
with(_3){
return content;
}
}),new objj_method(sel_getUid("setContent:"),function(_5,_6,_7){
with(_5){
content=_7;
}
}),new objj_method(sel_getUid("init"),function(_8,_9){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("MMSeasonController").super_class},"init")){
metadataItemDataSource=objj_msgSend(objj_msgSend(MMLibraryMediaDataSource,"alloc"),"initWithDelegate:",_8);
childrenController=objj_msgSend(objj_msgSend(CPArrayController,"alloc"),"init");
}
return _8;
}
}),new objj_method(sel_getUid("loadView"),function(_a,_b){
with(_a){
_toolbarController=objj_msgSend(objj_msgSend(MMMetadataItemToolbarController,"alloc"),"init");
var _c=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,800,800)),_d=objj_msgSend(_toolbarController,"view"),_e=CGRectGetHeight(objj_msgSend(_d,"frame"));
objj_msgSend(_a,"ensureBackgroundFor:",_c);
detailView=objj_msgSend(objj_msgSend(MMSeasonDetailView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_d,"setFrame:",CGRectMake(0,CGRectGetHeight(objj_msgSend(_c,"frame"))-_e,CGRectGetWidth(objj_msgSend(_c,"frame")),_e));
objj_msgSend(detailView,"setFrame:",CGRectMake(0,0,CGRectGetWidth(objj_msgSend(_c,"frame")),CGRectGetMinY(objj_msgSend(_d,"frame"))));
objj_msgSend(detailView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_d,"setAutoresizingMask:",CPViewMinYMargin|CPViewWidthSizable);
objj_msgSend(detailView,"setDelegate:",_a);
objj_msgSend(detailView,"bind:toObject:withKeyPath:options:","title",_a,"fullTitle",nil);
objj_msgSend(detailView,"bind:toObject:withKeyPath:options:","subtitle",_a,"subtitle",nil);
objj_msgSend(detailView,"bind:toObject:withKeyPath:options:","thumbImage",_a,"content.thumbImage",nil);
objj_msgSend(_toolbarController,"bind:toObject:withKeyPath:options:","content",_a,"content",nil);
objj_msgSend(_toolbarController,"bind:toObject:withKeyPath:options:","parentViewController",_a,"parentViewController",nil);
objj_msgSend(_c,"addSubview:",detailView);
objj_msgSend(_c,"addSubview:",_d);
childrenController=objj_msgSend(objj_msgSend(CPArrayController,"alloc"),"init");
objj_msgSend(_a,"setView:",_c);
}
}),new objj_method(sel_getUid("title"),function(_f,_10){
with(_f){
return objj_msgSend(content,"displayTitle");
}
}),new objj_method(sel_getUid("parentTitle"),function(_11,_12){
with(_11){
return objj_msgSend(objj_msgSend(content,"parent"),"displayTitle")||objj_msgSend(content,"parentTitle");
}
}),new objj_method(sel_getUid("fullTitle"),function(_13,_14){
with(_13){
return objj_msgSend(CPString,"stringWithFormat:","%@: %@",objj_msgSend(_13,"parentTitle"),objj_msgSend(_13,"title"));
}
}),new objj_method(sel_getUid("setContent:"),function(_15,_16,_17){
with(_15){
if(objj_msgSend(content,"isEqual:",_17)){
return;
}
content=_17;
objj_msgSend(childrenController,"setContent:",[]);
switch(objj_msgSend(content,"type")){
case PMCObjectTypeSeason:
objj_msgSend(_15,"view");
var _18=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init"),_19=objj_msgSend(objj_msgSend(MMEpisodeCell,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(objj_msgSend(detailView,"frame")),200));
objj_msgSend(_18,"setView:",_19);
objj_msgSend(detailView,"setChildItemPrototype:",_18);
objj_msgSend(detailView,"setChildrenController:",childrenController);
objj_msgSend(metadataItemDataSource,"refreshRecordsWithContextInfo:",content);
break;
default:
objj_msgSend(detailView,"setChildrenController:",nil);
break;
}
}
}),new objj_method(sel_getUid("dataSource:didReceiveRecords:contextInfo:"),function(_1a,_1b,_1c,_1d,_1e){
with(_1a){
if(!objj_msgSend(_1e,"isEqual:",content)){
return;
}
objj_msgSend(_1a,"willChangeValueForKey:","status");
objj_msgSend(childrenController,"setContent:",_1d);
objj_msgSend(_1a,"didChangeValueForKey:","status");
objj_msgSend(_1a,"restoreChildState");
}
}),new objj_method(sel_getUid("status"),function(_1f,_20){
with(_1f){
var _21=objj_msgSend(objj_msgSend(childrenController,"content"),"count");
if(_21===nil){
return nil;
}
switch(_21){
case 0:
return CPLocalizedString("no episodes","Status for list of episodes when there are none");
case 1:
return CPLocalizedString("1 episode","Status for list of episodes when there is one");
default:
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("%d episodes","Status for list of episodes when there is more than one"),_21);
}
return nil;
}
}),new objj_method(sel_getUid("subtitle"),function(_22,_23){
with(_22){
return objj_msgSend(_22,"status");
}
}),new objj_method(sel_getUid("itemStatus"),function(_24,_25){
with(_24){
var _26=objj_msgSend(objj_msgSend(_24,"content"),"updatedAt");
if(!_26){
return nil;
}
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Last refreshed %@ at %@","Status label for media items"),objj_msgSend(_26,"relativeDate"),objj_msgSend(_26,"shortLocalTime"));
}
}),new objj_method(sel_getUid("children"),function(_27,_28){
with(_27){
return objj_msgSend(childrenController,"content");
}
}),new objj_method(sel_getUid("metadataItemDetailView:didSelectChild:"),function(_29,_2a,_2b,_2c){
with(_29){
objj_msgSend(objj_msgSend(LPLocationController,"sharedLocationController"),"setLocationForObjects:",objj_msgSend(_29,"location"),_2c);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("keyPathsForValuesAffectingTitle"),function(_2d,_2e){
with(_2d){
return objj_msgSend(CPSet,"setWithObjects:","content","content.displayTitle");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingFullTitle"),function(_2f,_30){
with(_2f){
return objj_msgSend(CPSet,"setWithObjects:","title","content.parent","content.parent.displayTitle","parentTitle");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingItemStatus"),function(_31,_32){
with(_31){
return objj_msgSend(CPSet,"setWithObjects:","content","content.updatedAt");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingSubtitle"),function(_33,_34){
with(_33){
return objj_msgSend(CPSet,"setWithObjects:","status");
}
})]);
p;26;Views/MMSeasonDetailView.jt;6278;@STATIC;1.0;I;15;AppKit/CPView.jt;6239;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"MMSeasonDetailView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_title"),new objj_ivar("_subtitle"),new objj_ivar("_thumbImage"),new objj_ivar("_childrenCollectionView"),new objj_ivar("_delegate")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("title"),function(_3,_4){
with(_3){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_5,_6,_7){
with(_5){
_title=_7;
}
}),new objj_method(sel_getUid("subtitle"),function(_8,_9){
with(_8){
return _subtitle;
}
}),new objj_method(sel_getUid("setSubtitle:"),function(_a,_b,_c){
with(_a){
_subtitle=_c;
}
}),new objj_method(sel_getUid("thumbImage"),function(_d,_e){
with(_d){
return _thumbImage;
}
}),new objj_method(sel_getUid("setThumbImage:"),function(_f,_10,_11){
with(_f){
_thumbImage=_11;
}
}),new objj_method(sel_getUid("delegate"),function(_12,_13){
with(_12){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_14,_15,_16){
with(_14){
_delegate=_16;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_17,_18,_19){
with(_17){
if(_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("MMSeasonDetailView").super_class},"initWithFrame:",_19)){
var _1a=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_19);
objj_msgSend(_1a,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_1a,"setAlphaValue:",0.4);
objj_msgSend(_1a,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_17,"addSubview:",_1a);
var _1b=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_19),90));
objj_msgSend(_1b,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","seasonHeaderBackground.png"))));
objj_msgSend(_1b,"setAlphaValue:",0.9);
objj_msgSend(_1b,"setAutoresizingMask:",CPViewWidthSizable);
_thumbView=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(17,12,50,70));
objj_msgSend(_thumbView,"setShadowBlurDistance:",8);
objj_msgSend(_thumbView,"setHasShadow:",YES);
objj_msgSend(_thumbView,"setBorderRadius:",2);
objj_msgSend(_thumbView,"setSizeConstraint:",objj_msgSend(_thumbView,"frame").size);
objj_msgSend(_thumbView,"bind:toObject:withKeyPath:options:",CPValueBinding,_17,"thumbImage",nil);
objj_msgSend(_1b,"addSubview:",_thumbView);
_titleLabel=objj_msgSend(CPTextField,"labelWithTitle:","Season 1");
objj_msgSend(_titleLabel,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",28));
objj_msgSend(_titleLabel,"sizeToFit");
objj_msgSend(_titleLabel,"setFrameOrigin:",CGPointMake(80,18));
objj_msgSend(_titleLabel,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_1b,"frame"))-CGRectGetMinX(objj_msgSend(_titleLabel,"frame"))-20,CGRectGetHeight(objj_msgSend(_titleLabel,"frame"))));
objj_msgSend(_titleLabel,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_titleLabel,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleLabel,"bind:toObject:withKeyPath:options:",CPValueBinding,_17,"title",nil);
objj_msgSend(_1b,"addSubview:",_titleLabel);
_subtitleLabel=objj_msgSend(CPTextField,"labelWithTitle:","10 episodes");
objj_msgSend(_subtitleLabel,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",14));
objj_msgSend(_subtitleLabel,"sizeToFit");
objj_msgSend(_subtitleLabel,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_titleLabel,"frame")),CGRectGetMaxY(objj_msgSend(_titleLabel,"frame"))));
objj_msgSend(_subtitleLabel,"bind:toObject:withKeyPath:options:",CPValueBinding,_17,"subtitle",nil);
objj_msgSend(_1b,"addSubview:",_subtitleLabel);
objj_msgSend(_17,"addSubview:",_1b);
var _1c=objj_msgSend(objj_msgSend(MMScrollView,"alloc"),"initWithFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(_1b,"frame")),CGRectGetWidth(objj_msgSend(_1b,"frame")),CGRectGetHeight(_19)-CGRectGetMaxY(objj_msgSend(_1b,"frame"))));
objj_msgSend(objj_msgSend(_1c,"contentView"),"setBackgroundColor:",nil);
objj_msgSend(_1c,"setHasHorizontalScroller:",NO);
objj_msgSend(_1c,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
_childrenCollectionView=objj_msgSend(objj_msgSend(MMCollectionView,"alloc"),"initWithFrame:",objj_msgSend(objj_msgSend(_1c,"contentView"),"bounds"));
objj_msgSend(_childrenCollectionView,"setMaxNumberOfColumns:",1);
objj_msgSend(_childrenCollectionView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_childrenCollectionView,"setDelegate:",_17);
objj_msgSend(_1c,"setDocumentView:",_childrenCollectionView);
objj_msgSend(_17,"addSubview:",_1c);
}
return _17;
}
}),new objj_method(sel_getUid("setTitle:"),function(_1d,_1e,_1f){
with(_1d){
_title=_1f;
objj_msgSend(_1d,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setSubtitle:"),function(_20,_21,_22){
with(_20){
_subtitle=_22;
objj_msgSend(_20,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setChildItemPrototype:"),function(_23,_24,_25){
with(_23){
objj_msgSend(_childrenCollectionView,"setItemPrototype:",_25);
if(_25){
var _26=CGRectGetHeight(objj_msgSend(objj_msgSend(_25,"view"),"frame"));
objj_msgSend(_childrenCollectionView,"setMinItemSize:",CGSizeMake(500,_26));
objj_msgSend(_childrenCollectionView,"setMaxItemSize:",CGSizeMake(100000,_26));
}
}
}),new objj_method(sel_getUid("setChildrenController:"),function(_27,_28,_29){
with(_27){
if(_29){
objj_msgSend(_childrenCollectionView,"bind:toObject:withKeyPath:options:","content",_29,"arrangedObjects",nil);
}else{
objj_msgSend(_childrenCollectionView,"unbind:","content");
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_2a,_2b){
with(_2a){
objj_msgSendSuper({receiver:_2a,super_class:objj_getClass("MMSeasonDetailView").super_class},"layoutSubviews");
objj_msgSend(_subtitleLabel,"sizeToFit");
}
}),new objj_method(sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"),function(_2c,_2d,_2e,_2f){
with(_2c){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("metadataItemDetailView:didSelectChild:"))){
objj_msgSend(_delegate,"metadataItemDetailView:didSelectChild:",_2c,objj_msgSend(objj_msgSend(_2e,"content"),"objectAtIndex:",_2f));
}
}
})]);
p;21;Views/MMEpisodeCell.jt;5547;@STATIC;1.0;i;12;MMLazyView.ji;18;MMFlagCollection.jt;5488;
objj_executeFile("MMLazyView.j",YES);
objj_executeFile("MMFlagCollection.j",YES);
var _1=CGSizeMake(280,160);
var _2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","AlertCautionIcon.png"));
var _3=objj_allocateClassPair(MMLazyView,"MMEpisodeCell"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_representedObject"),new objj_ivar("_thumbView"),new objj_ivar("_titleLabel"),new objj_ivar("_summaryLabel"),new objj_ivar("trashedFlagView"),new objj_ivar("videoCodecFlag"),new objj_ivar("flags")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("representedObject"),function(_5,_6){
with(_5){
return _representedObject;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_7,_8,_9){
with(_7){
_representedObject=_9;
}
}),new objj_method(sel_getUid("thumbView"),function(_a,_b){
with(_a){
return _thumbView;
}
}),new objj_method(sel_getUid("setThumbView:"),function(_c,_d,_e){
with(_c){
_thumbView=_e;
}
}),new objj_method(sel_getUid("loadView"),function(_f,_10){
with(_f){
if(_thumbView==nil){
_thumbView=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(18,18,_1.width,_1.height));
}
objj_msgSend(_thumbView,"setHasShadow:",YES);
objj_msgSend(_thumbView,"setShadowBlurDistance:",4);
objj_msgSend(_thumbView,"setBorderRadius:",4);
objj_msgSend(_thumbView,"setSizeConstraint:",_1);
objj_msgSend(_thumbView,"bind:toObject:withKeyPath:options:",CPValueBinding,_f,"representedObject.thumbImage",nil);
objj_msgSend(_f,"addSubview:",_thumbView);
_titleLabel=objj_msgSend(CPTextField,"labelWithTitle:","Episode 10");
objj_msgSend(_titleLabel,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",18));
objj_msgSend(_titleLabel,"sizeToFit");
objj_msgSend(_titleLabel,"setFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(_thumbView,"frame"))+10,20,CGRectGetWidth(objj_msgSend(_f,"frame"))-CGRectGetMaxX(objj_msgSend(_thumbView,"frame"))-10,CGRectGetHeight(objj_msgSend(_titleLabel,"frame"))));
objj_msgSend(_titleLabel,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_titleLabel,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_titleLabel,"bind:toObject:withKeyPath:options:",CPValueBinding,_f,"fullTitle",nil);
objj_msgSend(_f,"addSubview:",_titleLabel);
_summaryLabel=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(_summaryLabel,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_titleLabel,"frame")),CGRectGetMaxY(objj_msgSend(_titleLabel,"frame")),CGRectGetWidth(objj_msgSend(_titleLabel,"frame"))-20,CGRectGetHeight(objj_msgSend(_f,"frame"))-CGRectGetMaxY(objj_msgSend(_titleLabel,"frame"))-10));
objj_msgSend(_summaryLabel,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_summaryLabel,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_summaryLabel,"bind:toObject:withKeyPath:options:",CPValueBinding,_f,"representedObject.summary",nil);
objj_msgSend(_f,"addSubview:",_summaryLabel);
var _11=objj_msgSend(objj_msgSend(CPBox,"alloc"),"initWithFrame:",CGRectMake(0,CGRectGetHeight(objj_msgSend(_f,"frame"))-1,CGRectGetWidth(objj_msgSend(_f,"frame")),1));
objj_msgSend(_11,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",80/255,1));
objj_msgSend(_11,"setAlphaValue:",0.4);
objj_msgSend(_f,"addSubview:",_11);
flags=objj_msgSend(objj_msgSend(MMFlagCollection,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_summaryLabel,"frame")),CGRectGetMaxY(objj_msgSend(_thumbView,"frame"))-22,CGRectGetWidth(objj_msgSend(_summaryLabel,"frame")),22));
objj_msgSend(flags,"setAlignment:",CPRightTextAlignment);
objj_msgSend(flags,"setAutoresizingMask:",CPViewWidthSizable|CPViewMinYMargin);
objj_msgSend(_f,"addSubview:",flags);
objj_msgSend(_f,"refreshFlags");
if(!trashedFlagView){
var _12=28,_13=28;
trashedFlagView=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_thumbView,"frame"))-_12/2,CGRectGetMaxY(objj_msgSend(_thumbView,"frame"))-_13,_12,_13));
objj_msgSend(trashedFlagView,"setImage:",_2);
objj_msgSend(trashedFlagView,"bind:toObject:withKeyPath:options:","hidden",_f,"representedObject.deletedAt",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPIsNilTransformerName,CPValueTransformerNameBindingOption));
objj_msgSend(_f,"addSubview:",trashedFlagView);
}
}
}),new objj_method(sel_getUid("fullTitle"),function(_14,_15){
with(_14){
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Episode %d: %@","Full episode title (e.g. Episode 1: Pilot"),objj_msgSend(_representedObject,"index"),objj_msgSend(_representedObject,"displayTitle"));
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_16,_17,_18){
with(_16){
_representedObject=_18;
objj_msgSend(_16,"refreshFlags");
}
}),new objj_method(sel_getUid("refreshFlags"),function(_19,_1a){
with(_19){
if(!_representedObject){
return;
}
objj_msgSend(flags,"removeAllFlags");
objj_msgSend(flags,"addFlagWithName:forObject:","videoResolution",_representedObject);
objj_msgSend(flags,"addFlagWithName:forObject:","videoCodec",_representedObject);
objj_msgSend(flags,"addFlagWithName:forObject:","audioCodec",_representedObject);
objj_msgSend(flags,"addFlagWithName:forObject:","audioChannels",_representedObject);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("keyPathsForValuesAffectingFullTitle"),function(_1b,_1c){
with(_1b){
return objj_msgSend(CPSet,"setWithObject:","representedObject");
}
})]);
p;24;Views/MMFlagCollection.jt;4670;@STATIC;1.0;I;15;AppKit/CPView.jt;4631;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"MMFlagCollection"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("imageViews"),new objj_ivar("spacing"),new objj_ivar("alignment")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("spacing"),function(_3,_4){
with(_3){
return spacing;
}
}),new objj_method(sel_getUid("setSpacing:"),function(_5,_6,_7){
with(_5){
spacing=_7;
}
}),new objj_method(sel_getUid("alignment"),function(_8,_9){
with(_8){
return alignment;
}
}),new objj_method(sel_getUid("setAlignment:"),function(_a,_b,_c){
with(_a){
alignment=_c;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
if(_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("MMFlagCollection").super_class},"initWithFrame:",_f)){
imageViews=objj_msgSend(CPMutableArray,"array");
spacing=10;
alignment=CPLeftTextAlignment;
}
return _d;
}
}),new objj_method(sel_getUid("addFlagWithName:forObject:"),function(_10,_11,_12,_13){
with(_10){
objj_msgSend(_10,"addFlagWithURL:",objj_msgSend(_13,"valueForKey:",objj_msgSend(_12,"stringByAppendingString:","FlagURL")));
}
}),new objj_method(sel_getUid("addFlagWithURL:"),function(_14,_15,_16){
with(_14){
objj_msgSend(_14,"addFlagWithImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",_16,CPImageUnspecifiedSize));
}
}),new objj_method(sel_getUid("addFlagWithImage:"),function(_17,_18,_19){
with(_17){
if(!_19){
return;
}
if(objj_msgSend(_19,"loadStatus")===CPImageLoadStatusCompleted){
objj_msgSend(_17,"setNeedsLayout");
}else{
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_17,sel_getUid("flagImageDidLoad:"),CPImageDidLoadNotification,_19);
}
var _1a=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_1a,"setImageScaling:",CPScaleProportionally);
objj_msgSend(_1a,"setImage:",_19);
objj_msgSend(_1a,"setInverted:",YES);
objj_msgSend(imageViews,"addObject:",_1a);
objj_msgSend(_17,"addSubview:",_1a);
}
}),new objj_method(sel_getUid("setSpacing:"),function(_1b,_1c,_1d){
with(_1b){
spacing=_1d;
objj_msgSend(_1b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setAlignment:"),function(_1e,_1f,_20){
with(_1e){
if(_20!==CPLeftTextAlignment&&_20!==CPRightTextAlignment&&_20!==CPCenterTextAlignment){
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"alignment must be one of CPLeftTextAlignment, CPRightTextAlignment, or CPCenterTextAlignment");
}
alignment=_20;
objj_msgSend(_1e,"setNeedsLayout");
}
}),new objj_method(sel_getUid("removeAllFlags"),function(_21,_22){
with(_21){
for(var i=0,_23=objj_msgSend(imageViews,"count");i<_23;i++){
var _24=objj_msgSend(imageViews,"objectAtIndex:",i);
objj_msgSend(_24,"removeFromSuperview");
if(objj_msgSend(_24,"image")){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_21,CPImageDidLoadNotification,objj_msgSend(_24,"image"));
objj_msgSend(_24,"setImage:",nil);
}
}
objj_msgSend(imageViews,"removeAllObjects");
}
}),new objj_method(sel_getUid("flagImageDidLoad:"),function(_25,_26,_27){
with(_25){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_25,CPImageDidLoadNotification,objj_msgSend(_27,"object"));
objj_msgSend(_25,"setNeedsLayout");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_28,_29){
with(_28){
var _2a=CGRectGetWidth(objj_msgSend(_28,"frame")),_2b=CGRectGetHeight(objj_msgSend(_28,"frame")),_2c=_2a,_2d,_2e,_2f;
_2d=(alignment===CPRightTextAlignment)?objj_msgSend(imageViews,"reverseObjectEnumerator"):objj_msgSend(imageViews,"objectEnumerator");
while(_2e=objj_msgSend(_2d,"nextObject")){
_2f=objj_msgSend(_2e,"image");
var x,y=0,_30=_2b,_31=objj_msgSend(_2f,"size").width/objj_msgSend(_2f,"size").height*_2b;
if((objj_msgSend(_2f,"loadStatus")===CPImageLoadStatusCompleted)&&(_31<=_2c)){
objj_msgSend(_2e,"setHidden:",NO);
switch(alignment){
case CPLeftTextAlignment:
case CPCenterTextAlignment:
x=_2a-_2c;
break;
case CPRightTextAlignment:
x=_2c-_31;
break;
}
objj_msgSend(_2e,"setFrame:",CGRectMake(x,y,_31,_30));
_2c-=_31+spacing;
}else{
objj_msgSend(_2e,"setHidden:",YES);
}
}
if(alignment===CPCenterTextAlignment){
_2c+=spacing;
_2d=objj_msgSend(imageViews,"objectEnumerator");
while(_2e=objj_msgSend(_2d,"nextObject")){
objj_msgSend(_2e,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_2e,"frame"))+_2c/2,CGRectGetMinY(objj_msgSend(_2e,"frame"))));
}
}
objj_msgSendSuper({receiver:_28,super_class:objj_getClass("MMFlagCollection").super_class},"layoutSubviews");
}
})]);
p;21;CPImage+Transcoding.jt;2824;@STATIC;1.0;I;16;AppKit/CPImage.ji;15;Models/PMSURL.jt;2764;
objj_executeFile("AppKit/CPImage.j",NO);
objj_executeFile("Models/PMSURL.j",YES);
var _1=100000;
var _2="/photo/:/transcode";
CPImageUnspecifiedSize=CGSizeMake(-1,-1);
var _3=objj_getClass("CPImage");
if(!_3){
throw new SyntaxError("*** Could not find definition for class \"CPImage\"");
}
var _4=_3.isa;
class_addMethods(_3,[new objj_method(sel_getUid("constrainedToSize:"),function(_5,_6,_7){
with(_5){
var _8=objj_msgSend(_5,"filename"),_9=objj_msgSend(objj_msgSend(_5,"class"),"URLForImageAtURL:constrainedToSize:",_8,_7);
if(!objj_msgSend(_8,"isKindOfClass:",CPURL)){
_8=objj_msgSend(PMSURL,"URLWithPath:",_8);
}
if(objj_msgSend(objj_msgSend(_9,"path"),"isEqualToString:",objj_msgSend(_8,"path"))){
var _a=objj_msgSend(CPDictionary,"dictionaryFromURLParams:",objj_msgSend(_8,"parameterString")),_b=objj_msgSend(CPDictionary,"dictionaryFromURLParams:",objj_msgSend(_9,"parameterString"));
if(objj_msgSend(_a,"isEqual:",_b)){
return _5;
}
}
return objj_msgSend(objj_msgSend(objj_msgSend(_5,"class"),"alloc"),"initByReferencingFile:size:",_9,CPImageUnspecifiedSize);
}
}),new objj_method(sel_getUid("constrainedToWidth:"),function(_c,_d,_e){
with(_c){
return objj_msgSend(_c,"constrainedToSize:",CGSizeMake(_e,_1));
}
}),new objj_method(sel_getUid("constrainedToHeight:"),function(_f,_10,_11){
with(_f){
return objj_msgSend(_f,"constrainedToSize:",CGSizeMake(_1,_11));
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("URLForImageAtURL:constrainedToSize:"),function(_12,_13,_14,_15){
with(_12){
if(!_15||CGSizeEqualToSize(_15,CPImageUnspecifiedSize)){
return _14;
}
var _16=objj_msgSend(CPDictionary,"dictionary");
if(!objj_msgSend(_14,"isKindOfClass:",CPURL)){
_14=objj_msgSend(CPURL,"URLWithString:",_14);
}
if(objj_msgSend(objj_msgSend(_14,"path"),"hasPrefix:",_2)){
_16=objj_msgSend(CPDictionary,"dictionaryFromURLParams:",objj_msgSend(_14,"parameterString"));
_14=objj_msgSend(CPURL,"URLWithString:",objj_msgSend(_16,"objectForKey:","url"));
}
if(!objj_msgSend(_14,"host")){
_14=objj_msgSend(PMSURL,"URLWithPath:",objj_msgSend(_14,"absoluteString"));
}
if(objj_msgSend(PMSURL,"isPMSURL:",_14)){
var _17=objj_msgSend(CPMutableArray,"array");
objj_msgSend(_17,"addObject:",objj_msgSend(_14,"scheme"));
objj_msgSend(_17,"addObject:","://127.0.0.1:32400");
objj_msgSend(_17,"addObject:",objj_msgSend(_14,"path"));
if(objj_msgSend(_14,"parameterString")){
objj_msgSend(_17,"addObject:","?"+objj_msgSend(_14,"parameterString"));
}
_14=objj_msgSend(CPURL,"URLWithString:",objj_msgSend(_17,"componentsJoinedByString:",""));
}
objj_msgSend(_16,"setObject:forKey:",_14,"url");
objj_msgSend(_16,"setObject:forKey:",_15.width,"width");
objj_msgSend(_16,"setObject:forKey:",_15.height,"height");
return objj_msgSend(PMSURL,"URLWithPath:params:",_2,_16);
}
})]);
p;33;Controllers/MMEpisodeController.jt;2056;@STATIC;1.0;i;26;MMMetadataItemController.jt;2006;
objj_executeFile("MMMetadataItemController.j",YES);
var _1=objj_allocateClassPair(MMMetadataItemController,"MMEpisodeController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("loadView"),function(_3,_4){
with(_3){
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMEpisodeController").super_class},"loadView");
objj_msgSend(_detailView,"bind:toObject:withKeyPath:options:","title",_3,"titleWithShow",nil);
}
}),new objj_method(sel_getUid("title"),function(_5,_6){
with(_5){
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Episode %d: %@","Full episode title (e.g. Episode 1: Pilot"),objj_msgSend(objj_msgSend(_5,"content"),"index"),objj_msgSend(objj_msgSend(_5,"content"),"displayTitle"));
}
}),new objj_method(sel_getUid("subtitle"),function(_7,_8){
with(_7){
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("%@, Episode %d","Season plus full episode title (e.g. Season 4, Episode 1"),objj_msgSend(objj_msgSend(objj_msgSend(_7,"content"),"parent"),"displayTitle"),objj_msgSend(objj_msgSend(_7,"content"),"index"));
}
}),new objj_method(sel_getUid("titleWithShow"),function(_9,_a){
with(_9){
return objj_msgSend(CPString,"stringWithFormat:","%@: %@",objj_msgSend(objj_msgSend(objj_msgSend(_9,"content"),"root"),"displayTitle"),objj_msgSend(objj_msgSend(_9,"content"),"displayTitle"));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("keyPathsForValuesAffectingTitle"),function(_b,_c){
with(_b){
return objj_msgSend(CPSet,"setWithObjects:","content","content.index","content.displayTitle");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingSubtitle"),function(_d,_e){
with(_d){
return objj_msgSend(CPSet,"setWithObjects:","content","content.parent.displayTitle","content.index");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingTitleWithShow"),function(_f,_10){
with(_f){
return objj_msgSend(CPSet,"setWithObjects:","content","content.displayTitle","content.root.displayTitle");
}
})]);
p;38;Controllers/MMMetadataItemController.jt;9863;@STATIC;1.0;i;18;MMViewController.ji;25;MMImagePickerController.ji;25;MMMatchPickerController.ji;28;MMMetadataEditorController.ji;33;MMMetadataItemToolbarController.ji;26;../Models/MMMetadataItem.ji;35;../Views/MMMetadataItemDetailView.ji;22;../Views/MMAlbumCell.ji;23;../Views/MMSeasonCell.jt;9564;
objj_executeFile("MMViewController.j",YES);
objj_executeFile("MMImagePickerController.j",YES);
objj_executeFile("MMMatchPickerController.j",YES);
objj_executeFile("MMMetadataEditorController.j",YES);
objj_executeFile("MMMetadataItemToolbarController.j",YES);
objj_executeFile("../Models/MMMetadataItem.j",YES);
objj_executeFile("../Views/MMMetadataItemDetailView.j",YES);
objj_executeFile("../Views/MMAlbumCell.j",YES);
objj_executeFile("../Views/MMSeasonCell.j",YES);
var _1=objj_allocateClassPair(MMViewController,"MMMetadataItemController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_detailView"),new objj_ivar("_content"),new objj_ivar("_childrenController"),new objj_ivar("_metadataItemDataSource"),new objj_ivar("_editor"),new objj_ivar("_wantedChildMetadataItemPath"),new objj_ivar("_toolbarController")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("content"),function(_3,_4){
with(_3){
return _content;
}
}),new objj_method(sel_getUid("setContent:"),function(_5,_6,_7){
with(_5){
_content=_7;
}
}),new objj_method(sel_getUid("init"),function(_8,_9){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("MMMetadataItemController").super_class},"init")){
_metadataItemDataSource=objj_msgSend(objj_msgSend(MMLibraryMediaDataSource,"alloc"),"initWithDelegate:",_8);
_childrenController=objj_msgSend(objj_msgSend(CPArrayController,"alloc"),"init");
}
return _8;
}
}),new objj_method(sel_getUid("title"),function(_a,_b){
with(_a){
return objj_msgSend(objj_msgSend(_a,"content"),"displayTitle");
}
}),new objj_method(sel_getUid("children"),function(_c,_d){
with(_c){
return objj_msgSend(_childrenController,"content");
}
}),new objj_method(sel_getUid("willBeOrderedBackByContentController:"),function(_e,_f,_10){
with(_e){
objj_msgSend(_detailView,"setContentHidden:",YES);
}
}),new objj_method(sel_getUid("willBeOrderedFrontByContentController:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_detailView,"setContentHidden:",NO);
}
}),new objj_method(sel_getUid("loadView"),function(_14,_15){
with(_14){
_toolbarController=objj_msgSend(objj_msgSend(MMMetadataItemToolbarController,"alloc"),"init");
var _16=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,800,800)),_17=objj_msgSend(_toolbarController,"view"),_18=CGRectGetHeight(objj_msgSend(_17,"frame")),_19=objj_msgSend(objj_msgSend(MMMetadataItemDetailView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_17,"setFrame:",CGRectMake(0,CGRectGetHeight(objj_msgSend(_16,"frame"))-_18,CGRectGetWidth(objj_msgSend(_16,"frame")),_18));
objj_msgSend(_19,"setFrame:",CGRectMake(0,0,CGRectGetWidth(objj_msgSend(_16,"frame")),CGRectGetMinY(objj_msgSend(_17,"frame"))));
objj_msgSend(_19,"setDelegate:",_14);
objj_msgSend(_17,"setAutoresizingMask:",CPViewMinYMargin|CPViewWidthSizable);
objj_msgSend(_19,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_16,"addSubview:",_19);
objj_msgSend(_16,"addSubview:",_17);
objj_msgSend(_19,"bind:toObject:withKeyPath:options:","title",_14,"title",nil);
objj_msgSend(_19,"bind:toObject:withKeyPath:options:","tagline",_14,"subtitle",nil);
objj_msgSend(_19,"bind:toObject:withKeyPath:options:","year",_14,"content.year",nil);
objj_msgSend(_19,"bind:toObject:withKeyPath:options:","summary",_14,"content.summary",nil);
objj_msgSend(_19,"bind:toObject:withKeyPath:options:","rating",_14,"content.rating",nil);
objj_msgSend(_19,"bind:toObject:withKeyPath:options:","genre",_14,"genre",nil);
objj_msgSend(_19,"bind:toObject:withKeyPath:options:","thumbImage",_14,"content.thumbImage",nil);
objj_msgSend(_19,"bind:toObject:withKeyPath:options:","artImage",_14,"artImage",nil);
objj_msgSend(_19,"bind:toObject:withKeyPath:options:","contentRatingFlagImage",_14,"contentRatingFlagImage",nil);
objj_msgSend(_19,"bind:toObject:withKeyPath:options:","studioFlagImage",_14,"studioFlagImage",nil);
objj_msgSend(_toolbarController,"bind:toObject:withKeyPath:options:","content",_14,"content",nil);
objj_msgSend(_toolbarController,"bind:toObject:withKeyPath:options:","parentViewController",_14,"parentViewController",nil);
_detailView=_19;
objj_msgSend(_14,"setView:",_16);
}
}),new objj_method(sel_getUid("itemStatus"),function(_1a,_1b){
with(_1a){
var _1c=objj_msgSend(objj_msgSend(_1a,"content"),"updatedAt");
if(!_1c){
return nil;
}
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Last refreshed %@ at %@","Status label for media items"),objj_msgSend(_1c,"relativeDate"),objj_msgSend(_1c,"shortLocalTime"));
}
}),new objj_method(sel_getUid("subtitle"),function(_1d,_1e){
with(_1d){
return objj_msgSend(objj_msgSend(_1d,"content"),"tagline");
}
}),new objj_method(sel_getUid("genre"),function(_1f,_20){
with(_1f){
return objj_msgSend(objj_msgSend(objj_msgSend(_1f,"content"),"genres"),"count")&&objj_msgSend(objj_msgSend(objj_msgSend(_1f,"content"),"genres"),"objectAtIndex:",0)||"";
}
}),new objj_method(sel_getUid("artImage"),function(_21,_22){
with(_21){
var _23=_21;
while(objj_msgSend(_23,"respondsToSelector:",sel_getUid("content"))&&objj_msgSend(objj_msgSend(_23,"content"),"respondsToSelector:",sel_getUid("artImage"))){
if(objj_msgSend(objj_msgSend(_23,"content"),"artImage")){
return objj_msgSend(objj_msgSend(_23,"content"),"artImage");
}
_23=objj_msgSend(_23,"previousViewController");
}
return nil;
}
}),new objj_method(sel_getUid("contentRatingFlagImage"),function(_24,_25){
with(_24){
var url=objj_msgSend(objj_msgSend(_24,"content"),"contentRatingFlagURL");
return url&&objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",url,CGSizeMake(-1,-1));
}
}),new objj_method(sel_getUid("studioFlagImage"),function(_26,_27){
with(_26){
var url=objj_msgSend(objj_msgSend(_26,"content"),"studioFlagURL");
return url&&objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",url,CGSizeMake(-1,-1));
}
}),new objj_method(sel_getUid("setContent:"),function(_28,_29,_2a){
with(_28){
if(objj_msgSend(_content,"isEqual:",_2a)){
return;
}
_content=_2a;
if(objj_msgSend(_28,"content")){
objj_msgSend(objj_msgSend(MMMetadataItemDataSource,"sharedDataSource"),"refreshRecord:",objj_msgSend(_28,"content"));
}
objj_msgSend(_childrenController,"setContent:",[]);
var _2b=nil;
switch(objj_msgSend(objj_msgSend(_28,"content"),"type")){
case PMCObjectTypeShow:
_2b=objj_msgSend(objj_msgSend(MMSeasonCell,"alloc"),"initWithFrame:",CGRectMake(0,0,155,198));
break;
case PMCObjectTypeArtist:
_2b=objj_msgSend(objj_msgSend(MMAlbumCell,"alloc"),"initWithFrame:",CGRectMake(0,0,155,198));
break;
default:
objj_msgSend(_detailView,"setChildItemPrototype:",nil);
objj_msgSend(_detailView,"setChildrenController:",nil);
break;
}
if(_2b){
objj_msgSend(_28,"view");
var _2c=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init");
objj_msgSend(_2c,"setView:",_2b);
objj_msgSend(_detailView,"setChildItemPrototype:",_2c);
objj_msgSend(_detailView,"setChildrenController:",_childrenController);
objj_msgSend(_metadataItemDataSource,"refreshRecordsWithContextInfo:",objj_msgSend(_28,"content"));
}
}
}),new objj_method(sel_getUid("wasPushedOntoContentController:"),function(_2d,_2e,_2f){
with(_2d){
var _30=objj_msgSend(_2d,"location"),_31=objj_msgSend(objj_msgSend(LPLocationController,"sharedLocationController"),"formattedHash");
if(objj_msgSend(_31,"isEqualToString:",_30)){
return;
}
if(!objj_msgSend(_31,"hasPrefix:",_30)){
return;
}
var _32=objj_msgSend(_31,"substringFromIndex:",objj_msgSend(_30,"length")+1),_33=objj_msgSend(_32,"componentsSeparatedByString:",";");
_wantedChildMetadataItemPath=objj_msgSend(_33,"objectAtIndex:",0);
objj_msgSend(_2d,"restoreChildState");
}
}),new objj_method(sel_getUid("dataSource:didReceiveRecords:contextInfo:"),function(_34,_35,_36,_37,_38){
with(_34){
if((_36==_metadataItemDataSource)&&(_38==objj_msgSend(_34,"content"))){
objj_msgSend(_childrenController,"setContent:",_37);
objj_msgSend(_34,"restoreChildState");
}
}
}),new objj_method(sel_getUid("matchPickerDidCancel:"),function(_39,_3a,_3b){
with(_39){
objj_msgSend(_matchPicker,"dismissSheet"),_matchPicker=nil;
}
}),new objj_method(sel_getUid("metadataItemDetailView:didSelectChild:"),function(_3c,_3d,_3e,_3f){
with(_3c){
objj_msgSend(objj_msgSend(LPLocationController,"sharedLocationController"),"setLocationForObjects:",objj_msgSend(_3c,"location"),_3f);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("keyPathsForValuesAffectingTitle"),function(_40,_41){
with(_40){
return objj_msgSend(CPSet,"setWithObjects:","content","content.displayTitle");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingItemStatus"),function(_42,_43){
with(_42){
return objj_msgSend(CPSet,"setWithObjects:","content","content.updatedAt");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingSubtitle"),function(_44,_45){
with(_44){
return objj_msgSend(CPSet,"setWithObjects:","content","content.tagline");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingGenre"),function(_46,_47){
with(_46){
return objj_msgSend(CPSet,"setWithObjects:","content","content.genres");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingArtImage"),function(_48,_49){
with(_48){
return objj_msgSend(CPSet,"setWithObjects:","content","content.artImage");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingContentRatingFlagImage"),function(_4a,_4b){
with(_4a){
return objj_msgSend(CPSet,"setWithObjects:","content.contentRating");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingStudioFlagImage"),function(_4c,_4d){
with(_4c){
return objj_msgSend(CPSet,"setWithObjects:","content.studio");
}
})]);
p;37;Controllers/MMImagePickerController.jt;12136;@STATIC;1.0;I;33;Foundation/CPNotificationCenter.jI;25;AppKit/CPViewController.ji;34;../Controllers/MMScrollAnimation.ji;27;../Models/MMMetadataImage.ji;40;../CPValueTransformer+FunctionCallback.ji;27;../Views/MMCollectionView.ji;28;../Views/MMImagePickerCell.ji;25;../Views/MMScrollButton.ji;33;../Views/MMHorizontalScrollView.ji;20;../Views/MMToolbar.ji;20;../Views/HUDButton.jt;11749;
objj_executeFile("Foundation/CPNotificationCenter.j",NO);
objj_executeFile("AppKit/CPViewController.j",NO);
objj_executeFile("../Controllers/MMScrollAnimation.j",YES);
objj_executeFile("../Models/MMMetadataImage.j",YES);
objj_executeFile("../CPValueTransformer+FunctionCallback.j",YES);
objj_executeFile("../Views/MMCollectionView.j",YES);
objj_executeFile("../Views/MMImagePickerCell.j",YES);
objj_executeFile("../Views/MMScrollButton.j",YES);
objj_executeFile("../Views/MMHorizontalScrollView.j",YES);
objj_executeFile("../Views/MMToolbar.j",YES);
objj_executeFile("../Views/HUDButton.j",YES);
var _1=objj_allocateClassPair(CPViewController,"MMImagePickerController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_delegate"),new objj_ivar("metadataItem"),new objj_ivar("_imagesController"),new objj_ivar("_dataSource"),new objj_ivar("_imageGridView"),new objj_ivar("_itemSize"),new objj_ivar("_imagePreview"),new objj_ivar("_parentViewController"),new objj_ivar("scrollView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("delegate"),function(_3,_4){
with(_3){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_5,_6,_7){
with(_5){
_delegate=_7;
}
}),new objj_method(sel_getUid("metadataItem"),function(_8,_9){
with(_8){
return metadataItem;
}
}),new objj_method(sel_getUid("setMetadataItem:"),function(_a,_b,_c){
with(_a){
metadataItem=_c;
}
}),new objj_method(sel_getUid("dataSource"),function(_d,_e){
with(_d){
return _dataSource;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_f,_10,_11){
with(_f){
_dataSource=_11;
}
}),new objj_method(sel_getUid("imageGridView"),function(_12,_13){
with(_12){
return _imageGridView;
}
}),new objj_method(sel_getUid("itemSize"),function(_14,_15){
with(_14){
return _itemSize;
}
}),new objj_method(sel_getUid("setItemSize:"),function(_16,_17,_18){
with(_16){
_itemSize=_18;
}
}),new objj_method(sel_getUid("parentViewController"),function(_19,_1a){
with(_19){
return _parentViewController;
}
}),new objj_method(sel_getUid("setParentViewController:"),function(_1b,_1c,_1d){
with(_1b){
_parentViewController=_1d;
}
}),new objj_method(sel_getUid("init"),function(_1e,_1f){
with(_1e){
if(_1e=objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("MMImagePickerController").super_class},"init")){
_imagesController=objj_msgSend(objj_msgSend(CPArrayController,"alloc"),"init");
}
return _1e;
}
}),new objj_method(sel_getUid("initWithDelegate:"),function(_20,_21,_22){
with(_20){
if(_20=objj_msgSend(_20,"init")){
_delegate=_22;
}
return _20;
}
}),new objj_method(sel_getUid("setMetadataItem:"),function(_23,_24,_25){
with(_23){
if(objj_msgSend(metadataItem,"isEqual:",_25)){
return;
}
metadataItem=_25;
objj_msgSend(_23,"refreshImagesFromDataSource");
}
}),new objj_method(sel_getUid("setDataSource:"),function(_26,_27,_28){
with(_26){
if(_dataSource==_28){
return;
}
objj_msgSend(_dataSource,"removeArrayController:",_imagesController);
if(_dataSource){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_26,MMDataSourceDidFailToReceiveRecords,_dataSource);
}
_dataSource=_28;
objj_msgSend(_dataSource,"addArrayController:",_imagesController);
if(_dataSource){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_26,sel_getUid("_didFailToReceiveRecords:"),MMDataSourceDidFailToReceiveRecords,_dataSource);
}
objj_msgSend(_26,"refreshImagesFromDataSource");
}
}),new objj_method(sel_getUid("_didFailToReceiveRecords:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(AppController,"notifyUserOfConnectionError:",objj_msgSend(objj_msgSend(_2b,"userInfo"),"objectForKey:","error"));
}
}),new objj_method(sel_getUid("refreshImagesFromDataSource"),function(_2c,_2d){
with(_2c){
if(metadataItem){
objj_msgSend(_dataSource,"refreshRecordsWithContextInfo:",metadataItem);
}
}
}),new objj_method(sel_getUid("wasPushedOntoContentController:"),function(_2e,_2f,_30){
with(_2e){
objj_msgSend(_imageGridView,"notifySubviewsOfVisibility");
objj_msgSend(_imagePreview,"setHidden:",NO);
}
}),new objj_method(sel_getUid("willBePoppedOffContentController:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithViewAnimations:",[objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_imagePreview,CPViewAnimationTargetKey,CPViewAnimationFadeOutEffect,CPViewAnimationEffectKey)]);
objj_msgSend(_34,"setDuration:",0.25);
objj_msgSend(_34,"setAnimationCurve:",CPAnimationLinear);
objj_msgSend(_34,"startAnimation");
}
}),new objj_method(sel_getUid("viewDidMoveToSuperview"),function(_35,_36){
with(_35){
objj_msgSendSuper({receiver:_35,super_class:objj_getClass("MMImagePickerController").super_class},"viewDidMoveToSuperview");
objj_msgSend(objj_msgSend(objj_msgSend(_35,"view"),"window"),"makeFirstResponder:",_imageGridView);
}
}),new objj_method(sel_getUid("isNavigable"),function(_37,_38){
with(_37){
return NO;
}
}),new objj_method(sel_getUid("loadView"),function(_39,_3a){
with(_39){
var _3b=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,800,800)),_3c=30;
_imageGridView=objj_msgSend(objj_msgSend(MMCollectionView,"alloc"),"initWithFrame:",CGRectMakeZero());
var _3d=_itemSize.height+objj_msgSend(_imageGridView,"verticalMargin")*2;
scrollView=objj_msgSend(objj_msgSend(MMHorizontalScrollView,"alloc"),"initWithFrame:",CGRectMake(0,CGRectGetHeight(objj_msgSend(_3b,"frame"))-_3c-_3d,CGRectGetWidth(objj_msgSend(_3b,"frame")),_3d));
objj_msgSend(_3b,"addSubview:",scrollView);
_imagePreview=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(0,50,CGRectGetWidth(objj_msgSend(_3b,"frame")),CGRectGetMinY(objj_msgSend(scrollView,"frame"))-100));
objj_msgSend(_imagePreview,"setSizeConstraint:",CGSizeMake(512,512));
objj_msgSend(_imagePreview,"setImageAlignment:",CPImageAlignCenter);
objj_msgSend(_imagePreview,"setImageScaling:",CPScaleProportionally);
objj_msgSend(_imagePreview,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_imagePreview,"setHasShadow:",YES);
objj_msgSend(_imagePreview,"setShadowBlurDistance:",20);
objj_msgSend(_3b,"addSubview:",_imagePreview);
objj_msgSend(objj_msgSend(scrollView,"contentView"),"setInsetShadowAlignment:",MMClipViewInsetShadowAlignTop);
objj_msgSend(objj_msgSend(scrollView,"contentView"),"setBackgroundColor:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",50/255,1));
objj_msgSend(scrollView,"setDocumentView:",_imageGridView);
objj_msgSend(scrollView,"setAutoresizingMask:",CPViewWidthSizable|CPViewMinYMargin);
objj_msgSend(objj_msgSend(scrollView,"leftScrollButton"),"setHasBackgroundGradient:",YES);
objj_msgSend(objj_msgSend(scrollView,"rightScrollButton"),"setHasBackgroundGradient:",YES);
var _3e=objj_msgSend(objj_msgSend(CPCollectionViewItem,"alloc"),"init");
objj_msgSend(_3e,"setView:",objj_msgSend(objj_msgSend(MMImagePickerCell,"alloc"),"initWithFrame:",{origin:CGPointMake(0,0),size:_itemSize}));
objj_msgSend(_imageGridView,"setDelegate:",_39);
objj_msgSend(_imageGridView,"setItemPrototype:",_3e);
objj_msgSend(_imageGridView,"setMinItemSize:",_itemSize);
objj_msgSend(_imageGridView,"setMaxItemSize:",_itemSize);
objj_msgSend(_imageGridView,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_imageGridView,"bind:toObject:withKeyPath:options:","selectionIndexes",_imagesController,"selectionIndexes",nil);
objj_msgSend(_39,"bind:toObject:withKeyPath:options:","content",_imagesController,"arrangedObjects",nil);
objj_msgSend(_39,"bind:toObject:withKeyPath:options:","selectionIndexes",_imagesController,"selectionIndexes",nil);
objj_msgSend(_3b,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_3b,"frame")),CGRectGetHeight(objj_msgSend(objj_msgSend(_3e,"view"),"frame"))+(2*objj_msgSend(_imageGridView,"verticalMargin"))+_3c));
var _3f=objj_msgSend(objj_msgSend(MMToolbar,"alloc"),"initWithFrame:style:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(scrollView,"frame")),CGRectGetWidth(objj_msgSend(scrollView,"frame")),30),MMToolbarHUDStyle);
objj_msgSend(_3f,"setAutoresizingMask:",CPViewWidthSizable|CPViewMinYMargin);
objj_msgSend(_3b,"addSubview:",_3f);
var _40=objj_msgSend(HUDButton,"buttonWithTitle:",CPLocalizedString("Select Image","Select Image"));
objj_msgSend(_40,"setFrameOrigin:",CGPointMake(CGRectGetWidth(objj_msgSend(_3f,"frame"))-5-CGRectGetWidth(objj_msgSend(_40,"frame")),(CGRectGetHeight(objj_msgSend(_3f,"frame"))-CGRectGetHeight(objj_msgSend(_40,"frame")))/2));
objj_msgSend(_40,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin|CPViewMinXMargin);
objj_msgSend(_40,"setTarget:",_39);
objj_msgSend(_40,"setAction:",sel_getUid("chooseImage:"));
objj_msgSend(_40,"setKeyEquivalent:",CPCarriageReturnCharacter);
objj_msgSend(_40,"bind:toObject:withKeyPath:options:","enabled",_imagesController,"selectionIndexes",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(CPValueTransformer,"valueTransformerForFunction:",function(_41){
return objj_msgSend(_41,"count")>0;
}),CPValueTransformerBindingOption));
objj_msgSend(_3f,"addSubview:",_40);
var _42=objj_msgSend(HUDButton,"buttonWithTitle:",CPLocalizedString("Cancel","Cancel"));
objj_msgSend(_42,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_40,"frame"))-5-CGRectGetWidth(objj_msgSend(_42,"frame")),CGRectGetMinY(objj_msgSend(_40,"frame"))));
objj_msgSend(_42,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin|CPViewMinXMargin);
objj_msgSend(_42,"setAutoresizingMask:",objj_msgSend(_40,"autoresizingMask"));
objj_msgSend(_42,"setTarget:",_39);
objj_msgSend(_42,"setAction:",sel_getUid("cancel:"));
objj_msgSend(_42,"setKeyEquivalent:",CPEscapeFunctionKey);
objj_msgSend(_3f,"addSubview:",_42);
objj_msgSend(_39,"setView:",_3b);
}
}),new objj_method(sel_getUid("setContent:"),function(_43,_44,_45){
with(_43){
objj_msgSend(_imageGridView,"setContent:",_45);
objj_msgSend(_imageGridView,"sizeToFitNumberOfColumns:withHorizontalMargin:",objj_msgSend(_45,"count"),0);
}
}),new objj_method(sel_getUid("setSelectionIndexes:"),function(_46,_47,_48){
with(_46){
var _49=objj_msgSend(_imagesController,"selectedObjects");
if(objj_msgSend(_49,"count")>0){
objj_msgSend(_imagePreview,"setImage:",objj_msgSend(objj_msgSend(_49,"objectAtIndex:",0),"image"));
}
}
}),new objj_method(sel_getUid("chooseImage:"),function(_4a,_4b,_4c){
with(_4a){
var _4d=objj_msgSend(_imagesController,"selectedObjects");
if(objj_msgSend(_4d,"count")==0){
return;
}
var _4e=objj_msgSend(_4d,"objectAtIndex:",0);
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imagePicker:didChooseImage:"))){
objj_msgSend(_delegate,"imagePicker:didChooseImage:",_4a,_4e);
}
objj_msgSend(_4a,"_updateMetadataItemWithMetadataImage:",_4e);
objj_msgSend(_parentViewController,"popViewControllerAnimated:",YES);
}
}),new objj_method(sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"),function(_4f,_50,_51,_52){
with(_4f){
var _53=objj_msgSend(objj_msgSend(_51,"content"),"objectAtIndex:",_52);
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imagePicker:didChooseImage:"))){
objj_msgSend(_delegate,"imagePicker:didChooseImage:",_4f,_53);
}
objj_msgSend(_4f,"_updateMetadataItemWithMetadataImage:",_53);
objj_msgSend(_parentViewController,"popViewControllerAnimated:",YES);
}
}),new objj_method(sel_getUid("_updateMetadataItemWithMetadataImage:"),function(_54,_55,_56){
with(_54){
objj_msgSend(_dataSource,"selectMetadataImage:forMetadataItem:",_56,metadataItem);
}
}),new objj_method(sel_getUid("cancel:"),function(_57,_58,_59){
with(_57){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("imagePickerDidCancel:"))){
objj_msgSend(_delegate,"imagePickerDidCancel:",_57);
}
objj_msgSend(_parentViewController,"popViewControllerAnimated:",YES);
}
})]);
p;31;Controllers/MMScrollAnimation.jt;1494;@STATIC;1.0;I;20;AppKit/CPAnimation.jt;1450;
objj_executeFile("AppKit/CPAnimation.j",NO);
var _1=objj_allocateClassPair(CPAnimation,"MMScrollAnimation"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_viewToScroll"),new objj_ivar("_startPoint"),new objj_ivar("_endPoint"),new objj_ivar("_delta")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithView:offset:"),function(_3,_4,_5,_6){
with(_3){
var _7=objj_msgSend(_5,"bounds").origin;
return _3=objj_msgSend(_3,"initWithView:toPoint:",_5,CGPointMake(_7.x+_6.width,_7.y+_6.height));
}
}),new objj_method(sel_getUid("initWithView:toPoint:"),function(_8,_9,_a,_b){
with(_8){
return _8=objj_msgSend(_8,"initWithView:fromPoint:toPoint:",_a,objj_msgSend(_a,"bounds").origin,_b);
}
}),new objj_method(sel_getUid("initWithView:fromPoint:toPoint:"),function(_c,_d,_e,_f,_10){
with(_c){
if(_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("MMScrollAnimation").super_class},"initWithDuration:animationCurve:",0.2,CPAnimationEaseOut)){
_viewToScroll=_e;
_startPoint=_f;
_endPoint=_10;
_delta=CGSizeMake(_endPoint.x-_startPoint.x,_endPoint.y-_startPoint.y);
}
return _c;
}
}),new objj_method(sel_getUid("setCurrentProgress:"),function(_11,_12,_13){
with(_11){
objj_msgSendSuper({receiver:_11,super_class:objj_getClass("MMScrollAnimation").super_class},"setCurrentProgress:",_13);
objj_msgSend(_viewToScroll,"scrollToPoint:",CGPointMake(_startPoint.x+_delta.width*_13,_startPoint.y+_delta.height*_13));
}
})]);
p;24;Models/MMMetadataImage.jt;2142;@STATIC;1.0;I;21;Foundation/CPObject.jt;2097;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"MMMetadataImage"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_key"),new objj_ivar("_image"),new objj_ivar("_ratingKey"),new objj_ivar("_thumb"),new objj_ivar("_thumbImage")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("key"),function(_3,_4){
with(_3){
return _key;
}
}),new objj_method(sel_getUid("setKey:"),function(_5,_6,_7){
with(_5){
_key=_7;
}
}),new objj_method(sel_getUid("image"),function(_8,_9){
with(_8){
return _image;
}
}),new objj_method(sel_getUid("setImage:"),function(_a,_b,_c){
with(_a){
_image=_c;
}
}),new objj_method(sel_getUid("ratingKey"),function(_d,_e){
with(_d){
return _ratingKey;
}
}),new objj_method(sel_getUid("setRatingKey:"),function(_f,_10,_11){
with(_f){
_ratingKey=_11;
}
}),new objj_method(sel_getUid("thumb"),function(_12,_13){
with(_12){
return _thumb;
}
}),new objj_method(sel_getUid("setThumb:"),function(_14,_15,_16){
with(_14){
_thumb=_16;
}
}),new objj_method(sel_getUid("thumbImage"),function(_17,_18){
with(_17){
return _thumbImage;
}
}),new objj_method(sel_getUid("setThumbImage:"),function(_19,_1a,_1b){
with(_19){
_thumbImage=_1b;
}
}),new objj_method(sel_getUid("image"),function(_1c,_1d){
with(_1c){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",_key,CGSizeMake(-1,-1));
}
}),new objj_method(sel_getUid("thumbImage"),function(_1e,_1f){
with(_1e){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",_thumb,CGSizeMake(-1,-1));
}
}),new objj_method(sel_getUid("description"),function(_20,_21){
with(_20){
return objj_msgSend(CPString,"stringWithFormat:","{%@ ratingKey=%@, thumb=%@}",objj_msgSend(_20,"class"),_ratingKey,_thumb);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("keyPathsForValuesAffectingThumbImage"),function(_22,_23){
with(_22){
return objj_msgSend(CPSet,"setWithObject:","thumb");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingImage"),function(_24,_25){
with(_24){
return objj_msgSend(CPSet,"setWithObject:","key");
}
})]);
p;37;CPValueTransformer+FunctionCallback.jt;907;@STATIC;1.0;t;889;
var _1=objj_getClass("CPValueTransformer");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"CPValueTransformer\"");
}
var _2=_1.isa;
class_addMethods(_2,[new objj_method(sel_getUid("valueTransformerForFunction:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(objj_msgSend(_MMValueTransformer,"alloc"),"initWithCallbackFunction:",_5);
}
})]);
var _1=objj_allocateClassPair(CPValueTransformer,"_MMValueTransformer"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_callback")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithCallbackFunction:"),function(_6,_7,_8){
with(_6){
if(_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("_MMValueTransformer").super_class},"init")){
_callback=_8;
}
return _6;
}
}),new objj_method(sel_getUid("transformedValue:"),function(_9,_a,_b){
with(_9){
return _callback(_b);
}
})]);
p;25;Views/MMImagePickerCell.jt;2670;@STATIC;1.0;I;33;Foundation/CPNotificationCenter.ji;24;../CPImage+Transcoding.ji;23;../Models/MMMediaItem.ji;13;MMImageView.ji;12;MMLazyView.jt;2521;
objj_executeFile("Foundation/CPNotificationCenter.j",NO);
objj_executeFile("../CPImage+Transcoding.j",YES);
objj_executeFile("../Models/MMMediaItem.j",YES);
objj_executeFile("MMImageView.j",YES);
objj_executeFile("MMLazyView.j",YES);
var _1=objj_allocateClassPair(CPView,"MMImagePickerCell"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_imageView"),new objj_ivar("_selected"),new objj_ivar("_selectionView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMImagePickerCell").super_class},"initWithFrame:",_5)){
var _6=12;
_imageView=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(_6,_6,CGRectGetWidth(objj_msgSend(_3,"frame"))-_6*2,CGRectGetHeight(objj_msgSend(_3,"frame"))-_6*2));
objj_msgSend(_imageView,"setImageScaling:",CPScaleProportionally);
objj_msgSend(_imageView,"setImageAlignment:",CPImageAlignBottom);
objj_msgSend(_imageView,"setBorderRadius:",4);
objj_msgSend(_imageView,"setHasShadow:",YES);
objj_msgSend(_imageView,"setPlaceholder:",objj_msgSend(MMMetadataItem,"blankThumbImage"));
objj_msgSend(_imageView,"setSizeConstraint:",CGSizeMake(96,128));
objj_msgSend(_3,"addSubview:",_imageView);
}
return _3;
}
}),new objj_method(sel_getUid("setRepresentedObject:"),function(_7,_8,_9){
with(_7){
objj_msgSend(_imageView,"setImage:",objj_msgSend(_9,"thumbImage"));
}
}),new objj_method(sel_getUid("setSelected:"),function(_a,_b,_c){
with(_a){
_c=!!_c;
if(_c===_selected){
return;
}
_selected=_c;
if(_selected&&!_selectionView&&_imageView){
_selectionView=objj_msgSend(MMSelectionView,"selectionViewForView:",_imageView);
}
objj_msgSend(_selectionView,"setSelected:",_selected);
}
})]);
var _d="MMImagePickerCellImageViewKey";
var _1=objj_getClass("MMImagePickerCell");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"MMImagePickerCell\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_e,_f,_10){
with(_e){
if(_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("MMImagePickerCell").super_class},"initWithCoder:",_10)){
_imageView=objj_msgSend(_10,"decodeObjectForKey:",_d);
}
return _e;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_11,_12,_13){
with(_11){
objj_msgSendSuper({receiver:_11,super_class:objj_getClass("MMImagePickerCell").super_class},"encodeWithCoder:",_13);
objj_msgSend(_13,"encodeObject:forKey:",_imageView,_d);
}
})]);
p;22;Views/MMScrollButton.jt;4697;@STATIC;1.0;I;18;AppKit/CPControl.jt;4655;
objj_executeFile("AppKit/CPControl.j",NO);
MMScrollButtonDirectionLeft="MMScrollButtonDirectionLeft";
MMScrollButtonDirectionRight="MMScrollButtonDirectionRight";
var _1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","scrollLeft.png"));
var _2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","scrollRight.png"));
var _3=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","scrollLeftBackground.png")));
var _4=objj_msgSend(CPColor,"colorWithPatternImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","scrollRightBackground.png")));
var _5=objj_allocateClassPair(CPControl,"MMScrollButton"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("direction"),new objj_ivar("hasBackgroundGradient"),new objj_ivar("verticalMargin"),new objj_ivar("arrow")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("direction"),function(_7,_8){
with(_7){
return direction;
}
}),new objj_method(sel_getUid("setDirection:"),function(_9,_a,_b){
with(_9){
direction=_b;
}
}),new objj_method(sel_getUid("hasBackgroundGradient"),function(_c,_d){
with(_c){
return hasBackgroundGradient;
}
}),new objj_method(sel_getUid("setHasBackgroundGradient:"),function(_e,_f,_10){
with(_e){
hasBackgroundGradient=_10;
}
}),new objj_method(sel_getUid("verticalMargin"),function(_11,_12){
with(_11){
return verticalMargin;
}
}),new objj_method(sel_getUid("setVerticalMargin:"),function(_13,_14,_15){
with(_13){
verticalMargin=_15;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_16,_17,_18){
with(_16){
if(_16=objj_msgSendSuper({receiver:_16,super_class:objj_getClass("MMScrollButton").super_class},"initWithFrame:",_18)){
arrow=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_16,"addSubview:",arrow);
}
return _16;
}
}),new objj_method(sel_getUid("setDirection:"),function(_19,_1a,_1b){
with(_19){
if(direction==_1b){
return;
}
direction=_1b;
objj_msgSend(_19,"setNeedsLayout");
objj_msgSend(_19,"redraw");
}
}),new objj_method(sel_getUid("setHasBackgroundGradient:"),function(_1c,_1d,_1e){
with(_1c){
hasBackgroundGradient=_1e;
objj_msgSend(_1c,"redraw");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_1f,_20){
with(_1f){
var _21=CGSizeMake(23,35),_22=15,_23=verticalMargin||(CGRectGetHeight(objj_msgSend(_1f,"frame"))-_21.height)/2;
switch(direction){
case MMScrollButtonDirectionLeft:
objj_msgSend(arrow,"setFrame:",CGRectMake(_22,_23,_21.width,_21.height));
break;
case MMScrollButtonDirectionRight:
objj_msgSend(arrow,"setFrame:",CGRectMake(CGRectGetWidth(objj_msgSend(_1f,"frame"))-_22-_21.width,_23,_21.width,_21.height));
break;
}
objj_msgSendSuper({receiver:_1f,super_class:objj_getClass("MMScrollButton").super_class},"layoutSubviews");
}
}),new objj_method(sel_getUid("redraw"),function(_24,_25){
with(_24){
var _26,_27;
switch(direction){
case MMScrollButtonDirectionLeft:
_26=_3;
_27=_1;
break;
case MMScrollButtonDirectionRight:
_26=_4;
_27=_2;
break;
}
objj_msgSend(arrow,"setImage:",_27);
if(hasBackgroundGradient){
objj_msgSend(_24,"setBackgroundColor:",_26);
}
}
}),new objj_method(sel_getUid("hitTest:"),function(_28,_29,_2a){
with(_28){
var _2b=objj_msgSendSuper({receiver:_28,super_class:objj_getClass("MMScrollButton").super_class},"hitTest:",_2a);
if(_2b!=_28){
return _2b;
}
var _2c=objj_msgSend(_28,"convertPoint:fromView:",_2a,nil);
switch(direction){
case MMScrollButtonDirectionLeft:
return (_2c.x>CGRectGetMaxX(objj_msgSend(arrow,"frame")))?nil:_28;
case MMScrollButtonDirectionRight:
return (_2c.x<CGRectGetMinX(objj_msgSend(arrow,"frame")))?nil:_28;
}
return _28;
}
})]);
class_addMethods(_6,[new objj_method(sel_getUid("leftScrollButton"),function(_2d,_2e){
with(_2d){
var _2f=objj_msgSend(objj_msgSend(_2d,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(objj_msgSend(_3,"patternImage"),"size").width,objj_msgSend(_1,"size").height*2));
objj_msgSend(_2f,"setDirection:",MMScrollButtonDirectionLeft);
return _2f;
}
}),new objj_method(sel_getUid("rightScrollButton"),function(_30,_31){
with(_30){
var _32=objj_msgSend(objj_msgSend(_30,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(objj_msgSend(_4,"patternImage"),"size").width,objj_msgSend(_2,"size").height*2));
objj_msgSend(_32,"setDirection:",MMScrollButtonDirectionRight);
return _32;
}
})]);
p;30;Views/MMHorizontalScrollView.jt;5085;@STATIC;1.0;I;21;AppKit/CPScrollView.ji;16;MMScrollButton.ji;34;../Controllers/MMScrollAnimation.jt;4980;
objj_executeFile("AppKit/CPScrollView.j",NO);
objj_executeFile("MMScrollButton.j",YES);
objj_executeFile("../Controllers/MMScrollAnimation.j",YES);
var _1=objj_allocateClassPair(CPView,"MMHorizontalScrollView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("scrollView"),new objj_ivar("leftScrollButton"),new objj_ivar("rightScrollButton"),new objj_ivar("scrollAnimation")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("leftScrollButton"),function(_3,_4){
with(_3){
return leftScrollButton;
}
}),new objj_method(sel_getUid("rightScrollButton"),function(_5,_6){
with(_5){
return rightScrollButton;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_7,_8,_9){
with(_7){
if(_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("MMHorizontalScrollView").super_class},"initWithFrame:",_9)){
scrollView=objj_msgSend(objj_msgSend(MMScrollView,"alloc"),"initWithFrame:",objj_msgSend(_7,"bounds"));
objj_msgSend(scrollView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(scrollView,"setHasVerticalScroller:",NO);
objj_msgSend(scrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(scrollView,"addObserver:forKeyPath:options:context:",_7,"scrollPoint",CPKeyValueChangeNewKey,nil);
objj_msgSend(scrollView,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(scrollView,"addObserver:forKeyPath:options:context:",_7,"frame",CPKeyValueChangeNewKey,nil);
leftScrollButton=objj_msgSend(MMScrollButton,"leftScrollButton");
rightScrollButton=objj_msgSend(MMScrollButton,"rightScrollButton");
objj_msgSend(leftScrollButton,"setFrame:",CGRectMake(0,CGRectGetMinY(objj_msgSend(scrollView,"frame")),CGRectGetWidth(objj_msgSend(leftScrollButton,"frame")),CGRectGetHeight(objj_msgSend(scrollView,"frame"))));
objj_msgSend(rightScrollButton,"setFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(scrollView,"frame"))-CGRectGetWidth(objj_msgSend(rightScrollButton,"frame")),CGRectGetMinY(objj_msgSend(scrollView,"frame")),CGRectGetWidth(objj_msgSend(leftScrollButton,"frame")),CGRectGetHeight(objj_msgSend(scrollView,"frame"))));
objj_msgSend(leftScrollButton,"setAutoresizingMask:",CPViewMaxXMargin|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(rightScrollButton,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(leftScrollButton,"setTarget:",_7);
objj_msgSend(leftScrollButton,"setAction:",sel_getUid("scrollLeft:"));
objj_msgSend(rightScrollButton,"setTarget:",_7);
objj_msgSend(rightScrollButton,"setAction:",sel_getUid("scrollRight:"));
objj_msgSend(_7,"addSubview:",scrollView);
objj_msgSend(_7,"addSubview:",leftScrollButton);
objj_msgSend(_7,"addSubview:",rightScrollButton);
}
return _7;
}
}),new objj_method(sel_getUid("scrollLeft:"),function(_a,_b,_c){
with(_a){
objj_msgSend(scrollAnimation,"stopAnimation");
var _d=objj_msgSend(scrollView,"contentView"),_e=objj_msgSend(_d,"bounds"),_f=MAX(0,CGRectGetMinX(_e)-CGRectGetWidth(_e)+40);
scrollAnimation=objj_msgSend(objj_msgSend(MMScrollAnimation,"alloc"),"initWithView:toPoint:",_d,CGPointMake(_f,0));
objj_msgSend(scrollAnimation,"startAnimation");
}
}),new objj_method(sel_getUid("scrollRight:"),function(_10,_11,_12){
with(_10){
objj_msgSend(scrollAnimation,"stopAnimation");
var _13=objj_msgSend(scrollView,"contentView"),_14=objj_msgSend(_13,"bounds"),_15=MIN(CGRectGetWidth(objj_msgSend(objj_msgSend(scrollView,"documentView"),"frame")),CGRectGetMinX(_14)+CGRectGetWidth(_14)-40);
scrollAnimation=objj_msgSend(objj_msgSend(MMScrollAnimation,"alloc"),"initWithView:toPoint:",_13,CGPointMake(_15,0));
objj_msgSend(scrollAnimation,"startAnimation");
}
}),new objj_method(sel_getUid("showOrHideScrollButtons"),function(_16,_17){
with(_16){
var _18=objj_msgSend(objj_msgSend(scrollView,"contentView"),"bounds"),_19=0,_1a=CGRectGetWidth(objj_msgSend(objj_msgSend(scrollView,"documentView"),"frame"));
objj_msgSend(leftScrollButton,"setHidden:",(CGRectGetMinX(_18)<=_19));
objj_msgSend(rightScrollButton,"setHidden:",(CGRectGetMaxX(_18)>=_1a));
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_1b,_1c,_1d,_1e,_1f,_20){
with(_1b){
if(_1e==scrollView&&(_1d=="scrollPoint"||_1d=="frame")){
objj_msgSend(_1b,"showOrHideScrollButtons");
}else{
if(_1e==objj_msgSend(scrollView,"documentView")&&_1d=="frame"){
objj_msgSend(_1b,"showOrHideScrollButtons");
}
}
}
}),new objj_method(sel_getUid("contentView"),function(_21,_22){
with(_21){
return objj_msgSend(scrollView,"contentView");
}
}),new objj_method(sel_getUid("documentView"),function(_23,_24){
with(_23){
return objj_msgSend(scrollView,"documentView");
}
}),new objj_method(sel_getUid("setDocumentView:"),function(_25,_26,_27){
with(_25){
objj_msgSend(objj_msgSend(scrollView,"documentView"),"removeObserver:",_25);
objj_msgSend(_27,"setPostsFrameChangedNotifications:",YES);
objj_msgSend(_27,"addObserver:forKeyPath:options:context:",_25,"frame",CPKeyValueChangeNewKey,nil);
objj_msgSend(scrollView,"setDocumentView:",_27);
}
})]);
p;45;Controllers/MMMetadataItemToolbarController.jt;12378;@STATIC;1.0;I;25;AppKit/CPViewController.ji;20;../Views/MMToolbar.jt;12303;
objj_executeFile("AppKit/CPViewController.j",NO);
objj_executeFile("../Views/MMToolbar.j",YES);
var _1=objj_allocateClassPair(CPViewController,"MMMetadataItemToolbarController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("content"),new objj_ivar("_parentViewController"),new objj_ivar("_dataSource"),new objj_ivar("_matchPicker"),new objj_ivar("_changeArtworkMenu")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("content"),function(_3,_4){
with(_3){
return content;
}
}),new objj_method(sel_getUid("setContent:"),function(_5,_6,_7){
with(_5){
content=_7;
}
}),new objj_method(sel_getUid("parentViewController"),function(_8,_9){
with(_8){
return _parentViewController;
}
}),new objj_method(sel_getUid("setParentViewController:"),function(_a,_b,_c){
with(_a){
_parentViewController=_c;
}
}),new objj_method(sel_getUid("loadView"),function(_d,_e){
with(_d){
var _f=objj_msgSend(objj_msgSend(MMToolbar,"alloc"),"initWithFrame:style:",CGRectMake(0,0,400,30),MMToolbarHUDStyle);
var _10=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(_10,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_10,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_10,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(_10,"setFrame:",CGRectMake(10,(CGRectGetHeight(objj_msgSend(_f,"frame"))-CGRectGetHeight(objj_msgSend(_10,"frame")))/2,CGRectGetWidth(objj_msgSend(_f,"frame")),CGRectGetHeight(objj_msgSend(_10,"frame"))));
objj_msgSend(_10,"bind:toObject:withKeyPath:options:",CPValueBinding,_d,"status",nil);
objj_msgSend(_f,"addSubview:",_10);
var _11=objj_msgSend(HUDButton,"buttonWithTitle:",CPLocalizedString("Edit Metadata","Edit Metadata"));
objj_msgSend(_11,"setKeyEquivalent:","i");
objj_msgSend(_11,"setKeyEquivalentModifierMask:",CPCommandKeyMask);
objj_msgSend(_11,"setFrameOrigin:",CGPointMake(CGRectGetWidth(objj_msgSend(_f,"frame"))-5-CGRectGetWidth(objj_msgSend(_11,"frame")),(CGRectGetHeight(objj_msgSend(_f,"frame"))-CGRectGetHeight(objj_msgSend(_11,"frame")))/2));
objj_msgSend(_11,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin|CPViewMinXMargin);
objj_msgSend(_11,"setTarget:",_d);
objj_msgSend(_11,"setAction:",sel_getUid("editMetadata:"));
objj_msgSend(_11,"bind:toObject:withKeyPath:options:","enabled",_d,"editMetadataEnabled",nil);
objj_msgSend(_f,"addSubview:",_11);
var _12=objj_msgSend(HUDButton,"buttonWithTitle:",CPLocalizedString("Change Artwork","Change Artwork"));
objj_msgSend(_12,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_11,"frame"))-5-CGRectGetWidth(objj_msgSend(_12,"frame")),(CGRectGetHeight(objj_msgSend(_f,"frame"))-CGRectGetHeight(objj_msgSend(_12,"frame")))/2));
objj_msgSend(_12,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin|CPViewMinXMargin);
objj_msgSend(_12,"setTarget:",_d);
objj_msgSend(_12,"setAction:",sel_getUid("changeArtwork:"));
objj_msgSend(_f,"addSubview:",_12);
var _13=objj_msgSend(HUDButton,"buttonWithTitle:",CPLocalizedString("Fix incorrect match","Fix incorrect match"));
objj_msgSend(_13,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_12,"frame"))-5-CGRectGetWidth(objj_msgSend(_13,"frame")),(CGRectGetHeight(objj_msgSend(_f,"frame"))-CGRectGetHeight(objj_msgSend(_13,"frame")))/2));
objj_msgSend(_13,"setKeyEquivalent:","f");
objj_msgSend(_13,"setKeyEquivalentModifierMask:",CPCommandKeyMask);
objj_msgSend(_13,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin|CPViewMinXMargin);
objj_msgSend(_13,"setTarget:",_d);
objj_msgSend(_13,"setAction:",sel_getUid("fixIncorrectMatch:"));
objj_msgSend(_13,"bind:toObject:withKeyPath:options:","enabled",_d,"fixIncorrectMatchEnabled",nil);
objj_msgSend(_f,"addSubview:",_13);
_changeArtworkMenu=objj_msgSend(objj_msgSend(CPMenu,"alloc"),"initWithTitle:","");
objj_msgSend(_changeArtworkMenu,"setAutoenablesItems:",NO);
var _14=objj_msgSend(_changeArtworkMenu,"addItemWithTitle:action:keyEquivalent:","",sel_getUid("choosePoster:"),nil);
objj_msgSend(_14,"setTarget:",_d);
objj_msgSend(_14,"bind:toObject:withKeyPath:options:","enabled",_d,"choosePosterEnabled",nil);
objj_msgSend(_14,"bind:toObject:withKeyPath:options:","title",_d,"titleForChoosePosterMenuItem",nil);
var _15=objj_msgSend(_changeArtworkMenu,"addItemWithTitle:action:keyEquivalent:",CPLocalizedString("Choose Banner","Choose Banner"),sel_getUid("chooseBanner:"),nil);
objj_msgSend(_15,"setTarget:",_d);
objj_msgSend(_15,"bind:toObject:withKeyPath:options:","enabled",_d,"chooseBannerEnabled",nil);
var _16=objj_msgSend(_changeArtworkMenu,"addItemWithTitle:action:keyEquivalent:",CPLocalizedString("Choose Background Art","Choose Background Art"),sel_getUid("chooseBackgroundArt:"),nil);
objj_msgSend(_16,"setTarget:",_d);
objj_msgSend(_16,"bind:toObject:withKeyPath:options:","enabled",_d,"chooseBackgroundArtEnabled",nil);
objj_msgSend(_d,"setView:",_f);
}
}),new objj_method(sel_getUid("status"),function(_17,_18){
with(_17){
var _19=objj_msgSend(objj_msgSend(_17,"content"),"updatedAt");
if(!_19){
return nil;
}
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Last refreshed %@ at %@","Status label for media items"),objj_msgSend(_19,"relativeDate"),objj_msgSend(_19,"shortLocalTime"));
}
}),new objj_method(sel_getUid("isFixIncorrectMatchEnabled"),function(_1a,_1b){
with(_1a){
var _1c=objj_msgSend(objj_msgSend(_1a,"content"),"parent");
if(!_1c||!objj_msgSend(_1c,"isKindOfClass:",objj_msgSend(PMCDirectoryObject,"class"))){
return NO;
}
if(objj_msgSend(objj_msgSend(_1a,"content"),"isPersonalMedia")){
return NO;
}
return YES;
}
}),new objj_method(sel_getUid("titleForChoosePosterMenuItem"),function(_1d,_1e){
with(_1d){
switch(objj_msgSend(objj_msgSend(_1d,"content"),"type")){
case PMCObjectTypeEpisode:
return CPLocalizedString("Choose Episode Thumbnail","Choose Episode Thumbnail menu item");
case PMCObjectTypeSeason:
return CPLocalizedString("Choose Season Thumbnail","Choose Season Thumbnail menu item");
case PMCObjectTypeAlbum:
return CPLocalizedString("Choose Album Thumbnail","Choose Album Thumbnail menu item");
default:
return CPLocalizedString("Choose Poster","Choose Poster menu item");
}
}
}),new objj_method(sel_getUid("isEditMetadataEnabled"),function(_1f,_20){
with(_1f){
return objj_msgSend(objj_msgSend(_1f,"content"),"type")!=PMCObjectTypeSeason;
}
}),new objj_method(sel_getUid("isChoosePosterEnabled"),function(_21,_22){
with(_21){
return YES;
}
}),new objj_method(sel_getUid("isChooseBannerEnabled"),function(_23,_24){
with(_23){
return objj_msgSend(objj_msgSend(_23,"content"),"parent")==nil;
}
}),new objj_method(sel_getUid("isChooseBackgroundArtEnabled"),function(_25,_26){
with(_25){
return objj_msgSend(objj_msgSend(objj_msgSend(_25,"content"),"parent"),"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"));
}
}),new objj_method(sel_getUid("fixIncorrectMatch:"),function(_27,_28,_29){
with(_27){
_matchPicker=objj_msgSend(objj_msgSend(MMMatchPickerController,"alloc"),"initWithDelegate:",_27);
objj_msgSend(_matchPicker,"setMetadataItem:",objj_msgSend(_27,"content"));
objj_msgSend(_matchPicker,"presentSheetInWindow:",objj_msgSend(objj_msgSend(_27,"view"),"window"));
}
}),new objj_method(sel_getUid("matchPickerDidCancel:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(_matchPicker,"dismissSheet"),_matchPicker=nil;
}
}),new objj_method(sel_getUid("matchPicker:didSelectSearchResult:"),function(_2d,_2e,_2f,_30){
with(_2d){
if(_2f!==_matchPicker){
return;
}
CPLog.info("[%@ -picker:didSelectSearchResult:] user chose %@ as the correct match for %@",objj_msgSend(_2d,"class"),_30,objj_msgSend(_2d,"content"));
objj_msgSend(_matchPicker,"dismissSheet"),_matchPicker=nil;
objj_msgSend(objj_msgSend(MMMediaMatchesDataSource,"sharedDataSource"),"selectMatch:forMetadataItem:",_30,objj_msgSend(_2d,"content"));
}
}),new objj_method(sel_getUid("changeArtwork:"),function(_31,_32,_33){
with(_31){
objj_msgSend(_changeArtworkMenu,"popUpMenuPositioningItem:atLocation:inView:callback:",objj_msgSend(objj_msgSend(_changeArtworkMenu,"itemArray"),"objectAtIndex:",0),CGPointMake(0,0),_33,nil);
}
}),new objj_method(sel_getUid("choosePoster:"),function(_34,_35,_36){
with(_34){
_imagePicker=objj_msgSend(objj_msgSend(MMImagePickerController,"alloc"),"initWithDelegate:",_34);
objj_msgSend(_imagePicker,"setMetadataItem:",objj_msgSend(_34,"content"));
objj_msgSend(_imagePicker,"setItemSize:",CGSizeMake(128,150));
objj_msgSend(_imagePicker,"setDataSource:",objj_msgSend(MMPosterMetadataDataSource,"sharedDataSource"));
objj_msgSend(_parentViewController,"pushViewController:animated:",_imagePicker,YES);
}
}),new objj_method(sel_getUid("chooseBanner:"),function(_37,_38,_39){
with(_37){
_imagePicker=objj_msgSend(objj_msgSend(MMImagePickerController,"alloc"),"initWithDelegate:",_37);
objj_msgSend(_imagePicker,"setMetadataItem:",objj_msgSend(_37,"content"));
objj_msgSend(_imagePicker,"setItemSize:",CGSizeMake(150,75));
objj_msgSend(_imagePicker,"setDataSource:",objj_msgSend(MMBannerMetadataDataSource,"sharedDataSource"));
objj_msgSend(_parentViewController,"pushViewController:animated:",_imagePicker,YES);
}
}),new objj_method(sel_getUid("chooseBackgroundArt:"),function(_3a,_3b,_3c){
with(_3a){
_imagePicker=objj_msgSend(objj_msgSend(MMImagePickerController,"alloc"),"initWithDelegate:",_3a);
objj_msgSend(_imagePicker,"setMetadataItem:",objj_msgSend(_3a,"content"));
objj_msgSend(_imagePicker,"setItemSize:",CGSizeMake(150,75));
objj_msgSend(_imagePicker,"setDataSource:",objj_msgSend(MMBackgroundArtMetadataDataSource,"sharedDataSource"));
objj_msgSend(_parentViewController,"pushViewController:animated:",_imagePicker,YES);
}
}),new objj_method(sel_getUid("imagePicker:didChooseImage:"),function(_3d,_3e,_3f,_40){
with(_3d){
if(objj_msgSend(objj_msgSend(_3f,"dataSource"),"isKindOfClass:",objj_msgSend(MMPosterMetadataDataSource,"class"))){
objj_msgSend(objj_msgSend(_3d,"content"),"setThumbImage:",objj_msgSend(_40,"image"));
}else{
if(objj_msgSend(objj_msgSend(_3f,"dataSource"),"isKindOfClass:",objj_msgSend(MMBackgroundArtMetadataDataSource,"class"))){
objj_msgSend(objj_msgSend(_3d,"content"),"setArtImage:",objj_msgSend(_40,"image"));
}
}
}
}),new objj_method(sel_getUid("editMetadata:"),function(_41,_42,_43){
with(_41){
_editor=objj_msgSend(objj_msgSend(MMMetadataEditorController,"alloc"),"initWithDelegate:",_41);
objj_msgSend(_editor,"presentMetadataItem:inWindow:",objj_msgSend(_41,"content"),objj_msgSend(objj_msgSend(_41,"view"),"window"));
}
}),new objj_method(sel_getUid("metadataEditor:didCommitMetadataItem:"),function(_44,_45,_46,_47){
with(_44){
if(_dataSource==nil){
_dataSource=objj_msgSend(objj_msgSend(MMMetadataItemDataSource,"alloc"),"initWithDelegate:",_44);
}
objj_msgSend(_dataSource,"updateRecord:",_47);
}
}),new objj_method(sel_getUid("dataSource:didUpdateRecord:contextInfo:"),function(_48,_49,_4a,_4b,_4c){
with(_48){
if(_4a==_dataSource){
objj_msgSend(_editor,"dismissSheet");
}
}
}),new objj_method(sel_getUid("dataSource:didFailToUpdateRecord:withError:contextInfo:"),function(_4d,_4e,_4f,_50,_51,_52){
with(_4d){
if(_4f==_dataSource){
objj_msgSend(AppController,"notifyUserOfError:withTitle:",_51,"Unable to update metadata");
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("keyPathsForValuesAffectingStatus"),function(_53,_54){
with(_53){
return objj_msgSend(CPSet,"setWithObjects:","content","content.updatedAt");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingFixIncorrectMatchEnabled"),function(_55,_56){
with(_55){
return objj_msgSend(CPSet,"setWithObjects:","content","content.parent","content.personalMedia");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingTitleForChoosePosterMenuItem"),function(_57,_58){
with(_57){
return objj_msgSend(CPSet,"setWithObjects:","content","content.parent");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingEditMetadataEnabled"),function(_59,_5a){
with(_59){
return objj_msgSend(CPSet,"setWithObjects:","content","content.type");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingChooseBannerEnabled"),function(_5b,_5c){
with(_5b){
return objj_msgSend(CPSet,"setWithObjects:","content","content.parent");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingChooseBackgroundArtEnabled"),function(_5d,_5e){
with(_5d){
return objj_msgSend(CPSet,"setWithObjects:","content","content.parent");
}
})]);
p;40;DataSources/MMPosterMetadataDataSource.jt;1203;@STATIC;1.0;i;27;MMImageMetadataDataSource.ji;18;../Models/PMSURL.ji;26;../Models/MMMetadataItem.jt;1098;
objj_executeFile("MMImageMetadataDataSource.j",YES);
objj_executeFile("../Models/PMSURL.j",YES);
objj_executeFile("../Models/MMMetadataItem.j",YES);
var _1=objj_allocateClassPair(MMImageMetadataDataSource,"MMPosterMetadataDataSource"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("selectMetadataImage:forMetadataItem:"),function(_3,_4,_5,_6){
with(_3){
objj_msgSend(_6,"setThumb:",objj_msgSend(_5,"thumb"));
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMPosterMetadataDataSource").super_class},"selectMetadataImage:forMetadataItem:",_5,_6);
}
}),new objj_method(sel_getUid("URLForRecordsWithContextInfo:"),function(_7,_8,_9){
with(_7){
return objj_msgSend(_7,"URLForMetadataItem:withSuffix:",_9,"/posters");
}
}),new objj_method(sel_getUid("URLForUpdatedRecord:contextInfo:"),function(_a,_b,_c,_d){
with(_a){
var _e=_c,_f=_d;
return objj_msgSend(PMSURL,"URLWithPath:params:",objj_msgSend(_a,"URLForMetadataItem:withSuffix:",_f,"/poster"),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_e,"ratingKey"),"url"));
}
})]);
p;39;DataSources/MMImageMetadataDataSource.jt;1445;@STATIC;1.0;i;14;MMDataSource.ji;26;../Models/MMMetadataItem.ji;18;../Models/PMSURL.jt;1353;
objj_executeFile("MMDataSource.j",YES);
objj_executeFile("../Models/MMMetadataItem.j",YES);
objj_executeFile("../Models/PMSURL.j",YES);
var _1=objj_allocateClassPair(MMDataSource,"MMImageMetadataDataSource"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("URLForMetadataItem:withSuffix:"),function(_3,_4,_5,_6){
with(_3){
return objj_msgSend(PMSURL,"URLWithPath:",objj_msgSend(CPString,"stringWithFormat:","/library/metadata/%@%@",objj_msgSend(_5,"id"),_6));
}
}),new objj_method(sel_getUid("selectMetadataImage:forMetadataItem:"),function(_7,_8,_9,_a){
with(_7){
objj_msgSend(_7,"updateRecord:contextInfo:",_9,_a);
}
}),new objj_method(sel_getUid("HTTPBodyForUpdatedRecord:contextInfo:"),function(_b,_c,_d,_e){
with(_b){
return null;
}
}),new objj_method(sel_getUid("shouldProcessNode:contextInfo:"),function(_f,_10,_11,_12){
with(_f){
return String(_11.nodeName)=="Photo";
}
}),new objj_method(sel_getUid("shouldSelectRecord:element:contextInfo:"),function(_13,_14,_15,_16,_17){
with(_13){
return String(_16.getAttribute("selected"))==="1";
}
}),new objj_method(sel_getUid("recordFromElement:contextInfo:"),function(_18,_19,_1a,_1b){
with(_18){
var _1c=objj_msgSend(objj_msgSend(MMMetadataImage,"alloc"),"init");
objj_msgSend(_1c,"setValuesForNodeAttributes:ignoreUndefinedKeys:",_1a,YES);
return _1c;
}
})]);
p;40;DataSources/MMBannerMetadataDataSource.jt;812;@STATIC;1.0;i;27;MMImageMetadataDataSource.ji;18;../Models/PMSURL.jt;739;
objj_executeFile("MMImageMetadataDataSource.j",YES);
objj_executeFile("../Models/PMSURL.j",YES);
var _1=objj_allocateClassPair(MMImageMetadataDataSource,"MMBannerMetadataDataSource"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("URLForRecordsWithContextInfo:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(_3,"URLForMetadataItem:withSuffix:",_5,"/banners");
}
}),new objj_method(sel_getUid("URLForUpdatedRecord:contextInfo:"),function(_6,_7,_8,_9){
with(_6){
var _a=_8,_b=_9;
return objj_msgSend(PMSURL,"URLWithPath:params:",objj_msgSend(_6,"URLForMetadataItem:withSuffix:",_b,"/banner"),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_a,"ratingKey"),"url"));
}
})]);
p;47;DataSources/MMBackgroundArtMetadataDataSource.jt;1519;@STATIC;1.0;i;27;MMImageMetadataDataSource.ji;26;../Models/MMMetadataItem.ji;18;../Models/PMSURL.jt;1414;
objj_executeFile("MMImageMetadataDataSource.j",YES);
objj_executeFile("../Models/MMMetadataItem.j",YES);
objj_executeFile("../Models/PMSURL.j",YES);
var _1=objj_allocateClassPair(MMImageMetadataDataSource,"MMBackgroundArtMetadataDataSource"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("selectMetadataImage:forMetadataItem:"),function(_3,_4,_5,_6){
with(_3){
var _7=objj_msgSend(CPDictionary,"dictionaryFromURLParams:",objj_msgSend(objj_msgSend(_6,"artURL"),"parameterString"));
objj_msgSend(_7,"setObject:forKey:",FLOOR(objj_msgSend(CPDate,"date").getTime()/1000),"t");
objj_msgSend(_6,"setArt:",objj_msgSend(objj_msgSend(PMSURL,"URLWithPath:params:",objj_msgSend(objj_msgSend(_6,"artURL"),"path"),_7),"description"));
objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMBackgroundArtMetadataDataSource").super_class},"selectMetadataImage:forMetadataItem:",_5,_6);
}
}),new objj_method(sel_getUid("URLForRecordsWithContextInfo:"),function(_8,_9,_a){
with(_8){
return objj_msgSend(_8,"URLForMetadataItem:withSuffix:",_a,"/arts");
}
}),new objj_method(sel_getUid("URLForUpdatedRecord:contextInfo:"),function(_b,_c,_d,_e){
with(_b){
var _f=_d,_10=_e;
return objj_msgSend(PMSURL,"URLWithPath:params:",objj_msgSend(_b,"URLForMetadataItem:withSuffix:",_10,"/art"),objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(_f,"ratingKey"),"url"));
}
})]);
p;32;Views/MMMetadataItemDetailView.jt;20389;@STATIC;1.0;I;20;AppKit/CPImageView.jI;15;AppKit/CPMenu.jI;20;AppKit/CPTextField.jI;15;AppKit/CPView.ji;22;../CPDate+Formatting.ji;43;../DataSources/MMPosterMetadataDataSource.ji;41;../DataSources/MMLibraryMediaDataSource.ji;43;../DataSources/MMBannerMetadataDataSource.ji;50;../DataSources/MMBackgroundArtMetadataDataSource.ji;26;../Models/MMMetadataItem.ji;11;HUDButton.ji;24;MMHorizontalScrollView.ji;21;MMTitleAndYearLabel.ji;13;MMImageView.ji;19;MMRatingStarsView.ji;18;MMFlagCollection.jt;19888;
objj_executeFile("AppKit/CPImageView.j",NO);
objj_executeFile("AppKit/CPMenu.j",NO);
objj_executeFile("AppKit/CPTextField.j",NO);
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("../CPDate+Formatting.j",YES);
objj_executeFile("../DataSources/MMPosterMetadataDataSource.j",YES);
objj_executeFile("../DataSources/MMLibraryMediaDataSource.j",YES);
objj_executeFile("../DataSources/MMBannerMetadataDataSource.j",YES);
objj_executeFile("../DataSources/MMBackgroundArtMetadataDataSource.j",YES);
objj_executeFile("../Models/MMMetadataItem.j",YES);
objj_executeFile("HUDButton.j",YES);
objj_executeFile("MMHorizontalScrollView.j",YES);
objj_executeFile("MMTitleAndYearLabel.j",YES);
objj_executeFile("MMImageView.j",YES);
objj_executeFile("MMRatingStarsView.j",YES);
objj_executeFile("MMFlagCollection.j",YES);
var _1=CGSizeMake(512,512);
var _2=CGSizeMake(1280,720);
var _3=objj_allocateClassPair(CPView,"MMMetadataItemDetailView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_delegate"),new objj_ivar("titleAndYearLabel"),new objj_ivar("_taglineField"),new objj_ivar("ratingStars"),new objj_ivar("genreField"),new objj_ivar("_summaryField"),new objj_ivar("_thumbView"),new objj_ivar("_artView"),new objj_ivar("_title"),new objj_ivar("_year"),new objj_ivar("_tagline"),new objj_ivar("_summary"),new objj_ivar("rating"),new objj_ivar("genre"),new objj_ivar("contentRatingFlag"),new objj_ivar("contentRatingFlagImage"),new objj_ivar("studioFlag"),new objj_ivar("studioFlagImage"),new objj_ivar("_thumbImage"),new objj_ivar("_artImage"),new objj_ivar("artOverlay"),new objj_ivar("artOverlayView"),new objj_ivar("_containerView"),new objj_ivar("_childrenCollectionView"),new objj_ivar("_childrenController"),new objj_ivar("scrollView")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("delegate"),function(_5,_6){
with(_5){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_7,_8,_9){
with(_7){
_delegate=_9;
}
}),new objj_method(sel_getUid("title"),function(_a,_b){
with(_a){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_c,_d,_e){
with(_c){
_title=_e;
}
}),new objj_method(sel_getUid("year"),function(_f,_10){
with(_f){
return _year;
}
}),new objj_method(sel_getUid("setYear:"),function(_11,_12,_13){
with(_11){
_year=_13;
}
}),new objj_method(sel_getUid("tagline"),function(_14,_15){
with(_14){
return _tagline;
}
}),new objj_method(sel_getUid("setTagline:"),function(_16,_17,_18){
with(_16){
_tagline=_18;
}
}),new objj_method(sel_getUid("summary"),function(_19,_1a){
with(_19){
return _summary;
}
}),new objj_method(sel_getUid("setSummary:"),function(_1b,_1c,_1d){
with(_1b){
_summary=_1d;
}
}),new objj_method(sel_getUid("rating"),function(_1e,_1f){
with(_1e){
return rating;
}
}),new objj_method(sel_getUid("setRating:"),function(_20,_21,_22){
with(_20){
rating=_22;
}
}),new objj_method(sel_getUid("genre"),function(_23,_24){
with(_23){
return genre;
}
}),new objj_method(sel_getUid("setGenre:"),function(_25,_26,_27){
with(_25){
genre=_27;
}
}),new objj_method(sel_getUid("contentRatingFlagImage"),function(_28,_29){
with(_28){
return contentRatingFlagImage;
}
}),new objj_method(sel_getUid("setContentRatingFlagImage:"),function(_2a,_2b,_2c){
with(_2a){
contentRatingFlagImage=_2c;
}
}),new objj_method(sel_getUid("studioFlagImage"),function(_2d,_2e){
with(_2d){
return studioFlagImage;
}
}),new objj_method(sel_getUid("setStudioFlagImage:"),function(_2f,_30,_31){
with(_2f){
studioFlagImage=_31;
}
}),new objj_method(sel_getUid("thumbImage"),function(_32,_33){
with(_32){
return _thumbImage;
}
}),new objj_method(sel_getUid("setThumbImage:"),function(_34,_35,_36){
with(_34){
_thumbImage=_36;
}
}),new objj_method(sel_getUid("artImage"),function(_37,_38){
with(_37){
return _artImage;
}
}),new objj_method(sel_getUid("setArtImage:"),function(_39,_3a,_3b){
with(_39){
_artImage=_3b;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_3c,_3d,_3e){
with(_3c){
if(_3c=objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("MMMetadataItemDetailView").super_class},"initWithFrame:",_3e)){
var _3f=20,_40=CGRectMake(0,0,CGRectGetWidth(_3e),CGRectGetHeight(_3e));
objj_msgSend(_3c,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",32.5/255,1));
_artView=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",_40);
objj_msgSend(_artView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_artView,"setImageScaling:",CPScaleToFit);
objj_msgSend(_artView,"setSizeConstraint:",_2);
objj_msgSend(_artView,"bind:toObject:withKeyPath:options:","image",_3c,"artImage",nil);
objj_msgSend(_artView,"addObserver:forKeyPath:options:context:",_3c,"imageRect",CPKeyValueChangeNewKey,nil);
objj_msgSend(_3c,"addSubview:",_artView);
artOverlayView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_40);
objj_msgSend(artOverlayView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_3c,"addSubview:",artOverlayView);
if(CPFeatureIsCompatible(CPHTMLCanvasFeature)){
artOverlay=objj_msgSend(CALayer,"layer");
objj_msgSend(artOverlay,"setDelegate:",_3c);
objj_msgSend(artOverlayView,"setLayer:",artOverlay);
}else{
objj_msgSend(artOverlayView,"setAlphaValue:",0.6);
objj_msgSend(artOverlayView,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
}
_containerView=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_3e),objj_msgSend(_containerView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_3c,"addSubview:",_containerView);
_thumbView=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(_3f,_3f,200,300));
objj_msgSend(_thumbView,"setHasShadow:",YES);
objj_msgSend(_thumbView,"setShadowColor:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",51/255,53/255,56/255,1));
objj_msgSend(_thumbView,"setShadowBlurDistance:",40);
objj_msgSend(_thumbView,"setBorderRadius:",7);
objj_msgSend(_thumbView,"setImageScaling:",CPScaleToFit);
objj_msgSend(_thumbView,"setImageAlignment:",CPImageAlignTop);
objj_msgSend(_thumbView,"setPlaceholder:",objj_msgSend(MMMetadataItem,"blankThumbImage"));
objj_msgSend(_thumbView,"setSizeConstraint:",_1);
objj_msgSend(_thumbView,"addObserver:forKeyPath:options:context:",_3c,"imageRect",CPKeyValueChangeNewKey,nil);
objj_msgSend(_thumbView,"bind:toObject:withKeyPath:options:","image",_3c,"thumbImage",nil);
objj_msgSend(_containerView,"addSubview:",_thumbView);
titleAndYearLabel=objj_msgSend(objj_msgSend(MMTitleAndYearLabel,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(titleAndYearLabel,"sizeToFit");
objj_msgSend(titleAndYearLabel,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(_thumbView,"frame"))+_3f,CGRectGetMinY(objj_msgSend(_thumbView,"frame"))));
objj_msgSend(titleAndYearLabel,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_containerView,"frame"))-_3f-CGRectGetMinX(objj_msgSend(titleAndYearLabel,"frame")),CGRectGetHeight(objj_msgSend(titleAndYearLabel,"frame"))));
objj_msgSend(titleAndYearLabel,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_containerView,"addSubview:",titleAndYearLabel);
var _41=objj_msgSend(objj_msgSend(CPBox,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(titleAndYearLabel,"frame")),CGRectGetMaxY(objj_msgSend(titleAndYearLabel,"frame")),CGRectGetWidth(objj_msgSend(titleAndYearLabel,"frame")),5));
objj_msgSend(_41,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_41,"setBoxType:",CPBoxSeparator);
objj_msgSend(_41,"setBorderColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",140/255,0.5));
objj_msgSend(_containerView,"addSubview:",_41);
_taglineField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_taglineField,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",16));
objj_msgSend(_taglineField,"setStringValue:","Tagline");
objj_msgSend(_taglineField,"sizeToFit");
objj_msgSend(_taglineField,"bind:toObject:withKeyPath:options:",CPValueBinding,_3c,"tagline",nil);
objj_msgSend(_taglineField,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(titleAndYearLabel,"frame")),CGRectGetMaxY(objj_msgSend(_41,"frame")),CGRectGetMaxX(objj_msgSend(_41,"frame"))-CGRectGetMinX(objj_msgSend(_41,"frame")),CGRectGetHeight(objj_msgSend(_taglineField,"frame"))));
objj_msgSend(_taglineField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_taglineField,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_containerView,"addSubview:",_taglineField);
ratingStars=objj_msgSend(objj_msgSend(MMRatingStarsView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(ratingStars,"sizeToFit");
objj_msgSend(ratingStars,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(_41,"frame"))-CGRectGetWidth(objj_msgSend(ratingStars,"frame")),CGRectGetMidY(objj_msgSend(titleAndYearLabel,"frame"))-CGRectGetHeight(objj_msgSend(ratingStars,"frame"))/2));
objj_msgSend(ratingStars,"setAutoresizingMask:",CPViewMinXMargin);
objj_msgSend(ratingStars,"setMaxRating:",10);
objj_msgSend(ratingStars,"bind:toObject:withKeyPath:options:","rating",_3c,"rating",nil);
objj_msgSend(ratingStars,"bind:toObject:withKeyPath:options:","hidden",_3c,"rating",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPIsNilTransformerName,CPValueTransformerNameBindingOption));
objj_msgSend(_containerView,"addSubview:",ratingStars);
objj_msgSend(titleAndYearLabel,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(titleAndYearLabel,"frame"))-CGRectGetWidth(objj_msgSend(ratingStars,"frame"))-10,CGRectGetHeight(objj_msgSend(titleAndYearLabel,"frame"))));
genreField=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(genreField,"setFont:",objj_msgSend(_taglineField,"font"));
objj_msgSend(genreField,"setFrame:",objj_msgSend(_taglineField,"frame"));
objj_msgSend(genreField,"setAlignment:",CPRightTextAlignment);
objj_msgSend(genreField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(genreField,"bind:toObject:withKeyPath:options:",CPValueBinding,_3c,"genre",nil);
objj_msgSend(_containerView,"addSubview:",genreField);
_summaryField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_taglineField,"frame")),CGRectGetMaxY(objj_msgSend(_taglineField,"frame"))+4,CGRectGetMaxX(_40)-_3f-CGRectGetMinX(objj_msgSend(_taglineField,"frame")),CGRectGetMaxY(_40)-_3f-CGRectGetMaxY(objj_msgSend(_taglineField,"frame"))));
objj_msgSend(_summaryField,"bind:toObject:withKeyPath:options:",CPValueBinding,_3c,"summary",nil);
objj_msgSend(_summaryField,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_summaryField,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_containerView,"addSubview:",_summaryField);
contentRatingAndStudioFlags=objj_msgSend(objj_msgSend(MMFlagCollection,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_thumbView,"frame")),CGRectGetMaxY(objj_msgSend(_thumbView,"frame")),CGRectGetWidth(objj_msgSend(_thumbView,"frame")),38));
objj_msgSend(contentRatingAndStudioFlags,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(contentRatingAndStudioFlags,"setSpacing:",20);
objj_msgSend(_containerView,"addSubview:",contentRatingAndStudioFlags);
objj_msgSend(_3c,"refreshFlags");
var _42=208;
_childrenCollectionView=objj_msgSend(objj_msgSend(MMCollectionView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_childrenCollectionView,"setDelegate:",_3c);
scrollView=objj_msgSend(objj_msgSend(MMHorizontalScrollView,"alloc"),"initWithFrame:",CGRectMake(0,CGRectGetHeight(objj_msgSend(_3c,"frame"))-_42,CGRectGetWidth(objj_msgSend(_3c,"frame")),_42));
objj_msgSend(objj_msgSend(scrollView,"contentView"),"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",1,0));
objj_msgSend(scrollView,"setAutoresizingMask:",CPViewWidthSizable|CPViewMinYMargin);
objj_msgSend(scrollView,"setDocumentView:",_childrenCollectionView);
objj_msgSend(_containerView,"addSubview:",scrollView);
}
return _3c;
}
}),new objj_method(sel_getUid("setTitle:"),function(_43,_44,_45){
with(_43){
_title=_45;
objj_msgSend(titleAndYearLabel,"setTitle:",_45);
}
}),new objj_method(sel_getUid("setTagline:"),function(_46,_47,_48){
with(_46){
_tagline=_48;
objj_msgSend(_46,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setGenre:"),function(_49,_4a,_4b){
with(_49){
genre=_4b;
objj_msgSend(_49,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setYear:"),function(_4c,_4d,_4e){
with(_4c){
_year=_4e;
objj_msgSend(titleAndYearLabel,"setYear:",_4e);
}
}),new objj_method(sel_getUid("setThumbImage:"),function(_4f,_50,_51){
with(_4f){
if(objj_msgSend(_thumbImage,"filename")===objj_msgSend(_51,"filename")){
return;
}
_thumbImage=_51;
objj_msgSend(_4f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setArtImage:"),function(_52,_53,_54){
with(_52){
if(objj_msgSend(_artImage,"filename")===objj_msgSend(_54,"filename")){
return;
}
_artImage=_54;
objj_msgSend(_52,"setNeedsLayout");
}
}),new objj_method(sel_getUid("contentHidden"),function(_55,_56){
with(_55){
return objj_msgSend(_containerView,"isHidden");
}
}),new objj_method(sel_getUid("setContentHidden:"),function(_57,_58,_59){
with(_57){
objj_msgSend(_containerView,"setHidden:",_59);
}
}),new objj_method(sel_getUid("backgroundHidden"),function(_5a,_5b){
with(_5a){
return objj_msgSend(artOverlayView,"isHidden");
}
}),new objj_method(sel_getUid("setBackgroundHidden:"),function(_5c,_5d,_5e){
with(_5c){
objj_msgSend(artOverlayView,"setHidden:",_5e);
}
}),new objj_method(sel_getUid("drawLayer:inContext:"),function(_5f,_60,_61,_62){
with(_5f){
if(objj_msgSend(_5f,"backgroundHidden")){
return;
}
var _63=5,_64=objj_msgSend(_5f,"bounds");
CGContextBeginPath(_62);
CGContextSetFillColor(_62,objj_msgSend(CPColor,"colorWithCalibratedWhite:alpha:",1,0.6));
CGContextMoveToPoint(_62,CGRectGetMinX(_64),CGRectGetMinY(_64));
CGContextAddLineToPoint(_62,CGRectGetMaxX(_64),CGRectGetMinY(_64));
CGContextAddLineToPoint(_62,CGRectGetMaxX(_64),CGRectGetMaxY(_64));
CGContextAddLineToPoint(_62,CGRectGetMinX(_64),CGRectGetMaxY(_64));
CGContextAddLineToPoint(_62,CGRectGetMinX(_64),CGRectGetMinY(_64));
CGContextClosePath(_62);
CGContextFillPath(_62);
var _65;
var _66;
var _67=2;
var _68=[0,0.5];
var _69=[237/255,237/255,237/255,0,237/255,237/255,237/255,1];
_66=CGColorSpaceCreateDeviceRGB();
_65=CGGradientCreateWithColorComponents(_66,_69,_68,_67);
var _6a=CGPointMake(0,CGRectGetMidY(_64)),_6b=CGPointMake(1,CGRectGetMaxY(_64));
CGContextClip(_62);
CGContextDrawLinearGradient(_62,_65,_6a,_6b,0);
}
}),new objj_method(sel_getUid("setContentRatingFlagImage:"),function(_6c,_6d,_6e){
with(_6c){
if(objj_msgSend(objj_msgSend(_6e,"filename"),"isEqual:",objj_msgSend(contentRatingFlagImage,"filename"))){
return;
}
contentRatingFlagImage=_6e;
objj_msgSend(_6c,"refreshFlags");
}
}),new objj_method(sel_getUid("setStudioFlagImage:"),function(_6f,_70,_71){
with(_6f){
if(objj_msgSend(objj_msgSend(_71,"filename"),"isEqual:",objj_msgSend(studioFlagImage,"filename"))){
return;
}
studioFlagImage=_71;
objj_msgSend(_6f,"refreshFlags");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_72,_73){
with(_72){
objj_msgSend(_72,"layoutArtView");
objj_msgSend(_72,"layoutThumbView");
objj_msgSend(_72,"layoutTitles");
objj_msgSendSuper({receiver:_72,super_class:objj_getClass("MMMetadataItemDetailView").super_class},"layoutSubviews");
}
}),new objj_method(sel_getUid("refreshFlags"),function(_74,_75){
with(_74){
objj_msgSend(contentRatingAndStudioFlags,"removeAllFlags");
objj_msgSend(contentRatingAndStudioFlags,"addFlagWithImage:",contentRatingFlagImage);
objj_msgSend(contentRatingAndStudioFlags,"addFlagWithImage:",studioFlagImage);
}
}),new objj_method(sel_getUid("layoutTitles"),function(_76,_77){
with(_76){
var _78=CGRectGetMaxX(objj_msgSend(genreField,"frame"));
objj_msgSend(genreField,"sizeToFit");
objj_msgSend(genreField,"setFrameOrigin:",CGPointMake(_78-CGRectGetWidth(objj_msgSend(genreField,"frame")),CGRectGetMinY(objj_msgSend(genreField,"frame"))));
objj_msgSend(_taglineField,"sizeToFit");
var _79=CGRectGetMinX(objj_msgSend(genreField,"frame"))-CGRectGetMinX(objj_msgSend(_taglineField,"frame"))-10;
if(_79<CGRectGetWidth(objj_msgSend(_taglineField,"frame"))){
objj_msgSend(_taglineField,"setFrameSize:",CGSizeMake(_79,CGRectGetHeight(objj_msgSend(_taglineField,"frame"))));
}
}
}),new objj_method(sel_getUid("layoutArtView"),function(_7a,_7b){
with(_7a){
if(!objj_msgSend(_artView,"image")){
return;
}
var _7c=objj_msgSend(objj_msgSend(_artView,"image"),"size"),_7d=objj_msgSend(_7a,"bounds"),_7e=CGRectGetWidth(_7d),_7f=CGRectGetHeight(_7d);
if(!_7c||(_7c.width==-1&&_7c.height==-1)){
return;
}
var _80=_7c.width/_7c.height,_81=_7e/_7f;
if(_81>_80){
var _82=ROUND(_7c.height*_7e/_7c.width),_83=_82-_7f;
objj_msgSend(_artView,"setFrame:",CGRectMake(0,-ROUND(_83/2),_7e,_82));
}else{
var _84=ROUND(_7c.width*_7f/_7c.height),_85=_84-_7e;
objj_msgSend(_artView,"setFrame:",CGRectMake(-ROUND(_85/2),0,_84,_7f));
}
}
}),new objj_method(sel_getUid("layoutThumbView"),function(_86,_87){
with(_86){
if(!_thumbImage){
return;
}
var _88=objj_msgSend(objj_msgSend(_thumbView,"image"),"size"),_89=CGRectGetWidth(objj_msgSend(_thumbView,"bounds")),_8a=_88.height*_89/_88.width;
if(CGSizeEqualToSize(_88,CPImageUnspecifiedSize)){
return;
}
objj_msgSend(_thumbView,"setFrameSize:",CGSizeMake(_89,_8a));
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_8b,_8c,_8d,_8e,_8f,_90){
with(_8b){
if(_8d=="imageRect"&&_8e==_thumbView){
objj_msgSend(_8b,"setNeedsLayout");
}else{
if(_8d=="imageRect"&&_8e==_artView){
objj_msgSend(_8b,"layoutArtView");
}
}
}
}),new objj_method(sel_getUid("setChildItemPrototype:"),function(_91,_92,_93){
with(_91){
objj_msgSend(_childrenCollectionView,"setItemPrototype:",_93);
if(_93){
objj_msgSend(_childrenCollectionView,"setMinItemSize:",objj_msgSend(objj_msgSend(_93,"view"),"frame").size);
objj_msgSend(_childrenCollectionView,"setMaxItemSize:",objj_msgSend(objj_msgSend(_93,"view"),"frame").size);
objj_msgSend(objj_msgSend(scrollView,"leftScrollButton"),"setVerticalMargin:",CGRectGetHeight(objj_msgSend(objj_msgSend(_93,"view"),"frame"))/3);
objj_msgSend(objj_msgSend(scrollView,"rightScrollButton"),"setVerticalMargin:",CGRectGetHeight(objj_msgSend(objj_msgSend(_93,"view"),"frame"))/3);
}
}
}),new objj_method(sel_getUid("setChildrenController:"),function(_94,_95,_96){
with(_94){
if(_96){
objj_msgSend(_94,"bind:toObject:withKeyPath:options:","content",_96,"arrangedObjects",nil);
if(!_childrenController){
objj_msgSend(_summaryField,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_summaryField,"frame")),CGRectGetHeight(objj_msgSend(_summaryField,"frame"))-CGRectGetHeight(objj_msgSend(_childrenCollectionView,"frame"))));
}
}else{
objj_msgSend(_childrenCollectionView,"unbind:","content");
if(_childrenController){
objj_msgSend(_summaryField,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_summaryField,"frame")),CGRectGetHeight(objj_msgSend(_summaryField,"frame"))+CGRectGetHeight(objj_msgSend(_childrenCollectionView,"frame"))));
}
}
_childrenController=_96;
}
}),new objj_method(sel_getUid("setContent:"),function(_97,_98,_99){
with(_97){
objj_msgSend(_childrenCollectionView,"setContent:",_99);
objj_msgSend(_childrenCollectionView,"sizeToFitNumberOfColumns:withHorizontalMargin:",objj_msgSend(_99,"count"),0);
}
}),new objj_method(sel_getUid("collectionView:didDoubleClickOnItemAtIndex:"),function(_9a,_9b,_9c,_9d){
with(_9a){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("metadataItemDetailView:didSelectChild:"))){
objj_msgSend(_delegate,"metadataItemDetailView:didSelectChild:",_9a,objj_msgSend(objj_msgSend(_9c,"content"),"objectAtIndex:",_9d));
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("keyPathsForValuesAffectingContentRatingFlagImage"),function(_9e,_9f){
with(_9e){
return objj_msgSend(CPSet,"setWithObjects:","metadataItem");
}
})]);
p;19;CPDate+Formatting.jt;1508;@STATIC;1.0;t;1489;
var _1=1000,_2=_1,_3=60*_2,_4=_3,_5=60*_4,_6=_5,_7=24*_6,_8=_7;
var _9=objj_msgSend(CPArray,"arrayWithObjects:",CPLocalizedString("Sunday","Sunday"),CPLocalizedString("Monday","Monday"),CPLocalizedString("Tuesday","Tuesday"),CPLocalizedString("Wednesday","Wednesday"),CPLocalizedString("Thursday","Thursday"),CPLocalizedString("Friday","Friday"),CPLocalizedString("Saturday","Saturday"));
var _a=objj_getClass("CPDate");
if(!_a){
throw new SyntaxError("*** Could not find definition for class \"CPDate\"");
}
var _b=_a.isa;
class_addMethods(_a,[new objj_method(sel_getUid("relativeDate"),function(_c,_d){
with(_c){
var _e=new Date(),_f=new Date(_e.getFullYear(),_e.getMonth(),_e.getDate()),_10=new Date(_f.getTime()+_7),_11=new Date(_10.getTime()+_7),_12=new Date(_f.getTime()-_7);
if(_12<=_c&&_c<_f){
return CPLocalizedString("yesterday","yesterday");
}else{
if(_f<=_c&&_c<_10){
return CPLocalizedString("today","today");
}
}
if(_10<=_c&&_c<_11){
return CPLocalizedString("tomorrow","tomorrow");
}
var _13=new Date(_f.getTime()-4*_8);
if(_13<=_c&&_c<_f){
return objj_msgSend(_9,"objectAtIndex:",_c.getDay());
}
return _c.toLocaleDateString();
}
}),new objj_method(sel_getUid("shortLocalTime"),function(_14,_15){
with(_14){
var _16=_14.getHours();
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("%d:%02d %@","ShortLocalTimeFormat"),(_16%12)==0?12:(_16%12),_14.getMinutes(),_16>11?CPLocalizedString("PM","PostMeridiem"):CPLocalizedString("AM","AnteMeridiem"));
}
})]);
p;27;Views/MMTitleAndYearLabel.jt;3153;@STATIC;1.0;I;15;AppKit/CPView.jt;3114;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"MMTitleAndYearLabel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("titleLabel"),new objj_ivar("yearLabel"),new objj_ivar("title"),new objj_ivar("year")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("title"),function(_3,_4){
with(_3){
return title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_5,_6,_7){
with(_5){
title=_7;
}
}),new objj_method(sel_getUid("year"),function(_8,_9){
with(_8){
return year;
}
}),new objj_method(sel_getUid("setYear:"),function(_a,_b,_c){
with(_a){
year=_c;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
if(_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("MMTitleAndYearLabel").super_class},"initWithFrame:",_f)){
titleLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(titleLabel,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",40));
objj_msgSend(titleLabel,"sizeToFit");
objj_msgSend(titleLabel,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_d,"addSubview:",titleLabel);
yearLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(yearLabel,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",20));
objj_msgSend(yearLabel,"sizeToFit");
objj_msgSend(_d,"addSubview:",yearLabel);
}
return _d;
}
}),new objj_method(sel_getUid("setTitle:"),function(_10,_11,_12){
with(_10){
title=_12;
objj_msgSend(titleLabel,"setStringValue:",title);
objj_msgSend(_10,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setYear:"),function(_13,_14,_15){
with(_13){
year=_15;
objj_msgSend(yearLabel,"setStringValue:",year?objj_msgSend(CPString,"stringWithFormat:","(%@)",year):"");
objj_msgSend(_13,"setNeedsLayout");
}
}),new objj_method(sel_getUid("sizeToFit"),function(_16,_17){
with(_16){
objj_msgSend(titleLabel,"sizeToFit");
objj_msgSend(yearLabel,"sizeToFit");
objj_msgSend(_16,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(titleLabel,"frame"))+CGRectGetWidth(objj_msgSend(yearLabel,"frame")),MAX(CGRectGetMaxY(objj_msgSend(titleLabel,"frame")),CGRectGetMaxY(objj_msgSend(yearLabel,"frame")))));
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_18,_19){
with(_18){
objj_msgSendSuper({receiver:_18,super_class:objj_getClass("MMTitleAndYearLabel").super_class},"layoutSubviews");
objj_msgSend(titleLabel,"sizeToFit");
objj_msgSend(yearLabel,"sizeToFit");
var _1a=CGRectGetWidth(objj_msgSend(_18,"frame"))-CGRectGetWidth(objj_msgSend(yearLabel,"frame"));
if(CGRectGetWidth(objj_msgSend(titleLabel,"frame"))>_1a){
objj_msgSend(titleLabel,"setFrameSize:",CGSizeMake(_1a,CGRectGetHeight(objj_msgSend(titleLabel,"frame"))));
}
objj_msgSend(titleLabel,"setFrameOrigin:",CGPointMake(0,(CGRectGetHeight(objj_msgSend(_18,"frame"))-CGRectGetHeight(objj_msgSend(titleLabel,"frame")))/2));
objj_msgSend(yearLabel,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(titleLabel,"frame"))+4,(CGRectGetHeight(objj_msgSend(_18,"frame"))-CGRectGetHeight(objj_msgSend(yearLabel,"frame")))*0.667));
}
})]);
p;25;Views/MMRatingStarsView.jt;3731;@STATIC;1.0;I;15;AppKit/CPView.ji;13;MMImageView.jt;3674;
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("MMImageView.j",YES);
var _1=5;
var _2=CGSizeMake(17,16);
var _3=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","star-full.png"),_2);
var _4=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","star-empty.png"),_2);
var _5=objj_allocateClassPair(CPView,"MMRatingStarsView"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("rating"),new objj_ivar("maxRating"),new objj_ivar("stars"),new objj_ivar("emptyStarContainer"),new objj_ivar("fullStarContainer")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("rating"),function(_7,_8){
with(_7){
return rating;
}
}),new objj_method(sel_getUid("setRating:"),function(_9,_a,_b){
with(_9){
rating=_b;
}
}),new objj_method(sel_getUid("maxRating"),function(_c,_d){
with(_c){
return maxRating;
}
}),new objj_method(sel_getUid("setMaxRating:"),function(_e,_f,_10){
with(_e){
maxRating=_10;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_11,_12,_13){
with(_11){
if(_11=objj_msgSendSuper({receiver:_11,super_class:objj_getClass("MMRatingStarsView").super_class},"initWithFrame:",_13)){
stars=objj_msgSend(CPMutableArray,"array");
emptyStarContainer=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_13);
objj_msgSend(emptyStarContainer,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_11,"addSubview:",emptyStarContainer);
for(var i=0;i<_1;i++){
var _14=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(0,0,_2.width,_2.height));
objj_msgSend(_14,"setImage:",_4);
objj_msgSend(stars,"addObject:",_14);
objj_msgSend(emptyStarContainer,"addSubview:",_14);
}
fullStarContainer=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",_13);
objj_msgSend(fullStarContainer,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_11,"addSubview:",fullStarContainer);
for(var i=0;i<_1;i++){
var _15=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(0,0,_2.width,_2.height));
objj_msgSend(_15,"setImage:",_3);
objj_msgSend(stars,"addObject:",_15);
objj_msgSend(fullStarContainer,"addSubview:",_15);
}
maxRating=1;
rating=1;
}
return _11;
}
}),new objj_method(sel_getUid("setRating:"),function(_16,_17,_18){
with(_16){
rating=_18;
objj_msgSend(_16,"synchronize");
}
}),new objj_method(sel_getUid("setMaxRating:"),function(_19,_1a,_1b){
with(_19){
maxRating=_1b;
objj_msgSend(_19,"synchronize");
}
}),new objj_method(sel_getUid("synchronize"),function(_1c,_1d){
with(_1c){
objj_msgSend(fullStarContainer,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_1c,"frame"))*(rating/maxRating),CGRectGetHeight(objj_msgSend(fullStarContainer,"frame"))));
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_1e,_1f){
with(_1e){
objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("MMRatingStarsView").super_class},"layoutSubviews");
for(var i=0;i<_1;i++){
var _20=objj_msgSend(_1e,"frameForStarAtIndex:",i);
objj_msgSend(objj_msgSend(stars,"objectAtIndex:",i),"setFrame:",_20);
objj_msgSend(objj_msgSend(stars,"objectAtIndex:",i+_1),"setFrame:",_20);
}
}
}),new objj_method(sel_getUid("frameForStarAtIndex:"),function(_21,_22,_23){
with(_21){
var _24=MAX((CGRectGetWidth(objj_msgSend(_21,"frame"))-(_1*_2.width))/(_1-1));
return CGRectMake(_2.width*_23+MAX(0,_24*(_23-1)),0,_2.width,_2.height);
}
}),new objj_method(sel_getUid("sizeToFit"),function(_25,_26){
with(_25){
objj_msgSend(_25,"setFrameSize:",CGSizeMake(_1*_2.width,_2.height));
}
})]);
p;19;Views/MMAlbumCell.jt;1800;@STATIC;1.0;i;26;MMCollectionViewItemCell.jt;1750;
objj_executeFile("MMCollectionViewItemCell.j",YES);
var _1=CGSizeMake(128,128);
var _2=objj_allocateClassPair(MMCollectionViewItemCell,"MMAlbumCell"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("loadView"),function(_4,_5){
with(_4){
objj_msgSendSuper({receiver:_4,super_class:objj_getClass("MMAlbumCell").super_class},"loadView");
_thumbSize=_1;
_thumbMargin=5;
_allowsSelection=NO;
objj_msgSend(_4,"bind:toObject:withKeyPath:options:","image",_4,"representedObject.thumbImage",nil);
objj_msgSend(objj_msgSend(_4,"titleLabel"),"bind:toObject:withKeyPath:options:",CPValueBinding,_4,"representedObject.displayTitle",nil);
objj_msgSend(objj_msgSend(_4,"titleLabel"),"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",14));
objj_msgSend(objj_msgSend(_4,"subtitleLabel"),"bind:toObject:withKeyPath:options:",CPValueBinding,_4,"subtitle",nil);
objj_msgSend(objj_msgSend(_4,"subtitleLabel"),"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
}
}),new objj_method(sel_getUid("_subtitle"),function(_6,_7){
with(_6){
switch(objj_msgSend(objj_msgSend(_6,"representedObject"),"leafCount")){
case 0:
return CPLocalizedString("no tracks","Subtitle for a album thumbnail on an artist detail view");
case 1:
return CPLocalizedString("1 track","Subtitle for a album thumbnail on an artist detail view");
default:
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("%d tracks","Subtitle for a album thumbnail on an artist detail view"),objj_msgSend(objj_msgSend(_6,"representedObject"),"leafCount"));
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("keyPathsForValuesAffectingSubtitle"),function(_8,_9){
with(_8){
return objj_msgSend(CPSet,"setWithObject:","representedObject");
}
})]);
p;20;Views/MMSeasonCell.jt;1811;@STATIC;1.0;i;26;MMCollectionViewItemCell.jt;1761;
objj_executeFile("MMCollectionViewItemCell.j",YES);
var _1=CGSizeMake(128,128);
var _2=objj_allocateClassPair(MMCollectionViewItemCell,"MMSeasonCell"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("loadView"),function(_4,_5){
with(_4){
objj_msgSendSuper({receiver:_4,super_class:objj_getClass("MMSeasonCell").super_class},"loadView");
_thumbSize=_1;
_thumbMargin=5;
_allowsSelection=NO;
objj_msgSend(_4,"bind:toObject:withKeyPath:options:","image",_4,"representedObject.thumbImage",nil);
objj_msgSend(objj_msgSend(_4,"titleLabel"),"bind:toObject:withKeyPath:options:",CPValueBinding,_4,"representedObject.displayTitle",nil);
objj_msgSend(objj_msgSend(_4,"titleLabel"),"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",14));
objj_msgSend(objj_msgSend(_4,"subtitleLabel"),"bind:toObject:withKeyPath:options:",CPValueBinding,_4,"subtitle",nil);
objj_msgSend(objj_msgSend(_4,"subtitleLabel"),"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",13));
}
}),new objj_method(sel_getUid("_subtitle"),function(_6,_7){
with(_6){
switch(objj_msgSend(objj_msgSend(_6,"representedObject"),"leafCount")){
case 0:
return CPLocalizedString("no episodes","Subtitle for a season thumbnail on a TV Show detail view");
case 1:
return CPLocalizedString("1 episode","Subtitle for a season thumbnail on a TV Show detail view");
default:
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("%d episodes","Subtitle for a season thumbnail on a TV Show detail view"),objj_msgSend(objj_msgSend(_6,"representedObject"),"leafCount"));
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("keyPathsForValuesAffectingSubtitle"),function(_8,_9){
with(_8){
return objj_msgSend(CPSet,"setWithObject:","representedObject");
}
})]);
p;25;Views/MMAlbumDetailView.jt;10011;@STATIC;1.0;I;15;AppKit/CPView.ji;13;MMImageView.ji;21;MMTitleAndYearLabel.ji;25;../Models/MMAudioPlayer.ji;40;../Controllers/MMAudioPlayerController.jt;9853;
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("MMImageView.j",YES);
objj_executeFile("MMTitleAndYearLabel.j",YES);
objj_executeFile("../Models/MMAudioPlayer.j",YES);
objj_executeFile("../Controllers/MMAudioPlayerController.j",YES);
var _1=CGSizeMake(512,512);
var _2=objj_allocateClassPair(CPView,"MMAlbumDetailView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("titleAndYearLabel"),new objj_ivar("_summaryLabel"),new objj_ivar("_thumbView"),new objj_ivar("_trackTableView"),new objj_ivar("_trackTitleColumn"),new objj_ivar("_title"),new objj_ivar("_year"),new objj_ivar("_summary"),new objj_ivar("_thumbImage"),new objj_ivar("_tracksController")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("title"),function(_4,_5){
with(_4){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_6,_7,_8){
with(_6){
_title=_8;
}
}),new objj_method(sel_getUid("year"),function(_9,_a){
with(_9){
return _year;
}
}),new objj_method(sel_getUid("setYear:"),function(_b,_c,_d){
with(_b){
_year=_d;
}
}),new objj_method(sel_getUid("summary"),function(_e,_f){
with(_e){
return _summary;
}
}),new objj_method(sel_getUid("setSummary:"),function(_10,_11,_12){
with(_10){
_summary=_12;
}
}),new objj_method(sel_getUid("thumbImage"),function(_13,_14){
with(_13){
return _thumbImage;
}
}),new objj_method(sel_getUid("setThumbImage:"),function(_15,_16,_17){
with(_15){
_thumbImage=_17;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_18,_19,_1a){
with(_18){
if(_18=objj_msgSendSuper({receiver:_18,super_class:objj_getClass("MMAlbumDetailView").super_class},"initWithFrame:",_1a)){
var _1b=20;
_tracksController=objj_msgSend(objj_msgSend(CPArrayController,"alloc"),"init");
audioPlayerController=objj_msgSend(objj_msgSend(MMAudioPlayerController,"alloc"),"init");
_thumbView=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(_1b,_1b,200,200));
objj_msgSend(_thumbView,"setHasShadow:",YES);
objj_msgSend(_thumbView,"setShadowColor:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",51/255,53/255,56/255,1));
objj_msgSend(_thumbView,"setShadowBlurDistance:",40);
objj_msgSend(_thumbView,"setBorderRadius:",7);
objj_msgSend(_thumbView,"setImageScaling:",CPScaleToFit);
objj_msgSend(_thumbView,"setImageAlignment:",CPImageAlignTop);
objj_msgSend(_thumbView,"setPlaceholder:",objj_msgSend(MMMetadataItem,"blankThumbImage"));
objj_msgSend(_thumbView,"setSizeConstraint:",_1);
objj_msgSend(_thumbView,"addObserver:forKeyPath:options:context:",_18,"imageRect",CPKeyValueChangeNewKey,nil);
objj_msgSend(_thumbView,"bind:toObject:withKeyPath:options:","image",_18,"thumbImage",nil);
objj_msgSend(_18,"addSubview:",_thumbView);
titleAndYearLabel=objj_msgSend(objj_msgSend(MMTitleAndYearLabel,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(titleAndYearLabel,"sizeToFit");
objj_msgSend(titleAndYearLabel,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(_thumbView,"frame"))+_1b,CGRectGetMinY(objj_msgSend(_thumbView,"frame"))));
objj_msgSend(_18,"addSubview:",titleAndYearLabel);
_summaryLabel=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(titleAndYearLabel,"frame")),CGRectGetMaxY(objj_msgSend(titleAndYearLabel,"frame")),CGRectGetWidth(_1a)-CGRectGetMinX(objj_msgSend(titleAndYearLabel,"frame"))-_1b,CGRectGetHeight(_1a)-CGRectGetMaxY(objj_msgSend(titleAndYearLabel,"frame"))-_1b*2));
objj_msgSend(_summaryLabel,"bind:toObject:withKeyPath:options:",CPValueBinding,_18,"summary",nil);
objj_msgSend(_summaryLabel,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_summaryLabel,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_18,"addSubview:",_summaryLabel);
_trackTableView=objj_msgSend(objj_msgSend(MMTrackTableView,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_thumbView,"frame")),CGRectGetMaxY(objj_msgSend(_thumbView,"frame")),CGRectGetWidth(objj_msgSend(_thumbView,"frame")),CGRectGetHeight(_1a)-CGRectGetMaxY(objj_msgSend(_thumbView,"frame"))-_1b));
objj_msgSend(_trackTableView,"setDelegate:",_18);
objj_msgSend(_trackTableView,"setDoubleAction:",sel_getUid("tableViewRowWasDoubleClicked:"));
objj_msgSend(_trackTableView,"setAutoresizingMask:",CPViewHeightSizable|CPViewMaxYMargin);
objj_msgSend(_trackTableView,"bind:toObject:withKeyPath:options:","content",_tracksController,"arrangedObjects",nil);
var _1c=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","index");
objj_msgSend(_1c,"setWidth:",25);
var _1d=objj_msgSend(_1c,"dataView");
objj_msgSend(_1d,"setAlignment:",CPRightTextAlignment);
objj_msgSend(_1c,"setDataView:",_1d);
objj_msgSend(_1c,"bind:toObject:withKeyPath:options:",CPValueBinding,_tracksController,"arrangedObjects.index",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(objj_msgSend(MMAlbumIndexTransformer,"alloc"),"init"),CPValueTransformerBindingOption));
objj_msgSend(_trackTableView,"addTableColumn:",_1c);
_trackTitleColumn=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","title");
objj_msgSend(_trackTitleColumn,"setWidth:",CGRectGetWidth(objj_msgSend(_trackTableView,"frame"))-75);
var _1e=objj_msgSend(_trackTitleColumn,"dataView");
objj_msgSend(_1e,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_trackTitleColumn,"setDataView:",_1e);
objj_msgSend(_trackTitleColumn,"bind:toObject:withKeyPath:options:",CPValueBinding,_tracksController,"arrangedObjects.displayTitle",nil);
objj_msgSend(_trackTableView,"addTableColumn:",_trackTitleColumn);
var _1f=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","duration");
objj_msgSend(_1f,"setWidth:",50);
var _20=objj_msgSend(_1f,"dataView");
objj_msgSend(_20,"setAlignment:",CPRightTextAlignment);
objj_msgSend(_1f,"setDataView:",_20);
objj_msgSend(_1f,"bind:toObject:withKeyPath:options:",CPValueBinding,_tracksController,"arrangedObjects.duration",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",objj_msgSend(objj_msgSend(MMAlbumDurationTransformer,"alloc"),"init"),CPValueTransformerBindingOption));
objj_msgSend(_trackTableView,"addTableColumn:",_1f);
objj_msgSend(_18,"addSubview:",_trackTableView);
}
return _18;
}
}),new objj_method(sel_getUid("tracks"),function(_21,_22){
with(_21){
return objj_msgSend(_tracksController,"content");
}
}),new objj_method(sel_getUid("setTracks:"),function(_23,_24,_25){
with(_23){
objj_msgSend(_tracksController,"setContent:",_25);
}
}),new objj_method(sel_getUid("setTitle:"),function(_26,_27,_28){
with(_26){
_title=_28;
objj_msgSend(titleAndYearLabel,"setTitle:",_title);
}
}),new objj_method(sel_getUid("setYear:"),function(_29,_2a,_2b){
with(_29){
_year=_2b;
objj_msgSend(titleAndYearLabel,"setYear:",_year);
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_2c,_2d,_2e,_2f,_30,_31){
with(_2c){
if(_2e=="imageRect"&&_2f==_thumbView){
objj_msgSend(_2c,"setNeedsLayout");
}
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_32,_33){
with(_32){
objj_msgSendSuper({receiver:_32,super_class:objj_getClass("MMAlbumDetailView").super_class},"layoutSubviews");
objj_msgSend(titleAndYearLabel,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_32,"frame"))-20-CGRectGetMinX(objj_msgSend(titleAndYearLabel,"frame")),CGRectGetHeight(objj_msgSend(titleAndYearLabel,"frame"))));
objj_msgSend(_trackTableView,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_thumbView,"frame")),CGRectGetHeight(objj_msgSend(_trackTableView,"frame"))));
var _34=CGRectGetWidth(objj_msgSend(_trackTableView,"frame")),_35=objj_msgSend(_trackTableView,"tableColumns");
for(var i=0,_36=objj_msgSend(_35,"count");i<_36;i++){
var _37=_35[i];
if(_37!=_trackTitleColumn){
_34-=objj_msgSend(_37,"width");
}
}
_34-=(objj_msgSend(_35,"count")-1)*objj_msgSend(_trackTableView,"intercellSpacing").width+1;
objj_msgSend(_trackTitleColumn,"setWidth:",_34);
}
}),new objj_method(sel_getUid("tableView:shouldSelectRow:"),function(_38,_39,_3a,_3b){
with(_38){
return NO;
}
}),new objj_method(sel_getUid("tableViewRowWasDoubleClicked:"),function(_3c,_3d,_3e){
with(_3c){
var _3f=objj_msgSend(MMAudioPlayerController,"sharedAudioPlayerController"),_40=objj_msgSend(objj_msgSend(MMPlaylist,"alloc"),"init");
objj_msgSend(_3f,"pause");
objj_msgSend(_40,"setTracks:",objj_msgSend(_tracksController,"arrangedObjects"));
objj_msgSend(_40,"setCurrentTrackIndex:",objj_msgSend(_3e,"clickedRow"));
objj_msgSend(_3f,"setPlaylist:",_40);
objj_msgSend(_3f,"play");
}
})]);
var _2=objj_allocateClassPair(CPValueTransformer,"MMAlbumIndexTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("transformedValue:"),function(_41,_42,_43){
with(_41){
return objj_msgSend(CPString,"stringWithFormat:","%d.",_43);
}
})]);
var _2=objj_allocateClassPair(CPValueTransformer,"MMAlbumDurationTransformer"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("transformedValue:"),function(_44,_45,_46){
with(_44){
if(objj_msgSend(_46,"isKindOfClass:",CPArray)){
_46=objj_msgSend(_46,"count")?objj_msgSend(_46,"objectAtIndex:",0):nil;
}
return objj_msgSend((_46/1000),"timeString");
}
})]);
var _2=objj_allocateClassPair(CPTableView,"MMTrackTableView"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_47,_48,_49){
with(_47){
if(_47=objj_msgSendSuper({receiver:_47,super_class:objj_getClass("MMTrackTableView").super_class},"initWithFrame:",_49)){
objj_msgSend(_47,"setSelectionHighlightStyle:",CPTableViewSelectionHighlightStyleNone);
objj_msgSend(_47,"setBackgroundColor:",nil);
}
return _47;
}
}),new objj_method(sel_getUid("isOpaque"),function(_4a,_4b){
with(_4a){
return NO;
}
}),new objj_method(sel_getUid("drawBackgroundInClipRect:"),function(_4c,_4d,_4e){
with(_4c){
}
})]);
p;22;Models/MMAudioPlayer.jt;3082;@STATIC;1.0;I;21;Foundation/CPObject.ji;8;PMSURL.ji;13;MMMediaItem.jt;3007;
objj_executeFile("Foundation/CPObject.j",NO);
MMAudioPlayerDidFinishPlayingTrack="MMAudioPlayerDidFinishPlayingTrack";
objj_executeFile("PMSURL.j",YES);
objj_executeFile("MMMediaItem.j",YES);
var _1;
var _2=objj_allocateClassPair(CPObject,"MMAudioPlayer"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("track"),new objj_ivar("nativeAudio"),new objj_ivar("playing")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("track"),function(_4,_5){
with(_4){
return track;
}
}),new objj_method(sel_getUid("setTrack:"),function(_6,_7,_8){
with(_6){
track=_8;
}
}),new objj_method(sel_getUid("isPlaying"),function(_9,_a){
with(_9){
return playing;
}
}),new objj_method(sel_getUid("init"),function(_b,_c){
with(_b){
if(_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("MMAudioPlayer").super_class},"init")){
if(window.Audio){
nativeAudio=new Audio();
fEnded=function(){
objj_msgSend(objj_msgSend(CPRunLoop,"mainRunLoop"),"performSelector:target:argument:order:modes:",sel_getUid("nativeAudioDidEndPlayback"),_b,nil,0,[CPDefaultRunLoopMode]);
};
if(nativeAudio.addEventListener){
nativeAudio.addEventListener("ended",fEnded,NO);
}else{
if(_DOMElement.attachEvent){
nativeAudio.attachEvent("onended",fEnded);
}
}
}
}
return _b;
}
}),new objj_method(sel_getUid("play"),function(_d,_e){
with(_d){
objj_msgSend(_d,"willChangeValueForKey:","playing");
nativeAudio.play();
playing=YES;
objj_msgSend(_d,"didChangeValueForKey:","playing");
}
}),new objj_method(sel_getUid("pause"),function(_f,_10){
with(_f){
objj_msgSend(_f,"willChangeValueForKey:","playing");
nativeAudio.pause();
playing=NO;
objj_msgSend(_f,"didChangeValueForKey:","playing");
}
}),new objj_method(sel_getUid("currentTime"),function(_11,_12){
with(_11){
return nativeAudio.currentTime;
}
}),new objj_method(sel_getUid("duration"),function(_13,_14){
with(_13){
return nativeAudio.duration;
}
}),new objj_method(sel_getUid("seekToBeginning"),function(_15,_16){
with(_15){
nativeAudio.currentTime=0;
}
}),new objj_method(sel_getUid("setTrack:"),function(_17,_18,_19){
with(_17){
track=_19;
var _1a=objj_msgSend(_19,"mainMediaItem"),_1b=objj_msgSend(_1a,"mainPart"),_1c=objj_msgSend(_1b,"key");
objj_msgSend(_17,"willChangeValueForKey:","playing");
nativeAudio.src=_1c&&objj_msgSend(objj_msgSend(PMSURL,"URLWithPath:",_1c),"absoluteString");
playing=NO;
objj_msgSend(_17,"didChangeValueForKey:","playing");
}
}),new objj_method(sel_getUid("nativeAudioDidEndPlayback"),function(_1d,_1e){
with(_1d){
objj_msgSend(_1d,"willChangeValueForKey:","playing");
playing=NO;
objj_msgSend(_1d,"didChangeValueForKey:","playing");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:",MMAudioPlayerDidFinishPlayingTrack,_1d,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",track,"track"));
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedAudioPlayer"),function(_1f,_20){
with(_1f){
if(!_1){
_1=objj_msgSend(objj_msgSend(_1f,"alloc"),"init");
}
return _1;
}
})]);
p;37;Controllers/MMAudioPlayerController.jt;3133;@STATIC;1.0;I;21;AppKit/CPController.ji;25;../Models/MMAudioPlayer.ji;22;../Models/MMPlaylist.jt;3031;
objj_executeFile("AppKit/CPController.j",NO);
objj_executeFile("../Models/MMAudioPlayer.j",YES);
objj_executeFile("../Models/MMPlaylist.j",YES);
var _1;
var _2=3;
var _3=objj_allocateClassPair(CPController,"MMAudioPlayerController"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("player"),new objj_ivar("playlist"),new objj_ivar("playing")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("playlist"),function(_5,_6){
with(_5){
return playlist;
}
}),new objj_method(sel_getUid("setPlaylist:"),function(_7,_8,_9){
with(_7){
playlist=_9;
}
}),new objj_method(sel_getUid("isPlaying"),function(_a,_b){
with(_a){
return playing;
}
}),new objj_method(sel_getUid("initWithPlayer:"),function(_c,_d,_e){
with(_c){
if(_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("MMAudioPlayerController").super_class},"init")){
objj_msgSend(_c,"setPlayer:",_e);
}
return _c;
}
}),new objj_method(sel_getUid("init"),function(_f,_10){
with(_f){
return objj_msgSend(_f,"initWithPlayer:",objj_msgSend(MMAudioPlayer,"sharedAudioPlayer"));
}
}),new objj_method(sel_getUid("setPlaylist:"),function(_11,_12,_13){
with(_11){
objj_msgSend(playlist,"removeObserver:forKeyPath:",_11,"currentTrack");
playlist=_13;
objj_msgSend(playlist,"addObserver:forKeyPath:options:context:",_11,"currentTrack",CPKeyValueObservingOptionInitial|CPKeyValueObservingOptionNew,nil);
}
}),new objj_method(sel_getUid("setPlayer:"),function(_14,_15,_16){
with(_14){
if(player){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"removeObserver:name:object:",_14,MMAudioPlayerDidFinishPlayingTrack,player);
}
player=_16;
if(player){
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_14,sel_getUid("audioPlayerDidFinishPlayingTrack:"),MMAudioPlayerDidFinishPlayingTrack,player);
}
}
}),new objj_method(sel_getUid("audioPlayerDidFinishPlayingTrack:"),function(_17,_18,_19){
with(_17){
objj_msgSend(_17,"nextTrack");
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_1a,_1b,_1c,_1d,_1e,_1f){
with(_1a){
if(_1d===playlist&&_1c==="currentTrack"){
var _20=objj_msgSend(playlist,"currentTrack");
objj_msgSend(player,"setTrack:",_20);
if(_20){
objj_msgSend(player,"play");
}
}
}
}),new objj_method(sel_getUid("play"),function(_21,_22){
with(_21){
objj_msgSend(player,"play");
}
}),new objj_method(sel_getUid("pause"),function(_23,_24){
with(_23){
objj_msgSend(player,"pause");
}
}),new objj_method(sel_getUid("nextTrack"),function(_25,_26){
with(_25){
objj_msgSend(playlist,"nextTrack");
}
}),new objj_method(sel_getUid("previousTrack"),function(_27,_28){
with(_27){
if(!objj_msgSend(playlist,"currentTrackIsFirst")&&(objj_msgSend(player,"currentTime")<_2)){
objj_msgSend(playlist,"previousTrack");
}else{
objj_msgSend(player,"seekToBeginning");
}
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedAudioPlayerController"),function(_29,_2a){
with(_29){
if(!_1){
_1=objj_msgSend(objj_msgSend(_29,"alloc"),"init");
}
return _1;
}
})]);
p;19;Models/MMPlaylist.jt;2818;@STATIC;1.0;I;21;Foundation/CPObject.jt;2773;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"MMPlaylist"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("tracks"),new objj_ivar("currentTrackIndex")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("tracks"),function(_3,_4){
with(_3){
return tracks;
}
}),new objj_method(sel_getUid("setTracks:"),function(_5,_6,_7){
with(_5){
tracks=_7;
}
}),new objj_method(sel_getUid("currentTrackIndex"),function(_8,_9){
with(_8){
return currentTrackIndex;
}
}),new objj_method(sel_getUid("setCurrentTrackIndex:"),function(_a,_b,_c){
with(_a){
currentTrackIndex=_c;
}
}),new objj_method(sel_getUid("init"),function(_d,_e){
with(_d){
if(_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("MMPlaylist").super_class},"init")){
tracks=objj_msgSend(CPArray,"array");
}
return _d;
}
}),new objj_method(sel_getUid("setTracks:"),function(_f,_10,_11){
with(_f){
tracks=_11;
objj_msgSend(_f,"setCurrentTrackIndex:",objj_msgSend(tracks,"count")?0:nil);
}
}),new objj_method(sel_getUid("currentTrack"),function(_12,_13){
with(_12){
if(currentTrackIndex==nil||currentTrackIndex==undefined){
return nil;
}
return objj_msgSend(tracks,"objectAtIndex:",currentTrackIndex);
}
}),new objj_method(sel_getUid("currentTrackIsFirst"),function(_14,_15){
with(_14){
return currentTrackIndex===0;
}
}),new objj_method(sel_getUid("currentTrackIsLast"),function(_16,_17){
with(_16){
return objj_msgSend(track,"count")&&(currentTrackIndex===objj_msgSend(track,"count"))||NO;
}
}),new objj_method(sel_getUid("setCurrentTrackIndex:"),function(_18,_19,_1a){
with(_18){
objj_msgSend(_18,"willChangeValueForKey:","currentTrack");
currentTrackIndex=_1a;
objj_msgSend(_18,"didChangeValueForKey:","currentTrack");
}
}),new objj_method(sel_getUid("nextTrack"),function(_1b,_1c){
with(_1b){
objj_msgSend(_1b,"willChangeValueForKey:","currentTrackIndex");
objj_msgSend(_1b,"willChangeValueForKey:","currentTrack");
if(currentTrackIndex===nil){
currentTrackIndex=0;
}else{
if(currentTrackIndex<objj_msgSend(tracks,"count")-1){
currentTrackIndex++;
}else{
currentTrackIndex=nil;
}
}
objj_msgSend(_1b,"didChangeValueForKey:","currentTrack");
objj_msgSend(_1b,"didChangeValueForKey:","currentTrackIndex");
}
}),new objj_method(sel_getUid("previousTrack"),function(_1d,_1e){
with(_1d){
objj_msgSend(_1d,"willChangeValueForKey:","currentTrackIndex");
objj_msgSend(_1d,"willChangeValueForKey:","currentTrack");
if(currentTrackIndex===nil&&objj_msgSend(tracks,"count")){
currentTrackIndex=objj_msgSend(tracks,"count")-1;
}else{
if(currentTrackIndex&&currentTrackIndex>0){
currentTrackIndex--;
}else{
currentTrackIndex=nil;
}
}
objj_msgSend(_1d,"didChangeValueForKey:","currentTrack");
objj_msgSend(_1d,"didChangeValueForKey:","currentTrackIndex");
}
})]);
p;37;Controllers/MMSidebarViewController.jt;18816;@STATIC;1.0;I;25;AppKit/CPViewController.jI;26;AppKit/CPArrayController.jI;22;AppKit/CPOutlineView.ji;28;../Models/MMLibrarySection.ji;44;../DataSources/MMLibrarySectionsDataSource.ji;39;../DataSources/MMCollectionDataSource.ji;39;../Views/MMLibrarySectionTableRowView.ji;35;../Views/MMCollectionTableRowView.ji;24;../Views/MMOutlineView.ji;18;../Models/MMHome.jt;18446;
objj_executeFile("AppKit/CPViewController.j",NO);
objj_executeFile("AppKit/CPArrayController.j",NO);
objj_executeFile("AppKit/CPOutlineView.j",NO);
objj_executeFile("../Models/MMLibrarySection.j",YES);
objj_executeFile("../DataSources/MMLibrarySectionsDataSource.j",YES);
objj_executeFile("../DataSources/MMCollectionDataSource.j",YES);
objj_executeFile("../Views/MMLibrarySectionTableRowView.j",YES);
objj_executeFile("../Views/MMCollectionTableRowView.j",YES);
objj_executeFile("../Views/MMOutlineView.j",YES);
objj_executeFile("../Models/MMHome.j",YES);
var _1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","SidebarIconHome.png"),CGSizeMake(16,16));
var _2=objj_allocateClassPair(CPViewController,"MMSidebarViewController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_delegate"),new objj_ivar("librarySectionDataSource"),new objj_ivar("collectionDataSource"),new objj_ivar("_librarySections"),new objj_ivar("_librarySectionsController"),new objj_ivar("pendingSelection"),new objj_ivar("outlineView"),new objj_ivar("librarySectionsGroupNode"),new objj_ivar("hasLoadedSections"),new objj_ivar("sectionsWithLoadedCollections"),new objj_ivar("selectedObject"),new objj_ivar("desiredPathSelection")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("delegate"),function(_4,_5){
with(_4){
return _delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_6,_7,_8){
with(_6){
_delegate=_8;
}
}),new objj_method(sel_getUid("dataSource"),function(_9,_a){
with(_9){
return librarySectionDataSource;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_b,_c,_d){
with(_b){
librarySectionDataSource=_d;
}
}),new objj_method(sel_getUid("librarySections"),function(_e,_f){
with(_e){
return _librarySections;
}
}),new objj_method(sel_getUid("setLibrarySections:"),function(_10,_11,_12){
with(_10){
_librarySections=_12;
}
}),new objj_method(sel_getUid("librarySectionsController"),function(_13,_14){
with(_13){
return _librarySectionsController;
}
}),new objj_method(sel_getUid("hasLoadedSections"),function(_15,_16){
with(_15){
return hasLoadedSections;
}
}),new objj_method(sel_getUid("sectionsWithLoadedCollections"),function(_17,_18){
with(_17){
return sectionsWithLoadedCollections;
}
}),new objj_method(sel_getUid("selectedObject"),function(_19,_1a){
with(_19){
return selectedObject;
}
}),new objj_method(sel_getUid("setSelectedObject:"),function(_1b,_1c,_1d){
with(_1b){
selectedObject=_1d;
}
}),new objj_method(sel_getUid("initWithDelegate:"),function(_1e,_1f,_20){
with(_1e){
return _1e=objj_msgSend(_1e,"initWithDelegate:dataSource:",_20,objj_msgSend(MMLibrarySectionsDataSource,"sharedDataSource"));
}
}),new objj_method(sel_getUid("initWithDelegate:dataSource:"),function(_21,_22,_23,_24){
with(_21){
if(_21=objj_msgSend(_21,"init")){
objj_msgSend(_21,"setDelegate:",_23);
objj_msgSend(_21,"setDataSource:",_24);
collectionDataSource=objj_msgSend(objj_msgSend(MMCollectionDataSource,"alloc"),"initWithDelegate:",_21);
sectionsWithLoadedCollections=objj_msgSend(CPMutableSet,"set");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_21,sel_getUid("_recordWasUpdated:"),MMDataSourceDidUpdateRecord,nil);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_21,sel_getUid("_recordWasDeleted:"),MMDataSourceDidDeleteRecord,nil);
}
return _21;
}
}),new objj_method(sel_getUid("setDataSource:"),function(_25,_26,_27){
with(_25){
var _28=objj_msgSend(CPNotificationCenter,"defaultCenter");
objj_msgSend(_28,"removeObserver:name:object:",_25,MMDataSourceDidReceiveRecords,librarySectionDataSource);
objj_msgSend(_28,"removeObserver:name:object:",_25,MMDataSourceDidCreateRecord,librarySectionDataSource);
objj_msgSend(_28,"removeObserver:name:object:",_25,MMDataSourceDidDeleteRecord,librarySectionDataSource);
librarySectionDataSource=_27;
objj_msgSend(_28,"addObserver:selector:name:object:",_25,sel_getUid("_dataSourceDidReceiveRecords:"),MMDataSourceDidReceiveRecords,librarySectionDataSource);
objj_msgSend(_28,"addObserver:selector:name:object:",_25,sel_getUid("_dataSourceDidCreateRecord:"),MMDataSourceDidCreateRecord,librarySectionDataSource);
objj_msgSend(_28,"addObserver:selector:name:object:",_25,sel_getUid("_dataSourceDidUpdateRecord:"),MMDataSourceDidUpdateRecord,librarySectionDataSource);
}
}),new objj_method(sel_getUid("selectItemWithPath:"),function(_29,_2a,_2b){
with(_29){
if(objj_msgSend(_2b,"isEqualToString:",objj_msgSend(objj_msgSend(MMHome,"sharedHome"),"path"))){
objj_msgSend(_29,"setSelectedObject:",objj_msgSend(MMHome,"sharedHome"));
return;
}
var _2c=objj_msgSend(MMLibrarySection,"isLibrarySectionPath:",_2b),_2d=objj_msgSend(MMLibrarySection,"recordForPath:",_2b);
if(_2b&&((_2c&&!hasLoadedSections)||(!_2c&&!objj_msgSend(sectionsWithLoadedCollections,"containsObject:",_2d)))){
CPLog.debug("[%@ %@] saving %@ for later",objj_msgSend(_29,"class"),_2a,_2b);
desiredPathSelection=_2b;
return;
}
desiredPathSelection=nil;
var _2e,_2f=objj_msgSend(_librarySectionsController,"arrangedObjects");
if(_2c){
if(objj_msgSend(objj_msgSend(_librarySectionsController,"arrangedObjects"),"containsObject:",_2d)){
_2e=_2d;
}
}else{
if(objj_msgSend(sectionsWithLoadedCollections,"containsObject:",_2d)){
var _30=objj_msgSend(objj_msgSend(_2d,"collections"),"objectEnumerator"),_31;
while(_31=objj_msgSend(_30,"nextObject")){
if(objj_msgSend(objj_msgSend(_31,"path"),"isEqualToString:",_2b)){
_2e=_31;
break;
}
}
if(!_2e){
CPLog.warn("[%@ %@] unable to find collection with path=%@, attempting to use the containing library section instead",objj_msgSend(_29,"class"),_2a,_2b);
objj_msgSend(_29,"selectItemWithPath:",objj_msgSend(_2d,"path"));
return;
}
}
}
if(!_2e&&objj_msgSend(_2f,"count")>0){
if(_2b){
CPLog.warn("[%@ %@] unable to find library section with path=%@, using home screen",objj_msgSend(_29,"class"),_2a,_2b);
}
_2e=objj_msgSend(MMHome,"sharedHome");
}
objj_msgSend(_29,"setSelectedObject:",_2e);
}
}),new objj_method(sel_getUid("_dataSourceDidReceiveRecords:"),function(_32,_33,_34){
with(_32){
var _35=!hasLoadedSections;
objj_msgSend(_32,"willChangeValueForKey:","hasLoadedSections");
hasLoadedSections=YES;
objj_msgSend(_32,"didChangeValueForKey:","hasLoadedSections");
var _36=objj_msgSend(objj_msgSend(_34,"userInfo"),"objectForKey:","records");
if(objj_msgSend(_36,"count")==0){
objj_msgSend(_32,"setSelectedObject:",nil);
}else{
if(objj_msgSend(_36,"isEqualToArray:",objj_msgSend(_librarySectionsController,"arrangedObjects"))){
return;
}
}
for(var i=0,_37=objj_msgSend(_36,"count");i<_37;i++){
objj_msgSend(collectionDataSource,"refreshRecordsWithContextInfo:",objj_msgSend(_36,"objectAtIndex:",i));
}
if(_35||!objj_msgSend(_36,"isEqual:",objj_msgSend(_librarySectionsController,"content"))){
objj_msgSend(_librarySectionsController,"setContent:",_36);
objj_msgSend(outlineView,"reloadData");
objj_msgSend(outlineView,"expandItem:expandChildren:",nil,YES);
}
objj_msgSend(_32,"_attemptToRestoreDesiredPath");
}
}),new objj_method(sel_getUid("_attemptToRestoreDesiredPath"),function(_38,_39){
with(_38){
if(!desiredPathSelection&&!selectedObject){
objj_msgSend(_38,"selectItemWithPath:",nil);
}else{
if(desiredPathSelection){
CPLog.debug("[%@ %@] attempting to restore desired path=%@",objj_msgSend(_38,"class"),_39,desiredPathSelection);
objj_msgSend(_38,"selectItemWithPath:",desiredPathSelection);
}
}
}
}),new objj_method(sel_getUid("_dataSourceDidCreateRecord:"),function(_3a,_3b,_3c){
with(_3a){
var _3d=objj_msgSend(objj_msgSend(_3c,"userInfo"),"objectForKey:","record");
objj_msgSend(_librarySectionsController,"addObject:",_3d);
objj_msgSend(outlineView,"expandItem:expandChildren:",nil,YES);
objj_msgSend(outlineView,"reloadData");
objj_msgSend(_3a,"reloadLibrarySections");
objj_msgSend(_3a,"setSelectedObject:",_3d);
}
}),new objj_method(sel_getUid("_dataSourceDidUpdateRecord:"),function(_3e,_3f,_40){
with(_3e){
objj_msgSend(_3e,"reloadLibrarySections");
}
}),new objj_method(sel_getUid("_recordWasUpdated:"),function(_41,_42,_43){
with(_41){
var _44=objj_msgSend(objj_msgSend(_43,"userInfo"),"objectForKey:","record"),_45=objj_msgSend(_44,"isKindOfClass:",objj_msgSend(MMLibrarySection,"class")),_46=objj_msgSend(_44,"isKindOfClass:",objj_msgSend(PMCBaseObject,"class")),_47=objj_msgSend(objj_msgSend(objj_msgSend(_43,"userInfo"),"objectForKey:","changes"),"containsObject:","collections");
if(_46&&!_45&&_47){
objj_msgSend(collectionDataSource,"refreshRecordsWithContextInfo:",objj_msgSend(_44,"librarySection"));
}
}
}),new objj_method(sel_getUid("_recordWasDeleted:"),function(_48,_49,_4a){
with(_48){
var _4b=objj_msgSend(objj_msgSend(_4a,"userInfo"),"objectForKey:","record");
if(objj_msgSend(_4b,"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"))){
objj_msgSend(_librarySectionsController,"removeObject:",_4b);
objj_msgSend(outlineView,"reloadData");
objj_msgSend(_48,"reloadLibrarySections");
if(_4b!=selectedObject){
return;
}
var _4c=objj_msgSend(outlineView,"selectedRow"),_4d=nil;
if(_4c!=CPNotFound){
_4d=objj_msgSend(outlineView,"itemAtRow:",_4c);
}
objj_msgSend(_48,"setSelectedObject:",_4d);
}else{
if(objj_msgSend(_4b,"isKindOfClass:",objj_msgSend(PMCDirectoryObject,"class"))){
objj_msgSend(objj_msgSend(_librarySectionsController,"arrangedObjects"),"enumerateObjectsUsingBlock:",function(_4e){
objj_msgSend(objj_msgSend(_4e,"collections"),"removeObject:",_4b);
});
objj_msgSend(outlineView,"reloadData");
if(_4b!=selectedObject){
return;
}
var _4c=objj_msgSend(outlineView,"selectedRow"),_4d=nil;
if(_4c!=CPNotFound){
_4d=objj_msgSend(outlineView,"itemAtRow:",_4c);
}
if(objj_msgSend(_4d,"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"))){
_4d=objj_msgSend(_4b,"librarySection");
}
objj_msgSend(_48,"setSelectedObject:",_4d);
}
}
}
}),new objj_method(sel_getUid("dataSource:didReceiveRecords:contextInfo:"),function(_4f,_50,_51,_52,_53){
with(_4f){
if(_51==collectionDataSource){
CPLog.debug("[%@ %@] received collections for %@: %@",objj_msgSend(_4f,"class"),_50,_53,_52);
objj_msgSend(sectionsWithLoadedCollections,"addObject:",_53);
if(objj_msgSend(sectionsWithLoadedCollections,"count")==objj_msgSend(objj_msgSend(_librarySectionsController,"content"),"count")){
objj_msgSend(outlineView,"reloadData");
objj_msgSend(outlineView,"expandItem:expandChildren:",nil,NO);
objj_msgSend(_4f,"_attemptToRestoreDesiredPath");
}
}
}
}),new objj_method(sel_getUid("loadView"),function(_54,_55){
with(_54){
_librarySectionsController=objj_msgSend(objj_msgSend(CPArrayController,"alloc"),"init");
objj_msgSend(_librarySectionsController,"setSortDescriptors:",objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(CPSortDescriptor,"sortDescriptorWithKey:ascending:selector:","title",YES,sel_getUid("caseInsensitiveCompare:"))));
objj_msgSend(_librarySectionsController,"addObserver:forKeyPath:options:context:",_54,"arrangedObjects.refreshing",CPKeyValueObservingOptionNew|CPKeyValueObservingOptionInitial,nil);
outlineView=objj_msgSend(objj_msgSend(MMOutlineView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(outlineView,"setShouldShowDisclosureViews:",YES);
if(!CPFeatureIsCompatible(CPHTMLCanvasFeature)){
objj_msgSend(outlineView,"setSelectionHighlightStyle:",CPTableViewSelectionHighlightStyleRegular);
}
objj_msgSend(outlineView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",222/255,228/255,234/255,1));
objj_msgSend(outlineView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(outlineView,"setIntercellSpacing:",CGSizeMakeZero());
objj_msgSend(outlineView,"setIndentationPerLevel:",8);
objj_msgSend(outlineView,"setDelegate:",_54);
objj_msgSend(outlineView,"setDataSource:",_54);
objj_msgSend(outlineView,"setTarget:",_54);
objj_msgSend(outlineView,"setDoubleAction:",sel_getUid("outlineViewRowWasDoubleClicked:"));
objj_msgSend(outlineView,"setAllowsEmptySelection:",NO);
objj_msgSend(outlineView,"setHeaderView:",nil);
objj_msgSend(outlineView,"setCornerView:",nil);
var _56=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","title");
objj_msgSend(_56,"setWidth:",190);
objj_msgSend(outlineView,"addTableColumn:",_56);
objj_msgSend(outlineView,"setOutlineTableColumn:",_56);
objj_msgSend(_54,"setView:",outlineView);
objj_msgSend(_54,"reloadLibrarySections");
}
}),new objj_method(sel_getUid("reloadLibrarySections"),function(_57,_58){
with(_57){
objj_msgSend(librarySectionDataSource,"refreshRecords");
}
}),new objj_method(sel_getUid("setSelectedObject:"),function(_59,_5a,_5b){
with(_59){
selectedObject=_5b||objj_msgSend(MMHome,"sharedHome");
var _5c=objj_msgSend(outlineView,"rowForItem:",selectedObject),_5d=nil;
if(_5c===CPNotFound){
_5d=objj_msgSend(CPIndexSet,"indexSet");
}else{
_5d=objj_msgSend(CPIndexSet,"indexSetWithIndex:",_5c);
}
objj_msgSend(outlineView,"selectRowIndexes:byExtendingSelection:",_5d,NO);
}
}),new objj_method(sel_getUid("outlineViewRowWasDoubleClicked:"),function(_5e,_5f,_60){
with(_5e){
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("objectWasActivated:"))){
var _61=objj_msgSend(_60,"itemAtRow:",objj_msgSend(_60,"clickedRow"));
if(_61!==librarySectionsGroupNode&&_61!==objj_msgSend(MMHome,"sharedHome")){
objj_msgSend(_delegate,"objectWasActivated:",_61);
}
}
}
}),new objj_method(sel_getUid("outlineView:child:ofItem:"),function(_62,_63,_64,_65,_66){
with(_62){
CPLog.debug("[%@ %@] asking for child %d of item %@",objj_msgSend(_62,"class"),_63,_65,_66);
if(!_66){
switch(_65){
case 0:
return objj_msgSend(MMHome,"sharedHome");
case 1:
return librarySectionsGroupNode||(librarySectionsGroupNode=objj_msgSend(objj_msgSend(CPObject,"alloc"),"init"));
default:
return nil;
}
}
if(_66===librarySectionsGroupNode){
return objj_msgSend(objj_msgSend(_librarySectionsController,"arrangedObjects"),"objectAtIndex:",_65);
}else{
if(objj_msgSend(_66,"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"))){
return objj_msgSend(objj_msgSend(_66,"collections"),"objectAtIndex:",_65);
}
}
return nil;
}
}),new objj_method(sel_getUid("outlineView:numberOfChildrenOfItem:"),function(_67,_68,_69,_6a){
with(_67){
var _6b=0;
if(!_6a){
_6b=2;
}else{
if(_6a===librarySectionsGroupNode){
_6b=objj_msgSend(objj_msgSend(_librarySectionsController,"arrangedObjects"),"count");
}else{
if(objj_msgSend(_6a,"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"))){
_6b=objj_msgSend(objj_msgSend(_6a,"collections"),"count");
}
}
}
CPLog.debug("[%@ %@] asking for child count of item %@: %d",objj_msgSend(_67,"class"),_68,_6a,_6b);
return _6b;
}
}),new objj_method(sel_getUid("outlineView:isItemExpandable:"),function(_6c,_6d,_6e,_6f){
with(_6c){
return objj_msgSend(_6c,"outlineView:numberOfChildrenOfItem:",_6e,_6f)>0;
}
}),new objj_method(sel_getUid("outlineView:isGroupItem:"),function(_70,_71,_72,_73){
with(_70){
return _73===librarySectionsGroupNode;
}
}),new objj_method(sel_getUid("outlineView:objectValueForTableColumn:byItem:"),function(_74,_75,_76,_77,_78){
with(_74){
switch(_78){
case objj_msgSend(MMHome,"sharedHome"):
return CPLocalizedString("Home","Sidebar item title for the home screen");
case librarySectionsGroupNode:
return CPLocalizedString("LIBRARY SECTIONS","Sidebar group title for library sections");
default:
return objj_msgSend(_78,"title");
}
}
}),new objj_method(sel_getUid("outlineViewSelectionDidChange:"),function(_79,_7a,_7b){
with(_79){
var _7c=objj_msgSend(outlineView,"selectedRow"),_7d=nil;
if(_7c!=CPNotFound){
_7d=objj_msgSend(outlineView,"itemAtRow:",_7c);
}
objj_msgSend(_79,"setSelectedObject:",_7d);
}
}),new objj_method(sel_getUid("outlineView:shouldSelectItem:"),function(_7e,_7f,_80,_81){
with(_7e){
return (_81===objj_msgSend(MMHome,"sharedHome"))||objj_msgSend(_81,"isKindOfClass:",objj_msgSend(PMCDirectoryObject,"class"));
}
}),new objj_method(sel_getUid("outlineView:dataViewForTableColumn:item:"),function(_82,_83,_84,_85,_86){
with(_82){
if(_86===librarySectionsGroupNode){
return objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
}
if(_86===objj_msgSend(MMHome,"sharedHome")){
return objj_msgSend(objj_msgSend(MMTableRowView,"alloc"),"initWithFrame:image:",CGRectMakeZero(),_1);
}
if(objj_msgSend(_86,"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"))){
return objj_msgSend(objj_msgSend(MMLibrarySectionTableRowView,"alloc"),"initWithFrame:",CGRectMakeZero());
}
if(objj_msgSend(_86,"isKindOfClass:",objj_msgSend(PMCDirectoryObject,"class"))){
return objj_msgSend(objj_msgSend(MMCollectionTableRowView,"alloc"),"initWithFrame:",CGRectMakeZero());
}
return objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("outlineView:shouldShowOutlineViewForItem:"),function(_87,_88,_89,_8a){
with(_87){
return _8a!==librarySectionsGroupNode;
}
}),new objj_method(sel_getUid("outlineView:willDisplayView:forTableColumn:item:"),function(_8b,_8c,_8d,_8e,_8f,_90){
with(_8b){
if(objj_msgSend(_90,"respondsToSelector:",sel_getUid("title"))&&objj_msgSend(_8e,"respondsToSelector:",sel_getUid("setTitle:"))){
objj_msgSend(_8e,"bind:toObject:withKeyPath:options:","title",_90,"title",nil);
}
if(objj_msgSend(_90,"isKindOfClass:",objj_msgSend(MMLibrarySection,"class"))){
objj_msgSend(_8e,"bind:toObject:withKeyPath:options:","type",_90,"type",nil);
}
if(objj_msgSend(_8e,"respondsToSelector:",sel_getUid("setRefreshing:"))){
objj_msgSend(_8e,"bind:toObject:withKeyPath:options:","refreshing",_90,"refreshing",nil);
}
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_91,_92,_93,_94,_95,_96){
with(_91){
if(_94===_librarySectionsController&&objj_msgSend(_93,"isEqualToString:","arrangedObjects.refreshing")){
var _97=objj_msgSend(_librarySectionsController,"valueForKeyPath:",_93),_98=NO;
for(var i=0,_99=objj_msgSend(_97,"count");i<_99;i++){
if(objj_msgSend(_97,"objectAtIndex:",i)){
_98=YES;
break;
}
}
if(_98&&!objj_msgSend(librarySectionDataSource,"isPollingRecords")){
objj_msgSend(librarySectionDataSource,"pollRecordsWithTimeInterval:",1);
}else{
if(!_98&&objj_msgSend(librarySectionDataSource,"isPollingRecords")){
objj_msgSend(librarySectionDataSource,"cancelPollingRecords");
}
}
}
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("keyPathsForValuesAffectingSelectedLibrarySection"),function(_9a,_9b){
with(_9a){
return objj_msgSend(CPSet,"setWithObject:","librarySectionsController.selectionIndex");
}
})]);
p;36;DataSources/MMCollectionDataSource.jt;1622;@STATIC;1.0;i;14;MMDataSource.ji;30;../Models/PMCDirectoryObject.ji;27;../CPObject+XMLAttributes.jt;1517;
objj_executeFile("MMDataSource.j",YES);
objj_executeFile("../Models/PMCDirectoryObject.j",YES);
objj_executeFile("../CPObject+XMLAttributes.j",YES);
var _1=objj_allocateClassPair(MMDataSource,"MMCollectionDataSource"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("URLForRecordsWithContextInfo:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(CPString,"stringWithFormat:","/library/sections/%@/collection",objj_msgSend(_5,"id"));
}
}),new objj_method(sel_getUid("shouldProcessNode:contextInfo:"),function(_6,_7,_8,_9){
with(_6){
return /^(Directory)$/.test(String(_8.nodeName));
}
}),new objj_method(sel_getUid("recordFromElement:contextInfo:"),function(_a,_b,_c,_d){
with(_a){
var id=String(_c.getAttribute("key")),_e=objj_msgSend(CPString,"stringWithFormat:","%@/collection/%@",objj_msgSend(_d,"path"),id),_f=objj_msgSend(objj_msgSend(_a,"dataStore"),"recordWithClass:id:",objj_msgSend(PMCDirectoryObject,"class"),_e);
objj_msgSend(_f,"setValuesForNodeAttributes:ignoreUndefinedKeys:",_c,YES);
objj_msgSend(_f,"setParent:",_d);
objj_msgSend(_f,"setPath:",_e);
objj_msgSend(_f,"setKey:",_e);
objj_msgSend(_f,"acceptChangedAttributes");
return _f;
}
}),new objj_method(sel_getUid("didReceiveRecords:connection:contextInfo:"),function(_10,_11,_12,_13,_14){
with(_10){
objj_msgSend(_14,"setCollections:",_12);
objj_msgSendSuper({receiver:_10,super_class:objj_getClass("MMCollectionDataSource").super_class},"didReceiveRecords:connection:contextInfo:",_12,_13,_14);
}
})]);
p;36;Views/MMLibrarySectionTableRowView.jt;1621;@STATIC;1.0;i;27;PMCBaseObjectTableRowView.jt;1570;
objj_executeFile("PMCBaseObjectTableRowView.j",YES);
var _1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","SourceIconMovies.png"),CGSizeMake(16,16));
var _2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","SourceIconTVShows.png"),CGSizeMake(16,16));
var _3=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","SourceIconMusic.png"),CGSizeMake(16,16));
var _4=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","SourceIconPhotos.png"),CGSizeMake(16,16));
var _5=objj_allocateClassPair(PMCBaseObjectTableRowView,"MMLibrarySectionTableRowView"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("type")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("type"),function(_7,_8){
with(_7){
return type;
}
}),new objj_method(sel_getUid("setType:"),function(_9,_a,_b){
with(_9){
type=_b;
}
}),new objj_method(sel_getUid("setType:"),function(_c,_d,_e){
with(_c){
type=_e;
var _f=nil;
switch(objj_msgSend(type,"key")){
case MMLibrarySectionTypeMovie:
_f=_1;
break;
case MMLibrarySectionTypeShow:
_f=_2;
break;
case MMLibrarySectionTypeArtist:
case MMLibrarySectionTypeAlbum:
_f=_3;
break;
case MMLibrarySectionTypePhoto:
_f=_4;
break;
}
objj_msgSend(typeIcon,"setImage:",_f);
}
})]);
p;33;Views/PMCBaseObjectTableRowView.jt;4975;@STATIC;1.0;I;20;AppKit/CPTableView.jI;20;AppKit/CPTextField.ji;16;MMTableRowView.jI;21;EKSpinner/EKSpinner.ji;13;MMImageView.jt;4841;
objj_executeFile("AppKit/CPTableView.j",NO);
objj_executeFile("AppKit/CPTextField.j",NO);
objj_executeFile("MMTableRowView.j",YES);
objj_executeFile("EKSpinner/EKSpinner.j",NO);
objj_executeFile("MMImageView.j",YES);
var _1=objj_allocateClassPair(MMTableRowView,"PMCBaseObjectTableRowView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("typeIcon"),new objj_ivar("titleField"),new objj_ivar("spinner"),new objj_ivar("title"),new objj_ivar("refreshing")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("title"),function(_3,_4){
with(_3){
return title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_5,_6,_7){
with(_5){
title=_7;
}
}),new objj_method(sel_getUid("isRefreshing"),function(_8,_9){
with(_8){
return refreshing;
}
}),new objj_method(sel_getUid("setRefreshing:"),function(_a,_b,_c){
with(_a){
refreshing=_c;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
if(_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("PMCBaseObjectTableRowView").super_class},"initWithFrame:",_f)){
typeIcon=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(0,0,16,16));
objj_msgSend(_d,"addSubview:",typeIcon);
spinner=objj_msgSend(objj_msgSend(EKSpinner,"alloc"),"initWithFrame:andStyle:",CGRectMake(0,0,18,18),EKSpinnerStyleMediumBlack);
objj_msgSend(spinner,"setSpinning:",NO);
objj_msgSend(_d,"addSubview:",spinner);
titleField=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(titleField,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_d,"addSubview:",titleField);
}
return _d;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_10,_11){
with(_10){
objj_msgSend(typeIcon,"setFrameOrigin:",CGPointMake(16,(CGRectGetHeight(objj_msgSend(_10,"frame"))-CGRectGetHeight(objj_msgSend(typeIcon,"frame")))/2));
objj_msgSend(spinner,"setFrameOrigin:",CGPointMake(CGRectGetWidth(objj_msgSend(_10,"frame"))-CGRectGetWidth(objj_msgSend(spinner,"frame"))-2,(CGRectGetHeight(objj_msgSend(_10,"frame"))-CGRectGetHeight(objj_msgSend(spinner,"frame")))/2));
objj_msgSend(titleField,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(typeIcon,"frame"))+2,(CGRectGetHeight(objj_msgSend(_10,"frame"))-CGRectGetHeight(objj_msgSend(titleField,"frame")))/2));
objj_msgSend(titleField,"setFrameSize:",CGSizeMake(CGRectGetMinX(objj_msgSend(spinner,"frame"))-2-CGRectGetMinX(objj_msgSend(titleField,"frame")),CGRectGetHeight(objj_msgSend(titleField,"frame"))));
}
}),new objj_method(sel_getUid("setThemeState:"),function(_12,_13,_14){
with(_12){
objj_msgSendSuper({receiver:_12,super_class:objj_getClass("PMCBaseObjectTableRowView").super_class},"setThemeState:",_14);
objj_msgSend(titleField,"setThemeState:",_14);
objj_msgSend(typeIcon,"setThemeState:",_14);
objj_msgSend(_12,"_themeStateChanged");
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(_15,_16,_17){
with(_15){
objj_msgSendSuper({receiver:_15,super_class:objj_getClass("PMCBaseObjectTableRowView").super_class},"unsetThemeState:",_17);
objj_msgSend(titleField,"unsetThemeState:",_17);
objj_msgSend(typeIcon,"unsetThemeState:",_17);
objj_msgSend(_15,"_themeStateChanged");
}
}),new objj_method(sel_getUid("_themeStateChanged"),function(_18,_19){
with(_18){
objj_msgSend(spinner,"setStyle:",(objj_msgSend(_18,"themeState")&CPThemeStateSelectedDataView)?EKSpinnerStyleMediumWhite:EKSpinnerStyleMediumBlack);
objj_msgSend(_18,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setTitle:"),function(_1a,_1b,_1c){
with(_1a){
title=_1c;
objj_msgSend(titleField,"setStringValue:",title);
}
}),new objj_method(sel_getUid("setRefreshing:"),function(_1d,_1e,_1f){
with(_1d){
refreshing=_1f;
objj_msgSend(spinner,"setSpinning:",refreshing);
}
})]);
var _20="PMCBaseObjectTableRowViewTitleFieldKey";
var _21="PMCBaseObjectTableRowViewTypeIconKey";
var _22="PMCBaseObjectTableRowViewSpinnerKey";
var _1=objj_getClass("PMCBaseObjectTableRowView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"PMCBaseObjectTableRowView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("encodeWithCoder:"),function(_23,_24,_25){
with(_23){
objj_msgSendSuper({receiver:_23,super_class:objj_getClass("PMCBaseObjectTableRowView").super_class},"encodeWithCoder:",_25);
objj_msgSend(_25,"encodeObject:forKey:",titleField,_20);
objj_msgSend(_25,"encodeObject:forKey:",typeIcon,_21);
objj_msgSend(_25,"encodeObject:forKey:",spinner,_22);
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_26,_27,_28){
with(_26){
if(_26=objj_msgSendSuper({receiver:_26,super_class:objj_getClass("PMCBaseObjectTableRowView").super_class},"initWithCoder:",_28)){
titleField=objj_msgSend(_28,"decodeObjectForKey:",_20);
typeIcon=objj_msgSend(_28,"decodeObjectForKey:",_21);
spinner=objj_msgSend(_28,"decodeObjectForKey:",_22);
}
return _26;
}
})]);
p;22;Views/MMTableRowView.jt;5171;@STATIC;1.0;I;20;AppKit/CPTableView.jI;20;AppKit/CPTextField.jI;21;EKSpinner/EKSpinner.ji;13;MMImageView.jt;5058;
objj_executeFile("AppKit/CPTableView.j",NO);
objj_executeFile("AppKit/CPTextField.j",NO);
objj_executeFile("EKSpinner/EKSpinner.j",NO);
objj_executeFile("MMImageView.j",YES);
var _1=objj_allocateClassPair(CPView,"MMTableRowView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("imageView"),new objj_ivar("titleField"),new objj_ivar("spinner"),new objj_ivar("title"),new objj_ivar("busy"),new objj_ivar("objectValue")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("title"),function(_3,_4){
with(_3){
return title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_5,_6,_7){
with(_5){
title=_7;
}
}),new objj_method(sel_getUid("isBusy"),function(_8,_9){
with(_8){
return busy;
}
}),new objj_method(sel_getUid("setBusy:"),function(_a,_b,_c){
with(_a){
busy=_c;
}
}),new objj_method(sel_getUid("objectValue"),function(_d,_e){
with(_d){
return objectValue;
}
}),new objj_method(sel_getUid("setObjectValue:"),function(_f,_10,_11){
with(_f){
objectValue=_11;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_12,_13,_14){
with(_12){
return objj_msgSend(_12,"initWithFrame:image:",_14,nil);
}
}),new objj_method(sel_getUid("initWithFrame:image:"),function(_15,_16,_17,_18){
with(_15){
if(_15=objj_msgSendSuper({receiver:_15,super_class:objj_getClass("MMTableRowView").super_class},"initWithFrame:",_17)){
imageView=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(0,0,16,16));
objj_msgSend(imageView,"setImage:",_18);
objj_msgSend(_15,"addSubview:",imageView);
spinner=objj_msgSend(objj_msgSend(EKSpinner,"alloc"),"initWithFrame:andStyle:",CGRectMake(0,0,18,18),EKSpinnerStyleMediumBlack);
objj_msgSend(spinner,"setSpinning:",NO);
objj_msgSend(_15,"addSubview:",spinner);
titleField=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(titleField,"setLineBreakMode:",CPLineBreakByTruncatingTail);
objj_msgSend(_15,"addSubview:",titleField);
}
return _15;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_19,_1a){
with(_19){
objj_msgSend(imageView,"setFrameOrigin:",CGPointMake(16,(CGRectGetHeight(objj_msgSend(_19,"frame"))-CGRectGetHeight(objj_msgSend(imageView,"frame")))/2));
objj_msgSend(spinner,"setFrameOrigin:",CGPointMake(CGRectGetWidth(objj_msgSend(_19,"frame"))-CGRectGetWidth(objj_msgSend(spinner,"frame"))-2,(CGRectGetHeight(objj_msgSend(_19,"frame"))-CGRectGetHeight(objj_msgSend(spinner,"frame")))/2));
objj_msgSend(titleField,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(imageView,"frame"))+2,(CGRectGetHeight(objj_msgSend(_19,"frame"))-CGRectGetHeight(objj_msgSend(titleField,"frame")))/2));
objj_msgSend(titleField,"setFrameSize:",CGSizeMake(CGRectGetMinX(objj_msgSend(spinner,"frame"))-2-CGRectGetMinX(objj_msgSend(titleField,"frame")),CGRectGetHeight(objj_msgSend(titleField,"frame"))));
}
}),new objj_method(sel_getUid("setThemeState:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSendSuper({receiver:_1b,super_class:objj_getClass("MMTableRowView").super_class},"setThemeState:",_1d);
objj_msgSend(titleField,"setThemeState:",_1d);
objj_msgSend(imageView,"setThemeState:",_1d);
objj_msgSend(_1b,"_themeStateChanged");
}
}),new objj_method(sel_getUid("unsetThemeState:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("MMTableRowView").super_class},"unsetThemeState:",_20);
objj_msgSend(titleField,"unsetThemeState:",_20);
objj_msgSend(imageView,"unsetThemeState:",_20);
objj_msgSend(_1e,"_themeStateChanged");
}
}),new objj_method(sel_getUid("_themeStateChanged"),function(_21,_22){
with(_21){
objj_msgSend(spinner,"setStyle:",(objj_msgSend(_21,"themeState")&CPThemeStateSelectedDataView)?EKSpinnerStyleMediumWhite:EKSpinnerStyleMediumBlack);
objj_msgSend(_21,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("setTitle:"),function(_23,_24,_25){
with(_23){
title=_25;
objj_msgSend(titleField,"setStringValue:",title);
}
}),new objj_method(sel_getUid("setBusy:"),function(_26,_27,_28){
with(_26){
busy=_28;
objj_msgSend(spinner,"setSpinning:",busy);
}
})]);
var _29="MMTableRowViewTitleFieldKey";
var _2a="MMTableRowViewTypeIconKey";
var _2b="MMTableRowViewSpinnerKey";
var _1=objj_getClass("MMTableRowView");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"MMTableRowView\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("encodeWithCoder:"),function(_2c,_2d,_2e){
with(_2c){
objj_msgSendSuper({receiver:_2c,super_class:objj_getClass("MMTableRowView").super_class},"encodeWithCoder:",_2e);
objj_msgSend(_2e,"encodeObject:forKey:",titleField,_29);
objj_msgSend(_2e,"encodeObject:forKey:",imageView,_2a);
objj_msgSend(_2e,"encodeObject:forKey:",spinner,_2b);
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_2f,_30,_31){
with(_2f){
if(_2f=objj_msgSendSuper({receiver:_2f,super_class:objj_getClass("MMTableRowView").super_class},"initWithCoder:",_31)){
titleField=objj_msgSend(_31,"decodeObjectForKey:",_29);
imageView=objj_msgSend(_31,"decodeObjectForKey:",_2a);
spinner=objj_msgSend(_31,"decodeObjectForKey:",_2b);
}
return _2f;
}
})]);
p;32;Frameworks/EKSpinner/EKSpinner.jt;3691;@STATIC;1.0;t;3672;
EKSpinnerStyleSmallWhite="small_white";
EKSpinnerStyleSmallGray="small_gray";
EKSpinnerStyleSmallBlack="small_black";
EKSpinnerStyleMediumWhite="medium_white";
EKSpinnerStyleMediumGray="medium_gray";
EKSpinnerStyleMediumBlack="medium_black";
EKSpinnerStyleLargeWhite="big_white";
EKSpinnerStyleLargeGray="big_gray";
EKSpinnerStyleLargeBlack="big_black";
var _1=objj_allocateClassPair(CPImageView,"EKSpinner"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("frames"),new objj_ivar("interval"),new objj_ivar("spinning"),new objj_ivar("style"),new objj_ivar("imageNumber"),new objj_ivar("timer"),new objj_ivar("imageStack")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("frames"),function(_3,_4){
with(_3){
return frames;
}
}),new objj_method(sel_getUid("setFrames:"),function(_5,_6,_7){
with(_5){
frames=_7;
}
}),new objj_method(sel_getUid("interval"),function(_8,_9){
with(_8){
return interval;
}
}),new objj_method(sel_getUid("setInterval:"),function(_a,_b,_c){
with(_a){
interval=_c;
}
}),new objj_method(sel_getUid("isSpinning"),function(_d,_e){
with(_d){
return spinning;
}
}),new objj_method(sel_getUid("setSpinning:"),function(_f,_10,_11){
with(_f){
spinning=_11;
}
}),new objj_method(sel_getUid("style"),function(_12,_13){
with(_12){
return style;
}
}),new objj_method(sel_getUid("setStyle:"),function(_14,_15,_16){
with(_14){
style=_16;
}
}),new objj_method(sel_getUid("initWithFrame:andStyle:"),function(_17,_18,_19,_1a){
with(_17){
if(_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("EKSpinner").super_class},"initWithFrame:",_19)){
objj_msgSend(_17,"setStyle:",_1a);
objj_msgSend(_17,"setImageScaling:",CPScaleNone);
}
return _17;
}
}),new objj_method(sel_getUid("setStyle:"),function(_1b,_1c,_1d){
with(_1b){
if(!_1d){
return;
}
if(_1d.search(/small/)<0){
objj_msgSend(_1b,"setFrames:",12);
}else{
objj_msgSend(_1b,"setFrames:",8);
}
imageStack=objj_msgSend(objj_msgSend(CPArray,"alloc"),"init");
for(var i=1;i<=objj_msgSend(_1b,"frames");i++){
var img=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:","Frameworks/EKSpinner/Resources/"+_1d+"_"+i+".png",CGSizeMake(CGRectGetWidth(objj_msgSend(_1b,"frame")),CGRectGetHeight(objj_msgSend(_1b,"frame"))));
objj_msgSend(imageStack,"addObject:",img);
}
style=_1d;
}
}),new objj_method(sel_getUid("setSpinning:"),function(_1e,_1f,_20){
with(_1e){
_20=!!_20;
if(_20===spinning){
return;
}
if(_20){
var _21=objj_msgSend(_1e,"interval")?(objj_msgSend(_1e,"interval")/1000):0.1;
imageNumber=0;
timer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",_21,_1e,sel_getUid("changeSpinnerImage"),nil,YES);
}else{
objj_msgSend(timer,"invalidate");
objj_msgSend(_1e,"setImage:",nil);
}
spinning=_20;
}
}),new objj_method(sel_getUid("changeSpinnerImage"),function(_22,_23){
with(_22){
objj_msgSend(_22,"setImage:",objj_msgSend(imageStack,"objectAtIndex:",imageNumber));
imageNumber=(imageNumber+1)%frames;
}
})]);
var _1=objj_getClass("EKSpinner");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"EKSpinner\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("encodeWithCoder:"),function(_24,_25,_26){
with(_24){
objj_msgSendSuper({receiver:_24,super_class:objj_getClass("EKSpinner").super_class},"encodeWithCoder:",_26);
objj_msgSend(_26,"encodeObject:forKey:",style,"style");
}
}),new objj_method(sel_getUid("initWithCoder:"),function(_27,_28,_29){
with(_27){
if(_27=objj_msgSendSuper({receiver:_27,super_class:objj_getClass("EKSpinner").super_class},"initWithCoder:",_29)){
objj_msgSend(_27,"setStyle:",objj_msgSend(_29,"decodeObjectForKey:","style"));
}
return _27;
}
})]);
p;32;Views/MMCollectionTableRowView.jt;703;@STATIC;1.0;i;30;MMLibrarySectionTableRowView.jt;650;
objj_executeFile("MMLibrarySectionTableRowView.j",YES);
var _1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","SourceIconCollection.png"),CGSizeMake(16,16));
var _2=objj_allocateClassPair(MMTableRowView,"MMCollectionTableRowView"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_4,_5,_6){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("MMCollectionTableRowView").super_class},"initWithFrame:",_6)){
objj_msgSend(imageView,"setImage:",_1);
}
return _4;
}
})]);
p;21;Views/MMOutlineView.jt;1519;@STATIC;1.0;I;22;AppKit/CPOutlineView.jt;1473;
objj_executeFile("AppKit/CPOutlineView.j",NO);
var _1=objj_allocateClassPair(CPOutlineView,"MMOutlineView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("shouldShowDisclosureViews")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("shouldShowDisclosureViews"),function(_3,_4){
with(_3){
return shouldShowDisclosureViews;
}
}),new objj_method(sel_getUid("setShouldShowDisclosureViews:"),function(_5,_6,_7){
with(_5){
shouldShowDisclosureViews=_7;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("MMOutlineView").super_class},"initWithFrame:",_a)){
shouldShowDisclosureViews=YES;
}
return _8;
}
}),new objj_method(sel_getUid("setShouldShowDisclosureViews:"),function(_b,_c,_d){
with(_b){
_d=!!_d;
if(shouldShowDisclosureViews===_d){
return;
}
shouldShowDisclosureViews=_d;
objj_msgSend(_b,"reloadData");
}
}),new objj_method(sel_getUid("frameOfOutlineDisclosureControlAtRow:"),function(_e,_f,_10){
with(_e){
if(shouldShowDisclosureViews==NO){
return CGRectMakeZero();
}
return objj_msgSendSuper({receiver:_e,super_class:objj_getClass("MMOutlineView").super_class},"frameOfOutlineDisclosureControlAtRow:",_10);
}
}),new objj_method(sel_getUid("levelForItem:"),function(_11,_12,_13){
with(_11){
return objj_msgSendSuper({receiver:_11,super_class:objj_getClass("MMOutlineView").super_class},"levelForItem:",_13)-(shouldShowDisclosureViews?0:1);
}
})]);
p;15;Models/MMHome.jt;606;@STATIC;1.0;t;588;
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"MMHome"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("path"),function(_4,_5){
with(_4){
return "home";
}
}),new objj_method(sel_getUid("title"),function(_6,_7){
with(_6){
return CPLocalizedString("Home","Home");
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("initialize"),function(_8,_9){
with(_8){
if(_8===objj_msgSend(MMHome,"class")){
_1=objj_msgSend(objj_msgSend(_8,"alloc"),"init");
}
}
}),new objj_method(sel_getUid("sharedHome"),function(_a,_b){
with(_a){
return _1;
}
})]);
p;31;Controllers/MMPrefsController.jt;1289;@STATIC;1.0;I;21;AppKit/CPController.ji;34;../DataSources/MMPrefsDataSource.ji;19;../Models/MMPrefs.jt;1181;
objj_executeFile("AppKit/CPController.j",NO);
objj_executeFile("../DataSources/MMPrefsDataSource.j",YES);
objj_executeFile("../Models/MMPrefs.j",YES);
var _1=null;
var _2=objj_allocateClassPair(CPController,"MMPrefsController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_prefs")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("init"),function(_4,_5){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("MMPrefsController").super_class},"init")){
_prefs=objj_msgSend(objj_msgSend(MMPrefs,"alloc"),"init");
}
return _4;
}
}),new objj_method(sel_getUid("synchronize"),function(_6,_7){
with(_6){
return objj_msgSend(_prefs,"synchronize");
}
}),new objj_method(sel_getUid("values"),function(_8,_9){
with(_8){
return _prefs;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedPrefsController"),function(_a,_b){
with(_a){
if(!_1){
CPLog.debug("Initializing shared prefs controller");
_1=objj_msgSend(objj_msgSend(_a,"alloc"),"init");
objj_msgSend(_1,"synchronize");
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",120,_1,sel_getUid("synchronize"),nil,YES);
}
return _1;
}
})]);
p;31;DataSources/MMPrefsDataSource.jt;1500;@STATIC;1.0;i;14;MMDataSource.ji;18;../Models/MMPref.jt;1439;
objj_executeFile("MMDataSource.j",YES);
objj_executeFile("../Models/MMPref.j",YES);
var _1="/:/prefs";
var _2=objj_allocateClassPair(MMDataSource,"MMPrefsDataSource"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("URLForRecordsWithContextInfo:"),function(_4,_5,_6){
with(_4){
return objj_msgSend(PMSURL,"URLWithPath:",_1);
}
}),new objj_method(sel_getUid("URLForUpdatedRecord:contextInfo:"),function(_7,_8,_9,_a){
with(_7){
var _b=objj_msgSend(CPDictionary,"dictionary");
if(objj_msgSend(_9,"respondsToSelector:",sel_getUid("objectEnumerator"))){
var _c=objj_msgSend(_9,"objectEnumerator"),_d;
while(_d=objj_msgSend(_c,"nextObject")){
objj_msgSend(_b,"setObject:forKey:",objj_msgSend(_d,"value"),objj_msgSend(_d,"id"));
}
}else{
objj_msgSend(_b,"setObject:forKey:",objj_msgSend(_9,"value"),objj_msgSend(_9,"id"));
}
return objj_msgSend(PMSURL,"URLWithPath:params:",_1,_b);
}
}),new objj_method(sel_getUid("shouldProcessNode:contextInfo:"),function(_e,_f,_10,_11){
with(_e){
return String(_10.nodeName)=="Setting";
}
}),new objj_method(sel_getUid("recordFromElement:contextInfo:"),function(_12,_13,_14,_15){
with(_12){
var _16=objj_msgSend(objj_msgSend(MMPref,"alloc"),"init");
objj_msgSend(_16,"setValuesForNodeAttributes:ignoreUndefinedKeys:",_14,YES);
return _16;
}
}),new objj_method(sel_getUid("HTTPBodyForUpdatedRecord:contextInfo:"),function(_17,_18,_19,_1a){
with(_17){
return nil;
}
})]);
p;15;Models/MMPref.jt;1811;@STATIC;1.0;I;21;Foundation/CPObject.jt;1766;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"MMPref"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_id"),new objj_ivar("_value"),new objj_ivar("_type"),new objj_ivar("_defaultValue"),new objj_ivar("_summary"),new objj_ivar("_cachedValue")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("id"),function(_3,_4){
with(_3){
return _id;
}
}),new objj_method(sel_getUid("setId:"),function(_5,_6,_7){
with(_5){
_id=_7;
}
}),new objj_method(sel_getUid("value"),function(_8,_9){
with(_8){
return _value;
}
}),new objj_method(sel_getUid("setValue:"),function(_a,_b,_c){
with(_a){
_value=_c;
}
}),new objj_method(sel_getUid("type"),function(_d,_e){
with(_d){
return _type;
}
}),new objj_method(sel_getUid("setType:"),function(_f,_10,_11){
with(_f){
_type=_11;
}
}),new objj_method(sel_getUid("defaultValue"),function(_12,_13){
with(_12){
return _defaultValue;
}
}),new objj_method(sel_getUid("setDefaultValue:"),function(_14,_15,_16){
with(_14){
_defaultValue=_16;
}
}),new objj_method(sel_getUid("type"),function(_17,_18){
with(_17){
return _summary;
}
}),new objj_method(sel_getUid("setType:"),function(_19,_1a,_1b){
with(_19){
_summary=_1b;
}
}),new objj_method(sel_getUid("value"),function(_1c,_1d){
with(_1c){
if(typeof _value!="string"){
return _value;
}
switch(_type){
case "text":
_cachedValue=_value;
break;
case "int":
case "double":
_cachedValue=Number(_value);
break;
case "bool":
_cachedValue=(_value=="true");
break;
default:
return _value;
}
return _cachedValue;
}
}),new objj_method(sel_getUid("setValue:"),function(_1e,_1f,_20){
with(_1e){
_value=_20;
_cachedValue=null;
}
}),new objj_method(sel_getUid("setType:"),function(_21,_22,_23){
with(_21){
_type=_23;
_cachedValue=null;
}
})]);
p;16;Models/MMPrefs.jt;2941;@STATIC;1.0;I;21;Foundation/CPObject.jI;18;Foundation/CPSet.ji;8;MMPref.ji;34;../DataSources/MMPrefsDataSource.jt;2822;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPSet.j",NO);
objj_executeFile("MMPref.j",YES);
objj_executeFile("../DataSources/MMPrefsDataSource.j",YES);
var _1=objj_allocateClassPair(CPObject,"MMPrefs"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_prefs"),new objj_ivar("_dataSource"),new objj_ivar("_dirtyPrefs")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMPrefs").super_class},"init")){
_prefs=objj_msgSend(CPDictionary,"dictionary");
_dataSource=objj_msgSend(objj_msgSend(MMPrefsDataSource,"alloc"),"initWithDelegate:",_3);
_dirtyPrefs=objj_msgSend(CPSet,"set");
}
return _3;
}
}),new objj_method(sel_getUid("setPrefs:"),function(_5,_6,_7){
with(_5){
var _8=objj_msgSend(CPDictionary,"dictionary");
for(var i=0,_9=objj_msgSend(_7,"count");i<_9;i++){
var _a=_7[i],id=objj_msgSend(_a,"id");
objj_msgSend(_5,"willChangeValueForKey:",id);
objj_msgSend(_prefs,"setObject:forKey:",_a,id);
objj_msgSend(_8,"setObject:forKey:",_a,id);
objj_msgSend(_5,"didChangeValueForKey:",id);
}
_prefs=_8;
}
}),new objj_method(sel_getUid("synchronize"),function(_b,_c){
with(_b){
CPLog.trace("[%@ synchronize] START",objj_msgSend(_b,"class"),_dataSource);
if(objj_msgSend(_dirtyPrefs,"count")){
objj_msgSend(_dataSource,"updateRecord:",_dirtyPrefs);
objj_msgSend(_dirtyPrefs,"removeAllObjects");
}else{
objj_msgSend(_dataSource,"refreshRecords");
}
CPLog.trace("[%@ synchronize] END",objj_msgSend(_b,"class"));
}
}),new objj_method(sel_getUid("prefForKey:"),function(_d,_e,_f){
with(_d){
return objj_msgSend(_prefs,"objectForKey:",_f);
}
}),new objj_method(sel_getUid("valueForKey:"),function(_10,_11,_12){
with(_10){
var _13=objj_msgSend(_10,"prefForKey:",_12);
if(_13){
return objj_msgSend(_13,"value");
}else{
return objj_msgSend(_10,"valueForUndefinedKey:",_12);
}
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_14,_15,_16,_17){
with(_14){
var _18=objj_msgSend(_14,"prefForKey:",_17);
if(_18){
objj_msgSend(_14,"willChangeValueForKey:",_17);
objj_msgSend(_18,"setValue:",_16);
objj_msgSend(_dirtyPrefs,"addObject:",_18);
objj_msgSend(_14,"didChangeValueForKey:",_17);
}else{
objj_msgSend(_14,"setValue:forUndefinedKey:",_16,_17);
}
objj_msgSend(_14,"synchronize");
}
}),new objj_method(sel_getUid("dataSource:didReceiveRecords:contextInfo:"),function(_19,_1a,_1b,_1c,_1d){
with(_19){
objj_msgSend(_19,"setPrefs:",_1c);
}
}),new objj_method(sel_getUid("dataSource:didUpdateRecord:contextInfo:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
objj_msgSend(_20,"refreshRecords");
}
}),new objj_method(sel_getUid("dataSource:didFailToUpdateRecord:withError:contextInfo:"),function(_23,_24,_25,_26,_27,_28){
with(_23){
objj_msgSend(_25,"refreshRecords");
}
})]);
p;24;Models/PMSCapabilities.jt;6043;@STATIC;1.0;I;21;Foundation/CPObject.ji;9;Version.jt;5985;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Version.j",YES);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"PMSCapabilities"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("libraryChangeWatchingSupported"),new objj_ivar("libraryTimedUpdatesSupported"),new objj_ivar("myPlexSupported"),new objj_ivar("collectionDeletionSupported"),new objj_ivar("iTunesSharingSupported"),new objj_ivar("iPhotoSharingSupported"),new objj_ivar("ApertureSharingSupported"),new objj_ivar("version"),new objj_ivar("platform")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("libraryChangeWatchingSupported"),function(_4,_5){
with(_4){
return libraryChangeWatchingSupported;
}
}),new objj_method(sel_getUid("libraryTimedUpdatesSupported"),function(_6,_7){
with(_6){
return libraryTimedUpdatesSupported;
}
}),new objj_method(sel_getUid("myPlexSupported"),function(_8,_9){
with(_8){
return myPlexSupported;
}
}),new objj_method(sel_getUid("collectionDeletionSupported"),function(_a,_b){
with(_a){
return collectionDeletionSupported;
}
}),new objj_method(sel_getUid("iTunesSharingSupported"),function(_c,_d){
with(_c){
return iTunesSharingSupported;
}
}),new objj_method(sel_getUid("iPhotoSharingSupported"),function(_e,_f){
with(_e){
return iPhotoSharingSupported;
}
}),new objj_method(sel_getUid("ApertureSharingSupported"),function(_10,_11){
with(_10){
return ApertureSharingSupported;
}
}),new objj_method(sel_getUid("version"),function(_12,_13){
with(_12){
return version;
}
}),new objj_method(sel_getUid("platform"),function(_14,_15){
with(_14){
return platform;
}
}),new objj_method(sel_getUid("setPlatform:"),function(_16,_17,_18){
with(_16){
platform=_18;
}
}),new objj_method(sel_getUid("init"),function(_19,_1a){
with(_19){
if(_19=objj_msgSendSuper({receiver:_19,super_class:objj_getClass("PMSCapabilities").super_class},"init")){
}
return _19;
}
}),new objj_method(sel_getUid("refresh"),function(_1b,_1c){
with(_1b){
objj_msgSend(CPURLConnection,"connectionWithRequest:delegate:",objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(PMSURL,"URLWithPath:","/")),_1b);
}
}),new objj_method(sel_getUid("connection:didReceiveResponse:"),function(_1d,_1e,_1f,_20){
with(_1d){
if(objj_msgSend(_20,"statusCode")!=200){
objj_msgSend(_1f,"cancel");
}
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_21,_22,_23,_24){
with(_21){
var _25=objj_msgSend(_23,"responseXML");
if(!_25){
return;
}
var _26=_25.documentElement;
objj_msgSend(_21,"willChangeValueForKey:","libraryTimedUpdatesSupported");
libraryTimedUpdatesSupported=(_26.getAttribute("libraryNoTimedUpdates")!="1");
objj_msgSend(_21,"didChangeValueForKey:","libraryTimedUpdatesSupported");
objj_msgSend(_21,"willChangeValueForKey:","libraryChangeWatchingSupported");
libraryChangeWatchingSupported=(_26.getAttribute("libraryNoChangeWatching")!="1");
objj_msgSend(_21,"didChangeValueForKey:","libraryChangeWatchingSupported");
objj_msgSend(_21,"willChangeValueForKey:","myPlexSupported");
myPlexSupported=(_26.getAttribute("myPlex")=="1");
objj_msgSend(_21,"didChangeValueForKey:","myPlexSupported");
platform=_26.getAttribute("platform")||"";
var _27=_26.getAttribute("version");
if(_27){
_27=_27.split("-")[0];
}
objj_msgSend(_21,"willChangeValueForKey:","version");
version=objj_msgSend(Version,"versionWithString:",_27);
objj_msgSend(_21,"didChangeValueForKey:","version");
iTunesSharingSupported=objj_msgSend(_21,"versionIsAtLeast:","0.9.5.0")&&(platform=="MacOSX"||platform=="Windows");
iPhotoSharingSupported=(platform=="MacOSX");
ApertureSharingSupported=(platform=="MacOSX");
}
}),new objj_method(sel_getUid("anySharingSupported"),function(_28,_29){
with(_28){
return iTunesSharingSupported||iPhotoSharingSupported||ApertureSharingSupported;
}
}),new objj_method(sel_getUid("languagePreferencesSupported"),function(_2a,_2b){
with(_2a){
return objj_msgSend(_2a,"versionIsAtLeast:","0.9.2.6");
}
}),new objj_method(sel_getUid("stopRefreshSupported"),function(_2c,_2d){
with(_2c){
return objj_msgSend(_2c,"versionIsAtLeast:","0.9.2.6");
}
}),new objj_method(sel_getUid("dtsMixdownSupported"),function(_2e,_2f){
with(_2e){
return objj_msgSend(_2e,"versionIsAtLeast:","0.9.2.7");
}
}),new objj_method(sel_getUid("allowMediaDeletionSupported"),function(_30,_31){
with(_30){
return objj_msgSend(_30,"versionIsAtLeast:","0.9.3.4");
}
}),new objj_method(sel_getUid("photoSectionsSupported"),function(_32,_33){
with(_32){
return objj_msgSend(_32,"versionIsAtLeast:","0.9.3.3");
}
}),new objj_method(sel_getUid("collectionDeletionSupported"),function(_34,_35){
with(_34){
return objj_msgSend(_34,"versionIsAtLeast:","0.9.3.6");
}
}),new objj_method(sel_getUid("versionIsAtLeast:"),function(_36,_37,_38){
with(_36){
if(objj_msgSend(_38,"isKindOfClass:",objj_msgSend(CPString,"class"))){
_38=objj_msgSend(Version,"versionWithString:",_38);
}
return objj_msgSend(version,"compare:",_38)!=CPOrderedAscending;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedPMSCapabilities"),function(_39,_3a){
with(_39){
if(!_1){
_1=objj_msgSend(objj_msgSend(_39,"alloc"),"init");
objj_msgSend(_1,"refresh");
}
return _1;
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingLanguagePreferencesSupported"),function(_3b,_3c){
with(_3b){
return objj_msgSend(CPSet,"setWithObjects:","version");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingStopRefreshSupported"),function(_3d,_3e){
with(_3d){
return objj_msgSend(CPSet,"setWithObjects:","version");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingDtsMixdownSupported"),function(_3f,_40){
with(_3f){
return objj_msgSend(CPSet,"setWithObjects:","version");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingMyPlexSupported"),function(_41,_42){
with(_41){
return objj_msgSend(CPSet,"setWithObjects:","version");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingCollectionDeletionSupported"),function(_43,_44){
with(_43){
return objj_msgSend(CPSet,"setWithObjects:","version");
}
})]);
p;16;Models/Version.jt;4550;@STATIC;1.0;I;21;Foundation/CPObject.jI;22;Foundation/CPScanner.jt;4478;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPScanner.j",NO);
var _1=objj_allocateClassPair(CPObject,"Version"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("major"),new objj_ivar("minor"),new objj_ivar("revision"),new objj_ivar("patch")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("major"),function(_3,_4){
with(_3){
return major;
}
}),new objj_method(sel_getUid("setMajor:"),function(_5,_6,_7){
with(_5){
major=_7;
}
}),new objj_method(sel_getUid("minor"),function(_8,_9){
with(_8){
return minor;
}
}),new objj_method(sel_getUid("setMinor:"),function(_a,_b,_c){
with(_a){
minor=_c;
}
}),new objj_method(sel_getUid("revision"),function(_d,_e){
with(_d){
return revision;
}
}),new objj_method(sel_getUid("setRevision:"),function(_f,_10,_11){
with(_f){
revision=_11;
}
}),new objj_method(sel_getUid("patch"),function(_12,_13){
with(_12){
return patch;
}
}),new objj_method(sel_getUid("setPatch:"),function(_14,_15,_16){
with(_14){
patch=_16;
}
}),new objj_method(sel_getUid("initWithComponents:"),function(_17,_18,_19){
with(_17){
return objj_msgSend(_17,"initWithMajor:minor:revision:patch:",_19[0],_19[1],_19[2],_19[3]);
}
}),new objj_method(sel_getUid("initWithMajor:minor:revision:patch:"),function(_1a,_1b,_1c,_1d,_1e,_1f){
with(_1a){
if(_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("Version").super_class},"init")){
major=_1c||0;
minor=_1d||0;
revision=_1e||0;
patch=_1f||0;
}
return _1a;
}
}),new objj_method(sel_getUid("components"),function(_20,_21){
with(_20){
return [major,minor,revision,patch];
}
}),new objj_method(sel_getUid("compare:"),function(_22,_23,_24){
with(_22){
var _25=objj_msgSend(_22,"components"),_26=objj_msgSend(_24,"components");
for(var i=0,_27=objj_msgSend(_25,"count");i<_27;i++){
var _28=objj_msgSend(objj_msgSend(_25,"objectAtIndex:",i),"compare:",objj_msgSend(_26,"objectAtIndex:",i));
if(_28!=CPOrderedSame){
return _28;
}
}
return CPOrderedSame;
}
}),new objj_method(sel_getUid("isEqual:"),function(_29,_2a,_2b){
with(_29){
if(!objj_msgSend(_2b,"isKindOfClass:",objj_msgSend(_29,"class"))){
return NO;
}
return objj_msgSend(_29,"isEqualToVersion:",_2b);
}
}),new objj_method(sel_getUid("isEqualToVersion:"),function(_2c,_2d,_2e){
with(_2c){
return objj_msgSend(objj_msgSend(_2c,"components"),"isEqualToArray:",objj_msgSend(_2e,"components"));
}
}),new objj_method(sel_getUid("description"),function(_2f,_30){
with(_2f){
return objj_msgSend(CPString,"stringWithFormat:","<%@ %d.%d.%d.%d>",objj_msgSend(_2f,"class"),major,minor,revision,patch);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("versionWithString:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(_33,"componentsSeparatedByString:",".");
objj_msgSend(_34,"enumerateObjectsUsingBlock:",function(_35,_36){
_34[_36]=objj_msgSend(_35,"intValue");
});
return objj_msgSend(objj_msgSend(_31,"alloc"),"initWithComponents:",_34);
}
}),new objj_method(sel_getUid("versionWithMajor:minor:revision:patch:"),function(_37,_38,_39,_3a,_3b,_3c){
with(_37){
return objj_msgSend(objj_msgSend(_37,"alloc"),"initWithMajor:minor:revision:patch:",_39,_3a,_3b,_3c);
}
})]);
var _1=objj_getClass("Version");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"Version\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("copy"),function(_3d,_3e){
with(_3d){
return objj_msgSend(objj_msgSend(objj_msgSend(_3d,"class"),"alloc"),"initWithComponents:",objj_msgSend(_3d,"components"));
}
})]);
var _3f="VersionMajorKey";
var _40="VersionMinorKey";
var _41="VersionRevisionKey";
var _42="VersionPatchKey";
var _1=objj_getClass("Version");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"Version\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_43,_44,_45){
with(_43){
if(_43=objj_msgSendSuper({receiver:_43,super_class:objj_getClass("Version").super_class},"init")){
major=objj_msgSend(_45,"decodeIntForKey:",_3f)||0;
minor=objj_msgSend(_45,"decodeIntForKey:",_40)||0;
revision=objj_msgSend(_45,"decodeIntForKey:",_41)||0;
patch=objj_msgSend(_45,"decodeIntForKey:",_42)||0;
}
return _43;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_46,_47,_48){
with(_46){
objj_msgSend(_48,"encodeInt:forKey:",major,_3f);
objj_msgSend(_48,"encodeInt:forKey:",minor,VersionMinroKey);
objj_msgSend(_48,"encodeInt:forKey:",revision,_41);
objj_msgSend(_48,"encodeInt:forKey:",patch,_42);
}
})]);
p;33;Controllers/MMContentController.jt;13016;@STATIC;1.0;I;25;AppKit/CPViewController.jI;24;AppKit/CPViewAnimation.ji;20;../Views/MMToolbar.jt;12912;
objj_executeFile("AppKit/CPViewController.j",NO);
objj_executeFile("AppKit/CPViewAnimation.j",NO);
objj_executeFile("../Views/MMToolbar.j",YES);
var _1=objj_allocateClassPair(CPViewController,"MMContentController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("viewControllers"),new objj_ivar("status"),new objj_ivar("navigationBar"),new objj_ivar("links"),new objj_ivar("navigationBarOrigin")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("viewControllers"),function(_3,_4){
with(_3){
return viewControllers;
}
}),new objj_method(sel_getUid("status"),function(_5,_6){
with(_5){
return status;
}
}),new objj_method(sel_getUid("setStatus:"),function(_7,_8,_9){
with(_7){
status=_9;
}
}),new objj_method(sel_getUid("init"),function(_a,_b){
with(_a){
if(_a=objj_msgSendSuper({receiver:_a,super_class:objj_getClass("MMContentController").super_class},"init")){
viewControllers=objj_msgSend(CPArray,"array");
links=objj_msgSend(CPArray,"array");
objj_msgSend(_a,"addObserver:forKeyPath:options:context:",_a,"currentController",CPKeyValueChangeNewKey,nil);
}
return _a;
}
}),new objj_method(sel_getUid("navigationBar"),function(_c,_d){
with(_c){
objj_msgSend(_c,"view");
return navigationBar;
}
}),new objj_method(sel_getUid("loadView"),function(_e,_f){
with(_e){
var _10=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
navigationBar=objj_msgSend(objj_msgSend(MMToolbar,"alloc"),"initWithFrame:",CGRectMake(0,-1,0,30));
navigationBarOrigin=objj_msgSend(navigationBar,"frameOrigin");
objj_msgSend(navigationBar,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_10,"addSubview:",navigationBar);
objj_msgSend(_10,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(_e,"setView:",_10);
}
}),new objj_method(sel_getUid("pushViewController:animated:"),function(_11,_12,_13,_14){
with(_11){
if(objj_msgSend(_13,"respondsToSelector:",sel_getUid("willBePushedOntoContentController:"))){
objj_msgSend(_13,"willBePushedOntoContentController:",_11);
}
if(objj_msgSend(_13,"respondsToSelector:",sel_getUid("willBeOrderedFrontByContentController:"))){
objj_msgSend(_13,"willBeOrderedFrontByContentController:",_11);
}
if(objj_msgSend(_13,"respondsToSelector:",sel_getUid("setParentViewController:"))){
objj_msgSend(_13,"setParentViewController:",_11);
}
if(objj_msgSend(objj_msgSend(_11,"currentController"),"respondsToSelector:",sel_getUid("willBeOrderedBackByContentController:"))){
objj_msgSend(objj_msgSend(_11,"currentController"),"willBeOrderedBackByContentController:",_11);
}
objj_msgSend(_11,"willChangeValueForKey:","currentController");
objj_msgSend(_11,"showOrHideNavigationBarForController:",_13);
objj_msgSend(viewControllers,"addObject:",_13);
var _15=objj_msgSend(_13,"view");
if(objj_msgSend(_13,"respondsToSelector:",sel_getUid("prepareViewForContentController:"))){
objj_msgSend(_13,"prepareViewForContentController:",_11);
}else{
objj_msgSend(_15,"setFrame:",objj_msgSend(_11,"contentRect"));
objj_msgSend(_15,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
}
if(objj_msgSend(_13,"respondsToSelector:",sel_getUid("title"))){
objj_msgSend(_13,"addObserver:forKeyPath:options:context:",_11,"title",CPKeyValueChangeNewKey,nil);
}
objj_msgSend(_11,"synchronize");
if(_14){
var _16=_13,_17=objj_msgSend(_16,"view"),_18=objj_msgSend(_17,"frame"),_19=CGRectOffset(_18,0,CGRectGetHeight(_18));
objj_msgSend(_17,"setFrame:",_19);
objj_msgSend(objj_msgSend(_11,"view"),"addSubview:",_17);
var _1a=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithViewAnimations:",objj_msgSend(CPArray,"arrayWithObjects:",objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_17,CPViewAnimationTargetKey,_19,CPViewAnimationStartFrameKey,_18,CPViewAnimationEndFrameKey)));
objj_msgSend(_1a,"setDuration:",0.25);
objj_msgSend(_1a,"setAnimationCurve:",CPAnimationEaseIn);
objj_msgSend(_1a,"startAnimation");
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.25,_11,sel_getUid("viewControllerPushAnimationDidFinish:"),_16,NO);
}else{
objj_msgSend(objj_msgSend(_11,"view"),"addSubview:positioned:relativeTo:",_15,CPWindowBelow,navigationBar);
if(objj_msgSend(_13,"respondsToSelector:",sel_getUid("wasPushedOntoContentController:"))){
objj_msgSend(_13,"wasPushedOntoContentController:",_11);
}
if(objj_msgSend(_13,"respondsToSelector:",sel_getUid("wasOrderedFrontByContentController:"))){
objj_msgSend(_13,"wasOrderedFrontByContentController:",_11);
}
objj_msgSend(_11,"didChangeValueForKey:","currentController");
}
}
}),new objj_method(sel_getUid("contentRect"),function(_1b,_1c){
with(_1b){
return CGRectMake(0,CGRectGetMaxY(objj_msgSend(navigationBar,"frame")),CGRectGetWidth(objj_msgSend(objj_msgSend(_1b,"view"),"frame")),CGRectGetHeight(objj_msgSend(objj_msgSend(_1b,"view"),"frame"))-CGRectGetMaxY(objj_msgSend(navigationBar,"frame")));
}
}),new objj_method(sel_getUid("popViewControllerAnimated:"),function(_1d,_1e,_1f){
with(_1d){
if(objj_msgSend(viewControllers,"count")<=1){
return;
}
objj_msgSend(_1d,"popToViewController:animated:",objj_msgSend(viewControllers,"objectAtIndex:",objj_msgSend(viewControllers,"count")-2),_1f);
}
}),new objj_method(sel_getUid("popToViewController:animated:"),function(_20,_21,_22,_23){
with(_20){
var _24=objj_msgSend(viewControllers,"indexOfObject:",_22);
if(_24==CPNotFound||(_24==objj_msgSend(viewControllers,"count")-1)){
return;
}
objj_msgSend(_20,"willChangeValueForKey:","currentController");
objj_msgSend(_20,"showOrHideNavigationBarForController:",_22);
if(objj_msgSend(_22,"respondsToSelector:",sel_getUid("willBeOrderedFrontByContentController:"))){
objj_msgSend(_22,"willBeOrderedFrontByContentController:",_20);
}
var _25=_24+1,_26=objj_msgSend(viewControllers,"count")-(_23?2:1);
for(var i=_26;i>=_25;i--){
var _27=viewControllers[i];
if(objj_msgSend(_27,"respondsToSelector:",sel_getUid("willBePoppedOffContentController:"))){
objj_msgSend(_27,"willBePoppedOffContentController:",_20);
}
if(objj_msgSend(_27,"respondsToSelector:",sel_getUid("setParentViewController:"))){
objj_msgSend(_27,"setParentViewController:",nil);
}
if(objj_msgSend(_27,"respondsToSelector:",sel_getUid("title"))){
objj_msgSend(_27,"removeObserver:forKeyPath:",_20,"title");
}
objj_msgSend(objj_msgSend(_27,"view"),"removeFromSuperview");
if(objj_msgSend(_27,"respondsToSelector:",sel_getUid("wasPoppedOffContentController:"))){
objj_msgSend(_27,"wasPoppedOffContentController:",_20);
}
}
objj_msgSend(viewControllers,"removeObjectsInRange:",CPMakeRange(_25,_26-_25+1));
if(_23){
var _28=objj_msgSend(_20,"currentController"),_29=objj_msgSend(_28,"view");
if(objj_msgSend(_28,"respondsToSelector:",sel_getUid("willBePoppedOffContentController:"))){
objj_msgSend(_28,"willBePoppedOffContentController:",_20);
}
if(objj_msgSend(_28,"respondsToSelector:",sel_getUid("setParentViewController:"))){
objj_msgSend(_28,"setParentViewController:",nil);
}
if(objj_msgSend(_28,"respondsToSelector:",sel_getUid("title"))){
objj_msgSend(_28,"removeObserver:forKeyPath:",_20,"title");
}
objj_msgSend(viewControllers,"removeLastObject");
var _2a=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithViewAnimations:",objj_msgSend(CPArray,"arrayWithObjects:",objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_29,CPViewAnimationTargetKey,objj_msgSend(_29,"frame"),CPViewAnimationStartFrameKey,CGRectOffset(objj_msgSend(_29,"frame"),0,CGRectGetHeight(objj_msgSend(_29,"frame"))),CPViewAnimationEndFrameKey)));
objj_msgSend(_2a,"setDuration:",0.25);
objj_msgSend(_2a,"setAnimationCurve:",CPAnimationEaseIn);
objj_msgSend(_2a,"startAnimation");
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0.25,_20,sel_getUid("viewControllerPopAnimationDidFinish:"),_28,NO);
}else{
if(objj_msgSend(_22,"respondsToSelector:",sel_getUid("wasOrderedFrontByContentController:"))){
objj_msgSend(_22,"wasOrderedFrontByContentController:",_20);
}
objj_msgSend(_20,"didChangeValueForKey:","currentController");
}
objj_msgSend(_20,"synchronize");
}
}),new objj_method(sel_getUid("viewControllerPopAnimationDidFinish:"),function(_2b,_2c,_2d){
with(_2b){
var _2e=objj_msgSend(_2d,"userInfo");
objj_msgSend(objj_msgSend(_2e,"view"),"removeFromSuperview");
if(objj_msgSend(_2e,"respondsToSelector:",sel_getUid("wasPoppedOffContentController:"))){
objj_msgSend(_2e,"wasPoppedOffContentController:",_2b);
}
if(objj_msgSend(_2e,"respondsToSelector:",sel_getUid("setParentViewController:"))){
objj_msgSend(_2e,"setParentViewController:",nil);
}
objj_msgSend(_2b,"didChangeValueForKey:","currentController");
}
}),new objj_method(sel_getUid("viewControllerPushAnimationDidFinish:"),function(_2f,_30,_31){
with(_2f){
var _32=objj_msgSend(_31,"userInfo");
if(objj_msgSend(_32,"respondsToSelector:",sel_getUid("wasPushedOntoContentController:"))){
objj_msgSend(_32,"wasPushedOntoContentController:",_2f);
}
if(objj_msgSend(_32,"respondsToSelector:",sel_getUid("wasOrderedFrontByContentController:"))){
objj_msgSend(_32,"wasOrderedFrontByContentController:",_2f);
}
objj_msgSend(_2f,"didChangeValueForKey:","currentController");
}
}),new objj_method(sel_getUid("popToRootViewControllerAnimated:"),function(_33,_34,_35){
with(_33){
if(objj_msgSend(viewControllers,"count")<=1){
return;
}
objj_msgSend(_33,"popToViewController:animated:",viewControllers[0],_35);
}
}),new objj_method(sel_getUid("currentController"),function(_36,_37){
with(_36){
return objj_msgSend(viewControllers,"lastObject");
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_38,_39,_3a,_3b,_3c,_3d){
with(_38){
if(_3a=="title"&&objj_msgSend(viewControllers,"containsObject:",_3b)){
objj_msgSend(_38,"synchronize");
}else{
if(_3a=="currentController"&&_3b==_38){
var _3e=objj_msgSend(_38,"currentController");
if(objj_msgSend(_3e,"respondsToSelector:",sel_getUid("status"))){
objj_msgSend(_38,"bind:toObject:withKeyPath:options:","status",_3e,"status",nil);
}else{
objj_msgSend(_38,"unbind:","status");
objj_msgSend(_38,"setStatus:",nil);
}
}
}
}
}),new objj_method(sel_getUid("showOrHideNavigationBarForController:"),function(_3f,_40,_41){
with(_3f){
var _42=!objj_msgSend(objj_msgSend(_3f,"currentController"),"respondsToSelector:",sel_getUid("showsNavigationBar"))||objj_msgSend(objj_msgSend(_3f,"currentController"),"showsNavigationBar"),_43=!objj_msgSend(_41,"respondsToSelector:",sel_getUid("showsNavigationBar"))||objj_msgSend(_41,"showsNavigationBar");
if(_42!==_43){
objj_msgSend(navigationBar,"setFrameOrigin:",_43?navigationBarOrigin:CGPointMake(navigationBarOrigin.x,-CGRectGetHeight(objj_msgSend(navigationBar,"frame"))));
}
}
}),new objj_method(sel_getUid("synchronize"),function(_44,_45){
with(_44){
var _46=objj_msgSend(CPFont,"boldSystemFontOfSize:",12),_47=objj_msgSend("  ","sizeWithFont:",_46).width,_48=15,_49=[];
for(var i=0,_4a=objj_msgSend(viewControllers,"count");i<_4a;i++){
var _4b=viewControllers[i];
if(!objj_msgSend(_4b,"respondsToSelector:",sel_getUid("isNavigable"))||objj_msgSend(_4b,"isNavigable")){
objj_msgSend(_49,"addObject:",_4b);
}
}
var _4c=0,_4d=0;
for(var i=0,_4a=objj_msgSend(_49,"count");i<_4a;i++){
var _4b=_49[i],_4e,_4f=(objj_msgSend(_4b,"respondsToSelector:",sel_getUid("title"))&&objj_msgSend(_4b,"title"))||"";
if(objj_msgSend(_4b,"respondsToSelector:",sel_getUid("isIncludedInStackHistory"))&&!objj_msgSend(_4b,"isIncludedInStackHistory")){
continue;
}
if(_4c<objj_msgSend(links,"count")){
_4e=objj_msgSend(links,"objectAtIndex:",_4c);
}else{
_4e=objj_msgSend(objj_msgSend(LPAnchorButton,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_4e,"setFont:",_46);
objj_msgSend(_4e,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(links,"addObject:",_4e);
_4e._MMViewWithToolbar_index=i;
objj_msgSend(_4e,"setTarget:",_44);
objj_msgSend(_4e,"setAction:",sel_getUid("navigate:"));
objj_msgSend(navigationBar,"addSubview:",_4e);
}
_4c++;
_4d++;
objj_msgSend(_4e,"setTitle:",_4f+(i+1<_4a?"  »":""));
objj_msgSend(_4e,"sizeToFit");
objj_msgSend(_4e,"setFrameOrigin:",CGPointMake(_48,(CGRectGetHeight(objj_msgSend(navigationBar,"frame"))-CGRectGetHeight(objj_msgSend(_4e,"frame")))/2));
_48=CGRectGetMaxX(objj_msgSend(_4e,"frame"))+_47;
objj_msgSend(_4e,"setHidden:",NO);
}
for(var i=_4d;i<objj_msgSend(links,"count");i++){
objj_msgSend(links[i],"unbind:",CPValueBinding);
objj_msgSend(links[i],"setHidden:",YES);
}
}
}),new objj_method(sel_getUid("navigate:"),function(_50,_51,_52){
with(_50){
var _53=objj_msgSend(viewControllers,"objectAtIndex:",_52._MMViewWithToolbar_index);
if(objj_msgSend(_53,"respondsToSelector:",sel_getUid("location"))){
objj_msgSend(objj_msgSend(LPLocationController,"sharedLocationController"),"setLocation:",objj_msgSend(_53,"location"));
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("keyPathsForValuesAffectingStatus"),function(_54,_55){
with(_54){
return objj_msgSend(CPSet,"setWithObject:","currentController");
}
})]);
p;33;Frameworks/LPKit/LPAnchorButton.jt;5729;@STATIC;1.0;t;5710;
LPAnchorButtonNoUnderline=0;
LPAnchorButtonNormalUnderline=1;
LPAnchorButtonHoverUnderline=2;
var _1=objj_allocateClassPair(CPControl,"LPAnchorButton"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_underlineMask"),new objj_ivar("_title"),new objj_ivar("_URL"),new objj_ivar("_DOMAnchorElement")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("underlineMask"),function(_3,_4){
with(_3){
return _underlineMask;
}
}),new objj_method(sel_getUid("setUnderlineMask:"),function(_5,_6,_7){
with(_5){
_underlineMask=_7;
}
}),new objj_method(sel_getUid("title"),function(_8,_9){
with(_8){
return _title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_a,_b,_c){
with(_a){
_title=_c;
}
}),new objj_method(sel_getUid("init"),function(_d,_e){
with(_d){
if(_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("LPAnchorButton").super_class},"init")){
_underlineMask=LPAnchorButtonNormalUnderline|LPAnchorButtonHoverUnderline;
}
return _d;
}
}),new objj_method(sel_getUid("setTitle:"),function(_f,_10,_11){
with(_f){
_title=_11;
objj_msgSend(_f,"setNeedsLayout");
}
}),new objj_method(sel_getUid("openURLOnClick:"),function(_12,_13,_14){
with(_12){
_URL=_14;
objj_msgSend(_12,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setTextColor:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_15,"setValue:forThemeAttribute:",_17,"text-color");
}
}),new objj_method(sel_getUid("setTextHoverColor:"),function(_18,_19,_1a){
with(_18){
objj_msgSend(_18,"setValue:forThemeAttribute:inState:",_1a,"text-color",CPThemeStateHighlighted);
}
}),new objj_method(sel_getUid("mouseEntered:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1b,"setThemeState:",CPThemeStateHighlighted);
}
}),new objj_method(sel_getUid("mouseExited:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(_1e,"unsetThemeState:",CPThemeStateHighlighted);
}
}),new objj_method(sel_getUid("mouseDown:"),function(_21,_22,_23){
with(_21){
if(_URL){
objj_msgSend(objj_msgSend(objj_msgSend(_21,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}else{
objj_msgSendSuper({receiver:_21,super_class:objj_getClass("LPAnchorButton").super_class},"mouseDown:",_23);
}
}
}),new objj_method(sel_getUid("sizeToFit"),function(_24,_25){
with(_24){
objj_msgSend(_24,"setFrameSize:",objj_msgSend((_title||" "),"sizeWithFont:",objj_msgSend(_24,"currentValueForThemeAttribute:","font")));
}
}),new objj_method(sel_getUid("rectForEphemeralSubviewNamed:"),function(_26,_27,_28){
with(_26){
return objj_msgSend(_26,"bounds");
}
}),new objj_method(sel_getUid("createEphemeralSubviewNamed:"),function(_29,_2a,_2b){
with(_29){
return objj_msgSend(objj_msgSend(_CPImageAndTextView,"alloc"),"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_2c,_2d){
with(_2c){
_DOMElement.style.cursor="pointer";
if(_URL){
if(!_DOMAnchorElement){
_DOMAnchorElement=document.createElement("a");
_DOMAnchorElement.target="_blank";
_DOMAnchorElement.style.position="absolute";
_DOMAnchorElement.style.zIndex="100";
_2c._DOMElement.appendChild(_DOMAnchorElement);
}
_DOMAnchorElement.href=typeof _URL=="string"?_URL:objj_msgSend(_URL,"absoluteString");
var _2e=objj_msgSend(_2c,"bounds");
_DOMAnchorElement.style.width=CGRectGetWidth(_2e)+"px";
_DOMAnchorElement.style.height=CGRectGetHeight(_2e)+"px";
}
var _2f="none";
if(((_themeState===CPThemeStateNormal||_themeState===CPThemeStateSelected)&&(_underlineMask&LPAnchorButtonNormalUnderline))||((_themeState&CPThemeStateHighlighted)&&(_underlineMask&LPAnchorButtonHoverUnderline))){
_2f="underline";
}
var _30=objj_msgSend(_2c,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,nil);
if(_30){
objj_msgSend(_30,"setText:",_title);
objj_msgSend(_30,"setTextColor:",objj_msgSend(_2c,"currentValueForThemeAttribute:","text-color"));
objj_msgSend(_30,"setFont:",objj_msgSend(_2c,"currentValueForThemeAttribute:","font"));
objj_msgSend(_30,"setAlignment:",objj_msgSend(_2c,"currentValueForThemeAttribute:","alignment"));
objj_msgSend(_30,"setVerticalAlignment:",objj_msgSend(_2c,"currentValueForThemeAttribute:","vertical-alignment"));
objj_msgSend(_30,"setLineBreakMode:",objj_msgSend(_2c,"currentValueForThemeAttribute:","line-break-mode"));
objj_msgSend(_30,"setTextShadowColor:",objj_msgSend(_2c,"currentValueForThemeAttribute:","text-shadow-color"));
objj_msgSend(_30,"setTextShadowOffset:",objj_msgSend(_2c,"currentValueForThemeAttribute:","text-shadow-offset"));
if(_30._DOMTextElement){
_30._DOMTextElement.style.textDecoration=_2f;
}
if(_30._DOMTextShadowElement){
_30._DOMTextShadowElement.style.textDecoration=_2f;
}
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("buttonWithTitle:"),function(_31,_32,_33){
with(_31){
var _34=objj_msgSend(objj_msgSend(_31,"alloc"),"init");
objj_msgSend(_34,"setTitle:",_33);
objj_msgSend(_34,"sizeToFit");
return _34;
}
})]);
var _35="LPAnchorButtonUnderlineMaskKey";
var _1=objj_getClass("LPAnchorButton");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"LPAnchorButton\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_36,_37,_38){
with(_36){
if(_36=objj_msgSendSuper({receiver:_36,super_class:objj_getClass("LPAnchorButton").super_class},"initWithCoder:",_38)){
_underlineMask=objj_msgSend(_38,"decodeIntForKey:",_35)||LPAnchorButtonNoUnderline;
}
return _36;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_39,_3a,_3b){
with(_39){
objj_msgSendSuper({receiver:_39,super_class:objj_getClass("LPAnchorButton").super_class},"encodeWithCoder:",_3b);
if(_underlineMask!==LPAnchorButtonNoUnderline){
objj_msgSend(_3b,"encodeInt:forKey:",_underlineMask,_35);
}
}
})]);
p;34;Controllers/MMRootViewController.jt;2306;@STATIC;1.0;i;18;../Models/MMHome.ji;18;MMViewController.ji;22;MMHomeViewController.ji;40;MMMetadataItemCollectionViewController.jt;2169;
objj_executeFile("../Models/MMHome.j",YES);
objj_executeFile("MMViewController.j",YES);
objj_executeFile("MMHomeViewController.j",YES);
objj_executeFile("MMMetadataItemCollectionViewController.j",YES);
var _1=objj_allocateClassPair(MMViewController,"MMRootViewController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("content")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("content"),function(_3,_4){
with(_3){
return content;
}
}),new objj_method(sel_getUid("setContent:"),function(_5,_6,_7){
with(_5){
content=_7;
}
}),new objj_method(sel_getUid("children"),function(_8,_9){
with(_8){
return objj_msgSend(CPArray,"arrayWithObject:",content);
}
}),new objj_method(sel_getUid("viewControllerForChild:"),function(_a,_b,_c){
with(_a){
if(_c===objj_msgSend(MMHome,"sharedHome")){
return objj_msgSend(objj_msgSend(MMHomeViewController,"alloc"),"init");
}else{
if(objj_msgSend(_c,"isKindOfClass:",objj_msgSend(PMCDirectoryObject,"class"))){
return objj_msgSend(objj_msgSend(MMMetadataItemCollectionViewController,"alloc"),"init");
}
}
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(CPString,"stringWithFormat:","expected argument to be an MMHome or PMCDirectoryObject but got %@ instead",CPStringFromClass(objj_msgSend(_c,"class"))));
}
}),new objj_method(sel_getUid("isIncludedInStackHistory"),function(_d,_e){
with(_d){
return NO;
}
}),new objj_method(sel_getUid("setContent:"),function(_f,_10,_11){
with(_f){
content=_11;
objj_msgSend(_f,"restoreChildState");
}
}),new objj_method(sel_getUid("loadView"),function(_12,_13){
with(_12){
objj_msgSend(_12,"setView:",objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero()));
}
}),new objj_method(sel_getUid("path"),function(_14,_15){
with(_14){
return "";
}
}),new objj_method(sel_getUid("location"),function(_16,_17){
with(_16){
return "";
}
}),new objj_method(sel_getUid("childPath"),function(_18,_19){
with(_18){
return objj_msgSend(objj_msgSend(_18,"content"),"path");
}
}),new objj_method(sel_getUid("childPaths"),function(_1a,_1b){
with(_1a){
return objj_msgSend(CPArray,"arrayWithObject:",objj_msgSend(_1a,"childPath"));
}
})]);
p;34;Controllers/MMHomeViewController.jt;3509;@STATIC;1.0;i;33;../Controllers/MMViewController.ji;55;../Controllers/MMMetadataItemCollectionViewController.ji;21;../Views/MMHomeView.ji;35;../Views/MMCollectionViewItemCell.ji;39;../Views/MMMetadataItemCollectionView.ji;35;../Views/MMSectionTypeChooserView.ji;18;../Models/MMHome.jt;3219;
objj_executeFile("../Controllers/MMViewController.j",YES);
objj_executeFile("../Controllers/MMMetadataItemCollectionViewController.j",YES);
objj_executeFile("../Views/MMHomeView.j",YES);
objj_executeFile("../Views/MMCollectionViewItemCell.j",YES);
objj_executeFile("../Views/MMMetadataItemCollectionView.j",YES);
objj_executeFile("../Views/MMSectionTypeChooserView.j",YES);
objj_executeFile("../Models/MMHome.j",YES);
var _1=objj_allocateClassPair(MMViewController,"MMHomeViewController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("recentlyAdded"),new objj_ivar("dataSource"),new objj_ivar("homeView"),new objj_ivar("recentlyAddedController")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMHomeViewController").super_class},"init")){
recentlyAdded=objj_msgSend(objj_msgSend(PMCDirectoryObject,"alloc"),"init");
objj_msgSend(recentlyAdded,"setKey:","/library/recentlyAdded");
dataSource=objj_msgSend(objj_msgSend(MMLibraryMediaDataSource,"alloc"),"initWithDelegate:",_3);
}
return _3;
}
}),new objj_method(sel_getUid("loadView"),function(_5,_6){
with(_5){
objj_msgSend(dataSource,"refreshRecordsWithContextInfo:",recentlyAdded);
recentlyAddedController=objj_msgSend(objj_msgSend(MMMetadataItemCollectionViewController,"alloc"),"initWithToolbar:",NO);
objj_msgSend(recentlyAddedController,"setContent:",recentlyAdded);
var _7=objj_msgSend(objj_msgSend(MMSectionTypeChooserView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_7,"sizeToFit");
objj_msgSend(_7,"setDelegate:",_5);
homeView=objj_msgSend(objj_msgSend(MMHomeView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(homeView,"addSectionWithTitle:contentView:",CPLocalizedString("ADD MEDIA TO YOUR LIBRARY","Home screen section title"),_7);
objj_msgSend(homeView,"addSectionWithTitle:contentView:",CPLocalizedString("RECENTLY ADDED","Home screen section title"),objj_msgSend(recentlyAddedController,"view"));
objj_msgSend(_5,"setView:",homeView);
}
}),new objj_method(sel_getUid("content"),function(_8,_9){
with(_8){
return objj_msgSend(MMHome,"sharedHome");
}
}),new objj_method(sel_getUid("showsNavigationBar"),function(_a,_b){
with(_a){
return NO;
}
}),new objj_method(sel_getUid("dataSource:didReceiveRecords:contextInfo:"),function(_c,_d,_e,_f,_10){
with(_c){
}
}),new objj_method(sel_getUid("sectionTypeChooser:didChooseWithTemplate:"),function(_11,_12,_13,_14){
with(_11){
var _15=objj_msgSend(objj_msgSend(MMSectionSettingsSheet,"alloc"),"initWithDataSource:",objj_msgSend(MMLibrarySectionsDataSource,"sharedDataSource"));
objj_msgSend(_15,"beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:",objj_msgSend(_13,"window"),nil,nil,_14);
}
}),new objj_method(sel_getUid("children"),function(_16,_17){
with(_16){
return objj_msgSend(recentlyAddedController,"children");
}
}),new objj_method(sel_getUid("providesBackground"),function(_18,_19){
with(_18){
return NO;
}
}),new objj_method(sel_getUid("isNavigable"),function(_1a,_1b){
with(_1a){
return YES;
}
}),new objj_method(sel_getUid("title"),function(_1c,_1d){
with(_1c){
return objj_msgSend(objj_msgSend(_1c,"content"),"title");
}
})]);
p;18;Views/MMHomeView.jt;3847;@STATIC;1.0;I;15;AppKit/CPView.jI;22;LPKit/LPAnchorButton.ji;17;MMSectionedView.ji;13;MMImageView.ji;17;MMSelectionView.jt;3719;
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("LPKit/LPAnchorButton.j",NO);
objj_executeFile("MMSectionedView.j",YES);
objj_executeFile("MMImageView.j",YES);
objj_executeFile("MMSelectionView.j",YES);
var _1=objj_allocateClassPair(CPView,"MMHomeView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("sectionedView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMHomeView").super_class},"initWithFrame:",_5)){
sectionedView=objj_msgSend(objj_msgSend(MMSectionedView,"alloc"),"initWithFrame:",_5);
objj_msgSend(sectionedView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(sectionedView,"setMargin:",30);
objj_msgSend(sectionedView,"setInset:",CGSizeMake(0,1));
objj_msgSend(_3,"addSubview:",sectionedView);
}
return _3;
}
}),new objj_method(sel_getUid("addSectionWithTitle:contentView:"),function(_6,_7,_8,_9){
with(_6){
objj_msgSend(sectionedView,"addSection:",objj_msgSend(_MMHomeBannerView,"bannerWithTitle:",_8));
objj_msgSend(sectionedView,"addSection:",_9);
}
})]);
var _1=objj_allocateClassPair(CPView,"_MMHomeBannerView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("label"),new objj_ivar("box"),new objj_ivar("title")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("title"),function(_a,_b){
with(_a){
return title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_c,_d,_e){
with(_c){
title=_e;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_f,_10,_11){
with(_f){
if(_f=objj_msgSendSuper({receiver:_f,super_class:objj_getClass("_MMHomeBannerView").super_class},"initWithFrame:",_11)){
label=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(label,"setTextColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",83/255,1));
objj_msgSend(label,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",24));
objj_msgSend(label,"sizeToFit");
var _12=objj_msgSend(objj_msgSend(_f,"class"),"margin");
box=objj_msgSend(objj_msgSend(CPBox,"alloc"),"initWithFrame:",CGRectMake(0,0,CGRectGetWidth(_11),CGRectGetHeight(objj_msgSend(label,"frame"))+2*_12.height));
objj_msgSend(box,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(box,"setFillColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",19/255,1));
objj_msgSend(box,"setBorderColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(box,"setBorderType:",CPLineBorder);
objj_msgSend(box,"setContentViewMargins:",_12);
objj_msgSend(box,"setContentView:",label);
objj_msgSend(_f,"addSubview:",box);
}
return _f;
}
}),new objj_method(sel_getUid("setTitle:"),function(_13,_14,_15){
with(_13){
title=_15;
objj_msgSend(label,"setStringValue:",title);
objj_msgSend(_13,"setNeedsLayout");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_16,_17){
with(_16){
objj_msgSend(label,"sizeToFit");
objj_msgSendSuper({receiver:_16,super_class:objj_getClass("_MMHomeBannerView").super_class},"layoutSubviews");
}
}),new objj_method(sel_getUid("sizeToFitWithInset:adjustWidth:adjustHeight:"),function(_18,_19,_1a,_1b,_1c){
with(_18){
objj_msgSend(label,"sizeToFit");
objj_msgSend(box,"sizeToFit");
objj_msgSend(_18,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_1b?box:_18,"frame")),CGRectGetHeight(objj_msgSend(_1c?box:_18,"frame"))));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("bannerWithTitle:"),function(_1d,_1e,_1f){
with(_1d){
var _20=objj_msgSend(objj_msgSend(_1d,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_20,"setTitle:",_1f);
objj_msgSend(_20,"sizeToFit");
return _20;
}
}),new objj_method(sel_getUid("margin"),function(_21,_22){
with(_21){
return CGSizeMake(20,8);
}
})]);
p;23;Views/MMSectionedView.jt;2003;@STATIC;1.0;I;15;AppKit/CPView.jt;1964;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"MMSectionedView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("sections"),new objj_ivar("sectionHeights"),new objj_ivar("inset"),new objj_ivar("margin")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("inset"),function(_3,_4){
with(_3){
return inset;
}
}),new objj_method(sel_getUid("setInset:"),function(_5,_6,_7){
with(_5){
inset=_7;
}
}),new objj_method(sel_getUid("margin"),function(_8,_9){
with(_8){
return margin;
}
}),new objj_method(sel_getUid("setMargin:"),function(_a,_b,_c){
with(_a){
margin=_c;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
if(_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("MMSectionedView").super_class},"initWithFrame:",_f)){
sections=objj_msgSend(CPMutableArray,"array");
sectionHeights=objj_msgSend(CPMutableArray,"array");
inset=CGSizeMakeZero();
margin=0;
}
return _d;
}
}),new objj_method(sel_getUid("addSection:"),function(_10,_11,_12){
with(_10){
objj_msgSend(sections,"addObject:",_12);
objj_msgSend(sectionHeights,"addObject:",CGRectGetHeight(objj_msgSend(_12,"frame")));
objj_msgSend(_10,"addSubview:",_12);
objj_msgSend(_10,"setNeedsLayout");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_13,_14){
with(_13){
CPLog.info("Layout out sectioned subviews");
var _15=CGPointMake(inset.width,inset.height);
var _16=CGRectGetHeight(objj_msgSend(_13,"bounds"));
for(var i=0,_17=objj_msgSend(sections,"count");i<_17;i++){
var _18=objj_msgSend(sections,"objectAtIndex:",i);
var _19=objj_msgSend(sectionHeights,"objectAtIndex:",i);
var _1a=_16-_15.y;
objj_msgSend(_18,"setFrame:",{origin:_15,size:CGSizeMake(CGRectGetWidth(objj_msgSend(_13,"frame")),_19<_1a?_19:_1a)});
_15=CGPointMake(_15.x,CGRectGetMaxY(objj_msgSend(_18,"frame"))+margin);
}
objj_msgSendSuper({receiver:_13,super_class:objj_getClass("MMSectionedView").super_class},"layoutSubviews");
}
})]);
p;32;Views/MMSectionTypeChooserView.jt;10085;@STATIC;1.0;I;15;AppKit/CPView.jI;18;AppKit/CPControl.jt;10022;
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("AppKit/CPControl.j",NO);
var _1=objj_msgSend(CPColor,"colorWithWhite:alpha:",110/255,1);
var _2=objj_allocateClassPair(CPView,"MMSectionTypeChooserView"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("delegate")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("delegate"),function(_4,_5){
with(_4){
return delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_6,_7,_8){
with(_6){
delegate=_8;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_9,_a,_b){
with(_9){
if(_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("MMSectionTypeChooserView").super_class},"initWithFrame:",_b)){
var _c=nil,_d=nil;
_c=CGRectMake(27,0,225,80);
var _e=CGSizeMake(50,50);
_d=objj_msgSend(objj_msgSend(_MMHomeSectionButton,"alloc"),"initWithFrame:",_c);
objj_msgSend(_d,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","movies_100x100.png"),_e));
objj_msgSend(_d,"setTitle:",CPLocalizedString("Movies","Media type title"));
objj_msgSend(_d,"setSubtitle:",CPLocalizedString("Movie posters & art","Home screen line item"));
objj_msgSend(_d,"setTarget:",_9);
objj_msgSend(_d,"setAction:",sel_getUid("chooseMovieSection:"));
objj_msgSend(_9,"addSubview:",_d);
_d=objj_msgSend(objj_msgSend(_MMHomeSectionButton,"alloc"),"initWithFrame:",CGRectOffset(_c,CGRectGetWidth(objj_msgSend(_d,"frame")),0));
objj_msgSend(_d,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","tv_100x100.png"),_e));
objj_msgSend(_d,"setTitle:",CPLocalizedString("TV Shows","Media type title"));
objj_msgSend(_d,"setSubtitle:",CPLocalizedString("Posters, art & theme music","Home screen line item"));
objj_msgSend(_d,"setTarget:",_9);
objj_msgSend(_d,"setAction:",sel_getUid("chooseTVSection:"));
objj_msgSend(_9,"addSubview:",_d);
if(objj_msgSend(objj_msgSend(PMSCapabilities,"sharedPMSCapabilities"),"photoSectionsSupported")){
_d=objj_msgSend(objj_msgSend(_MMHomeSectionButton,"alloc"),"initWithFrame:",CGRectOffset(_c,2*CGRectGetWidth(objj_msgSend(_d,"frame")),0));
objj_msgSend(_d,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","pictures_100x100.png"),_e));
objj_msgSend(_d,"setTitle:",CPLocalizedString("Photos","Media type title"));
objj_msgSend(_d,"setSubtitle:",CPLocalizedString("JPEG, PNG, RAW & more","Home screen line item"));
objj_msgSend(_d,"setTarget:",_9);
objj_msgSend(_d,"setAction:",sel_getUid("choosePhotoSection:"));
objj_msgSend(_9,"addSubview:",_d);
}
_d=objj_msgSend(objj_msgSend(_MMHomeSectionButton,"alloc"),"initWithFrame:",CGRectOffset(_c,0,CGRectGetHeight(objj_msgSend(_d,"frame"))));
objj_msgSend(_d,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","video_100x100.png"),_e));
objj_msgSend(_d,"setTitle:",CPLocalizedString("Home Movies","Media type title"));
objj_msgSend(_d,"setSubtitle:",CPLocalizedString("Great for personal media","Home screen line item"));
objj_msgSend(_d,"setTarget:",_9);
objj_msgSend(_d,"setAction:",sel_getUid("chooseHomeMovieSection:"));
objj_msgSend(_9,"addSubview:",_d);
_d=objj_msgSend(objj_msgSend(_MMHomeSectionButton,"alloc"),"initWithFrame:",CGRectOffset(_c,CGRectGetWidth(objj_msgSend(_d,"frame")),CGRectGetHeight(objj_msgSend(_d,"frame"))));
objj_msgSend(_d,"setImage:",objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","music_100x100.png"),_e));
objj_msgSend(_d,"setTitle:",CPLocalizedString("Music","Media type title"));
objj_msgSend(_d,"setSubtitle:",CPLocalizedString("Biographies & reviews","Home screen line item"));
objj_msgSend(_d,"setTarget:",_9);
objj_msgSend(_d,"setAction:",sel_getUid("chooseMusicSection:"));
objj_msgSend(_9,"addSubview:",_d);
}
return _9;
}
}),new objj_method(sel_getUid("chooseMovieSection:"),function(_f,_10,_11){
with(_f){
objj_msgSend(_f,"chooseType:agent:title:",MMLibrarySectionTypeMovie,MMLibrarySectionDefaultMoviesAgent,objj_msgSend(_11,"title"));
}
}),new objj_method(sel_getUid("chooseTVSection:"),function(_12,_13,_14){
with(_12){
objj_msgSend(_12,"chooseType:agent:title:",MMLibrarySectionTypeShow,MMLibrarySectionDefaultTVAgent,objj_msgSend(_14,"title"));
}
}),new objj_method(sel_getUid("chooseHomeMovieSection:"),function(_15,_16,_17){
with(_15){
objj_msgSend(_15,"chooseType:agent:title:",MMLibrarySectionTypeMovie,MMPersonalMediaAgent,objj_msgSend(_17,"title"));
}
}),new objj_method(sel_getUid("chooseMusicSection:"),function(_18,_19,_1a){
with(_18){
objj_msgSend(_18,"chooseType:agent:title:",MMLibrarySectionTypeArtist,MMLibrarySectionDefaultArtistAgent,objj_msgSend(_1a,"title"));
}
}),new objj_method(sel_getUid("choosePhotoSection:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(_1b,"chooseType:agent:title:",MMLibrarySectionTypePhoto,MMLibrarySectionDefaultPhotoAgent,objj_msgSend(_1d,"title"));
}
}),new objj_method(sel_getUid("chooseType:agent:title:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
if(!delegate){
return;
}
var _23=objj_msgSend(objj_msgSend(MMLibrarySection,"alloc"),"init");
objj_msgSend(_23,"setType:",_20);
objj_msgSend(_23,"setAgent:",_21);
objj_msgSend(_23,"setTitle:",_22);
objj_msgSend(delegate,"sectionTypeChooser:didChooseWithTemplate:",_1e,_23);
}
})]);
var _2=objj_allocateClassPair(CPControl,"_MMHomeSectionButton"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("title"),new objj_ivar("image"),new objj_ivar("subtitles"),new objj_ivar("nextSubtitleOrigin"),new objj_ivar("imageView"),new objj_ivar("actionButton"),new objj_ivar("subtitleButton")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("title"),function(_24,_25){
with(_24){
return title;
}
}),new objj_method(sel_getUid("setTitle:"),function(_26,_27,_28){
with(_26){
title=_28;
}
}),new objj_method(sel_getUid("image"),function(_29,_2a){
with(_29){
return image;
}
}),new objj_method(sel_getUid("setImage:"),function(_2b,_2c,_2d){
with(_2b){
image=_2d;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_2e,_2f,_30){
with(_2e){
if(_2e=objj_msgSendSuper({receiver:_2e,super_class:objj_getClass("_MMHomeSectionButton").super_class},"initWithFrame:",_30)){
imageView=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(10,0,100,100));
objj_msgSend(imageView,"bind:toObject:withKeyPath:options:","image",_2e,"image",nil);
objj_msgSend(_2e,"addSubview:",imageView);
actionButton=objj_msgSend(LPAnchorButton,"buttonWithTitle:","");
objj_msgSend(actionButton,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",18));
objj_msgSend(actionButton,"sizeToFit");
objj_msgSend(actionButton,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(imageView,"frame"))+10,CGRectGetMinY(objj_msgSend(imageView,"frame"))+5));
objj_msgSend(actionButton,"setUnderlineMask:",LPAnchorButtonNoUnderline);
objj_msgSend(actionButton,"setTextColor:",MMSelectionViewDefaultGradientStartColor);
objj_msgSend(actionButton,"bind:toObject:withKeyPath:options:","title",_2e,"title",nil);
objj_msgSend(actionButton,"bind:toObject:withKeyPath:options:","target",_2e,"target",nil);
objj_msgSend(actionButton,"bind:toObject:withKeyPath:options:","action",_2e,"action",nil);
subtitleButton=objj_msgSend(LPAnchorButton,"buttonWithTitle:","");
objj_msgSend(subtitleButton,"setUnderlineMask:",LPAnchorButtonNoUnderline);
objj_msgSend(subtitleButton,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(subtitleButton,"sizeToFit");
objj_msgSend(subtitleButton,"setTextColor:",_1);
objj_msgSend(subtitleButton,"setFrameOrigin:",objj_msgSend(_2e,"nextSubtitleOrigin:",nil));
objj_msgSend(subtitleButton,"setAction:",sel_getUid("performClick:"));
objj_msgSend(subtitleButton,"setTarget:",_2e);
objj_msgSend(_2e,"addSubview:",subtitleButton);
_DOMElement.style.cursor="pointer";
objj_msgSend(_2e,"addSubview:",actionButton);
}
return _2e;
}
}),new objj_method(sel_getUid("setImage:"),function(_31,_32,_33){
with(_31){
image=_33;
objj_msgSend(_31,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setSubtitle:"),function(_34,_35,_36){
with(_34){
objj_msgSend(subtitleButton,"setTitle:",_36);
objj_msgSend(subtitleButton,"sizeToFit");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_37,_38){
with(_37){
objj_msgSend(imageView,"setFrameSize:",objj_msgSend(image,"size"));
objj_msgSend(imageView,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(imageView,"frame")),(CGRectGetHeight(objj_msgSend(_37,"frame"))-CGRectGetHeight(objj_msgSend(imageView,"frame")))/2));
objj_msgSend(actionButton,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(imageView,"frame"))+10,CGRectGetMinY(objj_msgSend(imageView,"frame"))+5));
objj_msgSend(actionButton,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_37,"frame"))-CGRectGetMaxX(objj_msgSend(imageView,"frame")),CGRectGetHeight(objj_msgSend(actionButton,"frame"))));
objj_msgSend(subtitleButton,"setFrameOrigin:",objj_msgSend(_37,"nextSubtitleOrigin:",actionButton));
objj_msgSendSuper({receiver:_37,super_class:objj_getClass("_MMHomeSectionButton").super_class},"layoutSubviews");
}
}),new objj_method(sel_getUid("nextSubtitleOrigin:"),function(_39,_3a,_3b){
with(_39){
_3b||(_3b=(objj_msgSend(subtitles,"count")?objj_msgSend(subtitles,"objectAtIndex:",objj_msgSend(subtitles,"count")-1):actionButton));
return CGPointMake(CGRectGetMinX(objj_msgSend(_3b,"frame")),CGRectGetMaxY(objj_msgSend(_3b,"frame"))+3);
}
}),new objj_method(sel_getUid("mouseEntered:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSend(_3c,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",51/255,1));
}
}),new objj_method(sel_getUid("mouseExited:"),function(_3f,_40,_41){
with(_3f){
objj_msgSend(_3f,"setBackgroundColor:",nil);
}
})]);
p;27;Views/MMActionPopUpButton.jt;677;@STATIC;1.0;I;22;AppKit/CPPopUpButton.jI;20;AppKit/CPButtonBar.jI;17;AppKit/CPButton.jt;585;
objj_executeFile("AppKit/CPPopUpButton.j",NO);
objj_executeFile("AppKit/CPButtonBar.j",NO);
objj_executeFile("AppKit/CPButton.j",NO);
var _1=objj_allocateClassPair(CPPopUpButton,"MMActionPopUpButton"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("button"),function(_3,_4){
with(_3){
var _5=objj_msgSend(CPButtonBar,"actionPopupButton");
_5.isa=_3;
objj_msgSend(_5,"setValue:forThemeAttribute:",objj_msgSend(objj_msgSend(objj_msgSend(CPButton,"alloc"),"init"),"currentValueForThemeAttribute:","bezel-color"),"bezel-color");
return _5;
}
})]);
p;19;Views/MMContainer.jt;666;@STATIC;1.0;I;15;AppKit/CPView.jt;628;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","MMContainerBackground.png"));
var _2=objj_allocateClassPair(CPView,"MMContainer"),_3=_2.isa;
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithFrame:"),function(_4,_5,_6){
with(_4){
if(_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("MMContainer").super_class},"initWithFrame:",_6)){
objj_msgSend(_4,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithPatternImage:",_1));
}
return _4;
}
})]);
p;41;Views/MMInternetExplorerNotificationBar.jt;7408;@STATIC;1.0;I;17;AppKit/CPButton.jt;7367;
objj_executeFile("AppKit/CPButton.j",NO);
var _1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","ie-notification-icon.png"),CGSizeMake(14,16));
var _2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","ie-notification-close.png"),CGSizeMake(8,8));
var _3=objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",255/255,255/255,225/255,1);
var _4=objj_msgSend(CPColor,"blackColor");
var _5=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","ie-notification-icon-selected.png"),CGSizeMake(14,16));
var _6=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","ie-notification-close-selected.png"),CGSizeMake(8,8));
var _7=objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",49/255,106/255,197/255,1);
var _8=objj_msgSend(CPColor,"whiteColor");
var _9=21;
InternetExplorerVersion=(getInternetExplorerVersion=function(){
var rv=-1;
try{
if(navigator.appName=="Microsoft Internet Explorer"){
var ua=navigator.userAgent;
var re=new RegExp("MSIE ([0-9]{1,}[.0-9]{0,})");
if(re.exec(ua)!=null){
rv=parseFloat(RegExp.$1);
}
}
}
catch(ex){
}
return rv;
})();
var _a=objj_allocateClassPair(CPButton,"MMInternetExplorerNotificationBar"),_b=_a.isa;
class_addIvars(_a,[new objj_ivar("_icon"),new objj_ivar("_closeButton"),new objj_ivar("_label"),new objj_ivar("_dismissAction")]);
objj_registerClassPair(_a);
class_addMethods(_a,[new objj_method(sel_getUid("dismissAction"),function(_c,_d){
with(_c){
return _dismissAction;
}
}),new objj_method(sel_getUid("setDismissAction:"),function(_e,_f,_10){
with(_e){
_dismissAction=_10;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_11,_12,_13){
with(_11){
if(_11=objj_msgSendSuper({receiver:_11,super_class:objj_getClass("MMInternetExplorerNotificationBar").super_class},"initWithFrame:",_13)){
objj_msgSend(_11,"setBackgroundColor:",_3);
objj_msgSend(_11,"setBordered:",NO);
_icon=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_icon,"setImage:",_1);
objj_msgSend(_icon,"setFrameSize:",objj_msgSend(_1,"size"));
objj_msgSend(_icon,"setFrameOrigin:",CGPointMake(5,(CGRectGetHeight(_13)-CGRectGetHeight(objj_msgSend(_icon,"frame")))/2));
objj_msgSend(_icon,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_11,"addSubview:",_icon);
_closeButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(_closeButton,"setFrameSize:",objj_msgSend(_2,"size"));
objj_msgSend(_closeButton,"setFrameOrigin:",CGPointMake(CGRectGetWidth(_13)-7-CGRectGetWidth(objj_msgSend(_closeButton,"frame")),(CGRectGetHeight(_13)-CGRectGetHeight(objj_msgSend(_closeButton,"frame")))/2));
objj_msgSend(_closeButton,"setAutoresizingMask:",CPViewMinYMargin|CPViewMaxYMargin|CPViewMinXMargin);
objj_msgSend(_closeButton,"setBordered:",NO);
objj_msgSend(_closeButton,"setImagePosition:",CPImageOnly);
objj_msgSend(_closeButton,"setImage:",_2);
objj_msgSend(_closeButton,"setTarget:",_11);
objj_msgSend(_closeButton,"setAction:",sel_getUid("close:"));
objj_msgSend(_11,"addSubview:",_closeButton);
_label=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(_label,"setTextColor:",_4);
objj_msgSend(_label,"setAlignment:",CPLeftTextAlignment);
objj_msgSend(_label,"setAutoresizingMask:",CPViewWidthSizable|CPViewMinYMargin|CPViewMaxYMargin);
objj_msgSend(_label,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(_icon,"frame"))+5,(CGRectGetHeight(_13)-CGRectGetHeight(objj_msgSend(_label,"frame")))/2));
objj_msgSend(_label,"setFrameSize:",CGSizeMake(CGRectGetWidth(_13)-(CGRectGetWidth(_13)-CGRectGetMinX(objj_msgSend(_closeButton,"frame"))+5)-CGRectGetMinX(objj_msgSend(_label,"frame")),CGRectGetHeight(objj_msgSend(_label,"frame"))));
objj_msgSend(_11,"addSubview:",_label);
}
return _11;
}
}),new objj_method(sel_getUid("title"),function(_14,_15){
with(_14){
return objj_msgSend(_label,"stringValue");
}
}),new objj_method(sel_getUid("setTitle:"),function(_16,_17,_18){
with(_16){
objj_msgSend(_label,"setStringValue:",_18);
}
}),new objj_method(sel_getUid("hitTest:"),function(_19,_1a,_1b){
with(_19){
var _1c=objj_msgSendSuper({receiver:_19,super_class:objj_getClass("MMInternetExplorerNotificationBar").super_class},"hitTest:",_1b),_1d=_1c;
while(_1d){
if(_1d==_icon){
return _19;
}else{
_1d=objj_msgSend(_1d,"superview");
}
}
return _1c;
}
}),new objj_method(sel_getUid("mouseEntered:"),function(_1e,_1f,_20){
with(_1e){
objj_msgSend(objj_msgSend(CPCursor,"pointingHandCursor"),"set");
objj_msgSend(_1e,"setBackgroundColor:",_7);
objj_msgSend(_icon,"setImage:",_5);
objj_msgSend(_closeButton,"setImage:",_6);
objj_msgSend(_label,"setTextColor:",_8);
}
}),new objj_method(sel_getUid("mouseExited:"),function(_21,_22,_23){
with(_21){
var _24=objj_msgSend(CPEvent,"mouseLocation"),_25=objj_msgSend(_21,"convertPoint:fromView:",_24,nil);
if(CGRectContainsPoint(objj_msgSend(_21,"bounds"),_25)){
return;
}
objj_msgSend(objj_msgSend(CPCursor,"arrowCursor"),"set");
objj_msgSend(_21,"setBackgroundColor:",_3);
objj_msgSend(_icon,"setImage:",_1);
objj_msgSend(_closeButton,"setImage:",_2);
objj_msgSend(_label,"setTextColor:",_4);
}
}),new objj_method(sel_getUid("close:"),function(_26,_27,_28){
with(_26){
if(_dismissAction){
objj_msgSend(_26,"sendAction:to:",_dismissAction,objj_msgSend(_26,"target"));
}
}
}),new objj_method(sel_getUid("removeFromSuperview"),function(_29,_2a){
with(_29){
objj_msgSend(objj_msgSend(CPCursor,"arrowCursor"),"set");
objj_msgSendSuper({receiver:_29,super_class:objj_getClass("MMInternetExplorerNotificationBar").super_class},"removeFromSuperview");
}
})]);
class_addMethods(_b,[new objj_method(sel_getUid("installBarWithTitle:aboveView:animated:"),function(_2b,_2c,_2d,_2e,_2f){
with(_2b){
var _30=_2e,_31=nil,bar=nil,_32=nil;
bar=objj_msgSend(objj_msgSend(_2b,"alloc"),"initWithFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(_2e,"frame")),CGRectGetMinY(objj_msgSend(_2e,"frame")),CGRectGetWidth(objj_msgSend(_2e,"frame")),_9));
if(objj_msgSend(_2e,"autoresizingMask")&CPViewWidthSizable){
objj_msgSend(bar,"setAutoresizingMask:",CPViewWidthSizable);
}
_32=CGRectOffset(objj_msgSend(bar,"frame"),0,-_9);
objj_msgSend(bar,"setTitle:",_2d);
if(objj_msgSend(_2e,"autoresizingMask")&(CPViewMinYMargin|CPViewHeightSizable)){
_31=CGRectOffset(CGRectInset(objj_msgSend(_2e,"frame"),0,_9/2),0,_9/2);
}else{
_31=CGRectOffset(objj_msgSend(_2e,"frame"),0,_9);
}
objj_msgSend(objj_msgSend(_2e,"superview"),"addSubview:",bar);
if(_2f){
var _33=objj_msgSend(objj_msgSend(CPViewAnimation,"alloc"),"initWithDuration:animationCurve:",0.5,CPAnimationLinear);
objj_msgSend(_33,"setViewAnimations:",[objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_30,CPViewAnimationTargetKey,objj_msgSend(_30,"frame"),CPViewAnimationStartFrameKey,_31,CPViewAnimationEndFrameKey),objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",bar,CPViewAnimationTargetKey,_32,CPViewAnimationStartFrameKey,objj_msgSend(bar,"frame"),CPViewAnimationEndFrameKey)]);
objj_msgSend(_33,"startAnimation");
}else{
objj_msgSend(_30,"setFrame:",_31);
}
return bar;
}
})]);
p;26;Views/MMPreferencesPanel.jt;10968;@STATIC;1.0;I;20;AppKit/CPResponder.jI;15;AppKit/CPView.ji;42;../Frameworks/LPKit/LPMultiLineTextField.ji;52;../Controllers/MMPreferencesGeneralPanelController.ji;52;../Controllers/MMPreferencesLibraryPanelController.ji;52;../Controllers/MMPreferencesSharingPanelController.ji;54;../Controllers/MMPreferencesLanguagesPanelController.ji;51;../Controllers/MMPreferencesAgentsPanelController.ji;56;../Controllers/MMPreferencesTranscodingPanelController.ji;51;../Controllers/MMPreferencesMyPlexPanelController.ji;53;../Controllers/MMPreferencesSecurityPanelController.ji;53;../Controllers/MMPreferencesAdvancedPanelController.ji;34;../Controllers/MMPrefsController.ji;18;../Models/MMPref.jt;10275;
objj_executeFile("AppKit/CPResponder.j",NO);
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("../Frameworks/LPKit/LPMultiLineTextField.j",YES);
objj_executeFile("../Controllers/MMPreferencesGeneralPanelController.j",YES);
objj_executeFile("../Controllers/MMPreferencesLibraryPanelController.j",YES);
objj_executeFile("../Controllers/MMPreferencesSharingPanelController.j",YES);
objj_executeFile("../Controllers/MMPreferencesLanguagesPanelController.j",YES);
objj_executeFile("../Controllers/MMPreferencesAgentsPanelController.j",YES);
objj_executeFile("../Controllers/MMPreferencesTranscodingPanelController.j",YES);
objj_executeFile("../Controllers/MMPreferencesMyPlexPanelController.j",YES);
objj_executeFile("../Controllers/MMPreferencesSecurityPanelController.j",YES);
objj_executeFile("../Controllers/MMPreferencesAdvancedPanelController.j",YES);
objj_executeFile("../Controllers/MMPrefsController.j",YES);
objj_executeFile("../Models/MMPref.j",YES);
var _1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","ChevronUpSmall.png"),CGSizeMake(5,3));
var _2=objj_allocateClassPair(CPView,"MMPreferencesPanel"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("toolbar"),new objj_ivar("sheetPanel"),new objj_ivar("selectionIndicator"),new objj_ivar("_minHeight"),new objj_ivar("sectionOrigin"),new objj_ivar("sections"),new objj_ivar("sectionIdentifiers"),new objj_ivar("selectedSection"),new objj_ivar("sectionBeingSelected"),new objj_ivar("sectionOrigin")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("addPreferencePanel:"),function(_4,_5,_6){
with(_4){
objj_msgSend(sectionIdentifiers,"addObject:",objj_msgSend(_6,"identifier"));
objj_msgSend(sections,"addObject:",_6);
}
}),new objj_method(sel_getUid("sectionByIdentifier:"),function(_7,_8,_9){
with(_7){
var _a=objj_msgSend(sections,"objectEnumerator"),_b=nil;
while(_b=objj_msgSend(_a,"nextObject")){
if(objj_msgSend(_b,"identifier")==_9){
return _b;
}
}
return nil;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_c,_d,_e){
with(_c){
if(_c=objj_msgSendSuper({receiver:_c,super_class:objj_getClass("MMPreferencesPanel").super_class},"initWithFrame:",_e)){
toolbar=objj_msgSend(objj_msgSend(CPToolbar,"alloc"),"init");
var _f=objj_msgSend(toolbar,"_toolbarView");
objj_msgSend(_f,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_c,"frame")),CGRectGetHeight(objj_msgSend(_f,"frame"))));
var _10=objj_msgSend(_c,"valueForThemeAttribute:","content-inset");
sections=objj_msgSend(CPArray,"array");
sectionIdentifiers=objj_msgSend(CPArray,"array");
objj_msgSend(_c,"addPreferencePanel:",objj_msgSend(objj_msgSend(MMPreferencesGeneralPanelController,"alloc"),"init"));
objj_msgSend(_c,"addPreferencePanel:",objj_msgSend(objj_msgSend(MMPreferencesLibraryPanelController,"alloc"),"init"));
if(objj_msgSend(objj_msgSend(PMSCapabilities,"sharedPMSCapabilities"),"anySharingSupported")){
objj_msgSend(_c,"addPreferencePanel:",objj_msgSend(objj_msgSend(MMPreferencesSharingPanelController,"alloc"),"init"));
}
objj_msgSend(_c,"addPreferencePanel:",objj_msgSend(objj_msgSend(MMPreferencesAgentsPanelController,"alloc"),"init"));
if(objj_msgSend(objj_msgSend(PMSCapabilities,"sharedPMSCapabilities"),"languagePreferencesSupported")){
objj_msgSend(_c,"addPreferencePanel:",objj_msgSend(objj_msgSend(MMPreferencesLanguagesPanelController,"alloc"),"init"));
}
objj_msgSend(_c,"addPreferencePanel:",objj_msgSend(objj_msgSend(MMPreferencesTranscodingPanelController,"alloc"),"init"));
if(objj_msgSend(objj_msgSend(PMSCapabilities,"sharedPMSCapabilities"),"myPlexSupported")){
objj_msgSend(_c,"addPreferencePanel:",objj_msgSend(objj_msgSend(MMPreferencesMyPlexPanelController,"alloc"),"init"));
}else{
objj_msgSend(_c,"addPreferencePanel:",objj_msgSend(objj_msgSend(MMPreferencesSecurityPanelController,"alloc"),"init"));
}
objj_msgSend(_c,"addPreferencePanel:",objj_msgSend(objj_msgSend(MMPreferencesAdvancedPanelController,"alloc"),"init"));
var _11=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Done","Done"));
objj_msgSend(_11,"setKeyEquivalent:",CPEscapeFunctionKey);
objj_msgSend(_11,"setFrameOrigin:",CGPointMake(CGRectGetWidth(objj_msgSend(_c,"frame"))-_10.right-CGRectGetWidth(objj_msgSend(_11,"frame")),CGRectGetHeight(objj_msgSend(_c,"frame"))-_10.bottom-CGRectGetHeight(objj_msgSend(_11,"frame"))));
objj_msgSend(_11,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin);
objj_msgSend(_11,"setTarget:",_c);
objj_msgSend(_11,"setAction:",sel_getUid("dismissSheet"));
objj_msgSend(_c,"addSubview:",_11);
objj_msgSend(toolbar,"setDelegate:",_c);
objj_msgSend(toolbar,"setDisplayMode:",CPToolbarDisplayModeIconAndLabel);
objj_msgSend(_c,"addSubview:",_f);
var _12=objj_msgSend(objj_msgSend(CPBox,"alloc"),"initWithFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(_f,"frame")),CGRectGetWidth(objj_msgSend(_c,"frame")),1));
objj_msgSend(_12,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_c,"addSubview:",_12);
selectionIndicator=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(0,CGRectGetMinY(objj_msgSend(_12,"frame"))-3,5,3));
objj_msgSend(selectionIndicator,"setImage:",_1);
objj_msgSend(_c,"addSubview:",selectionIndicator);
sectionOrigin=CGRectOffset(CGRectInset(objj_msgSend(_c,"bounds"),0,_10.top),0,CGRectGetMaxY(objj_msgSend(_12,"frame"))).origin;
objj_msgSend(_c,"selectSection:",objj_msgSend(sections,"objectAtIndex:",0));
}
return _c;
}
}),new objj_method(sel_getUid("presentSheetInWindow:"),function(_13,_14,_15){
with(_13){
if(sheetPanel){
return;
}
var _16=objj_msgSend(sections,"objectEnumerator"),_17=nil,_18=nil;
while(_17=objj_msgSend(_16,"nextObject")){
if(objj_msgSend(_17,"initialFirstResponder")){
_18=objj_msgSend(_17,"initialFirstResponder");
}
}
sheetPanel=objj_msgSend(objj_msgSend(CPPanel,"alloc"),"initWithContentRect:styleMask:",objj_msgSend(_13,"bounds"),CPDocModalWindowMask);
objj_msgSend(sheetPanel,"setInitialFirstResponder:",_18);
objj_msgSend(sheetPanel,"setContentView:",_13);
objj_msgSend(CPApp,"beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:",sheetPanel,_15,nil,nil,nil);
}
}),new objj_method(sel_getUid("dismissSheet"),function(_19,_1a){
with(_19){
if(!sheetPanel){
return;
}
objj_msgSend(selectedSection,"viewWillDisappear");
objj_msgSend(CPApp,"endSheet:returnCode:",sheetPanel,0),sheetPanel=nil;
objj_msgSend(selectedSection,"viewDidDisappear");
}
}),new objj_method(sel_getUid("toolbarDefaultItemIdentifiers:"),function(_1b,_1c,_1d){
with(_1b){
return sectionIdentifiers;
}
}),new objj_method(sel_getUid("toolbar:itemForItemIdentifier:willBeInsertedIntoToolbar:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
var _23=objj_msgSend(objj_msgSend(_1e,"sectionByIdentifier:",_21),"toolbarItem");
objj_msgSend(_23,"setAction:",sel_getUid("toolbarItemWasSelected:"));
objj_msgSend(_23,"setTarget:",_1e);
return _23;
}
}),new objj_method(sel_getUid("toolbarItemWasSelected:"),function(_24,_25,_26){
with(_24){
objj_msgSend(_24,"selectSection:",objj_msgSend(_24,"sectionByIdentifier:",objj_msgSend(_26,"itemIdentifier")));
}
}),new objj_method(sel_getUid("selectSection:"),function(_27,_28,_29){
with(_27){
var _2a;
if(selectedSection){
objj_msgSend(selectedSection,"viewWillDisappear");
_2a=objj_msgSend(sections,"indexOfObject:",selectedSection);
if(_2a!=CPNotFound){
objj_msgSend(objj_msgSend(objj_msgSend(toolbar,"items"),"objectAtIndex:",_2a),"setImage:",objj_msgSend(selectedSection,"image"));
}
}
objj_msgSend(_29,"viewWillAppear");
sectionBeingSelected=_29;
var _2b=objj_msgSend(_29,"view");
if(!objj_msgSend(objj_msgSend(_27,"subviews"),"containsObject:",_2b)){
var _2c=CGPointCreateCopy(sectionOrigin),_2d=objj_msgSend(_27,"valueForThemeAttribute:","content-inset");
if(objj_msgSend(_29,"respondsToSelector:",sel_getUid("contentInset"))){
_2d=objj_msgSend(_29,"contentInset");
}
var _2e=CGRectGetWidth(objj_msgSend(_27,"frame"))-_2d.left-_2d.right;
objj_msgSend(_2b,"setFrameSize:",CGSizeMake(_2e,CGRectGetHeight(objj_msgSend(_2b,"frame"))));
objj_msgSend(_27,"addSubview:",_2b);
_2c.x+=_2d.left+(_2e-CGRectGetWidth(objj_msgSend(_2b,"frame")))/2;
_2c.y+=_2d.top;
objj_msgSend(_2b,"setFrameOrigin:",_2c);
}
_2a=objj_msgSend(sections,"indexOfObject:",_29);
if(_2a!=CPNotFound){
objj_msgSend(objj_msgSend(objj_msgSend(toolbar,"items"),"objectAtIndex:",_2a),"setImage:",objj_msgSend(_29,"selectedImage"));
objj_msgSend(selectionIndicator,"setFrameOrigin:",CGPointMake(CGRectGetMidX(objj_msgSend(objj_msgSend(objj_msgSend(toolbar,"_toolbarView"),"viewForItem:",objj_msgSend(objj_msgSend(toolbar,"items"),"objectAtIndex:",_2a)),"frame"))-CGRectGetWidth(objj_msgSend(selectionIndicator,"frame"))/2,CGRectGetMinY(objj_msgSend(selectionIndicator,"frame"))));
}
if(selectedSection){
objj_msgSend(_27,"transitionFromSubview:toSubview:adjustWidth:adjustHeight:animated:",objj_msgSend(selectedSection,"view"),_2b,NO,YES,selectedSection!=nil);
}else{
objj_msgSend(_27,"willTransitionFromSubview:toSubview:",nil,_2b);
objj_msgSend(_27,"sizeToFitWithInset:adjustWidth:adjustHeight:",CPViewInsetDefault,NO,YES);
objj_msgSend(_27,"didTransitionFromSubview:toSubview:",nil,_2b);
}
}
}),new objj_method(sel_getUid("didTransitionFromSubview:toSubview:"),function(_2f,_30,_31,_32){
with(_2f){
objj_msgSend(objj_msgSend(selectedSection,"view"),"setHidden:",YES);
objj_msgSend(_32,"setHidden:",NO);
objj_msgSend(objj_msgSend(_2f,"window"),"makeFirstResponder:",objj_msgSend(sectionBeingSelected,"initialFirstResponder"));
objj_msgSend(selectedSection,"viewDidDisappear");
objj_msgSend(sectionBeingSelected,"viewDidAppear");
selectedSection=sectionBeingSelected;
sectionBeingSelected=nil;
}
}),new objj_method(sel_getUid("originForSection:"),function(_33,_34,_35){
with(_33){
var _36=objj_msgSend(_35,"respondsToSelector:",sel_getUid("inset"))?objj_msgSend(_35,"inset"):objj_msgSend(_33,"valueForThemeAttribute:","content-inset");
return CGRectOffset(CGRectInset(objj_msgSend(_33,"bounds"),0,_36.top),0,CGRectGetHeight(objj_msgSend(toolbarView,"frame"))).origin;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("themeAttributes"),function(_37,_38){
with(_37){
return objj_msgSend(CPDictionary,"dictionaryWithObjects:forKeys:",[CGInsetMake(15,15,15,15)],["content-inset"]);
}
})]);
p;49;Controllers/MMPreferencesGeneralPanelController.jt;903;@STATIC;1.0;i;34;MMPreferencesBasePanelController.ji;36;../Views/MMPreferencesGeneralPanel.jt;805;
objj_executeFile("MMPreferencesBasePanelController.j",YES);
objj_executeFile("../Views/MMPreferencesGeneralPanel.j",YES);
var _1=objj_allocateClassPair(MMPreferencesBasePanelController,"MMPreferencesGeneralPanelController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("identifier"),function(_3,_4){
with(_3){
return "General";
}
}),new objj_method(sel_getUid("title"),function(_5,_6){
with(_5){
return CPLocalizedString("General","General");
}
}),new objj_method(sel_getUid("loadView"),function(_7,_8){
with(_7){
objj_msgSend(_7,"setView:",objj_msgSend(objj_msgSend(MMPreferencesGeneralPanel,"alloc"),"initWithFrame:",CGRectMake(0,0,485,145)));
objj_msgSend(_7,"setInitialFirstResponder:",objj_msgSend(objj_msgSend(_7,"view"),"initialFirstResponder"));
}
})]);
p;46;Controllers/MMPreferencesBasePanelController.jt;1734;@STATIC;1.0;I;25;AppKit/CPViewController.jt;1685;
objj_executeFile("AppKit/CPViewController.j",NO);
var _1=objj_allocateClassPair(CPViewController,"MMPreferencesBasePanelController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("initialFirstResponder")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initialFirstResponder"),function(_3,_4){
with(_3){
return initialFirstResponder;
}
}),new objj_method(sel_getUid("setInitialFirstResponder:"),function(_5,_6,_7){
with(_5){
initialFirstResponder=_7;
}
}),new objj_method(sel_getUid("toolbarItem"),function(_8,_9){
with(_8){
var _a=objj_msgSend(objj_msgSend(CPToolbarItem,"alloc"),"initWithItemIdentifier:",objj_msgSend(_8,"identifier"));
objj_msgSend(_a,"setImage:",objj_msgSend(_8,"image"));
objj_msgSend(_a,"setLabel:",objj_msgSend(_8,"title"));
return _a;
}
}),new objj_method(sel_getUid("image"),function(_b,_c){
with(_b){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",objj_msgSend(_b,"identifier")+".png"),CGSizeMake(32,32));
}
}),new objj_method(sel_getUid("selectedImage"),function(_d,_e){
with(_d){
return objj_msgSend(objj_msgSend(CPImage,"alloc"),"initByReferencingFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:",objj_msgSend(_d,"identifier")+"-Selected.png"),CGSizeMake(32,32));
}
}),new objj_method(sel_getUid("viewWillAppear"),function(_f,_10){
with(_f){
}
}),new objj_method(sel_getUid("viewWillDisappear"),function(_11,_12){
with(_11){
}
}),new objj_method(sel_getUid("viewDidAppear"),function(_13,_14){
with(_13){
}
}),new objj_method(sel_getUid("viewDidDisappear"),function(_15,_16){
with(_15){
}
})]);
p;33;Views/MMPreferencesGeneralPanel.jt;5416;@STATIC;1.0;I;15;AppKit/CPView.jt;5377;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"MMPreferencesGeneralPanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("initialFirstResponder"),new objj_ivar("friendlyNameLabel"),new objj_ivar("friendlyNameField"),new objj_ivar("friendlyNameSummary"),new objj_ivar("generalSeparator"),new objj_ivar("sendAnonymousUsageCheckbox"),new objj_ivar("sendAnonymousUsageSummary")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initialFirstResponder"),function(_3,_4){
with(_3){
return initialFirstResponder;
}
}),new objj_method(sel_getUid("setInitialFirstResponder:"),function(_5,_6,_7){
with(_5){
initialFirstResponder=_7;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_8,_9,_a){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("MMPreferencesGeneralPanel").super_class},"initWithFrame:",_a)){
friendlyNameLabel=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Friendly name:","Friendly name label"));
friendlyNameField=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","","",CGRectGetWidth(objj_msgSend(_8,"frame"))-CGRectGetWidth(objj_msgSend(friendlyNameLabel,"frame")));
friendlyNameSummary=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("This name will be used to identify this media server to other computers "+"on your network. If you leave it blank, your computer's "+"name will be used instead.","Summary info for friendly name"));
objj_msgSend(_8,"setInitialFirstResponder:",friendlyNameField);
objj_msgSend(friendlyNameField,"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.FriendlyName",nil);
objj_msgSend(friendlyNameField,"setFrameOrigin:",CGPointMake(CGRectGetWidth(objj_msgSend(friendlyNameLabel,"frame")),0));
objj_msgSend(friendlyNameField,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(friendlyNameLabel,"setFrameOrigin:",CGPointMake(0,(CGRectGetHeight(objj_msgSend(friendlyNameField,"frame"))-CGRectGetHeight(objj_msgSend(friendlyNameLabel,"frame")))/2));
objj_msgSend(friendlyNameLabel,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(friendlyNameSummary,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(friendlyNameField,"frame")),CGRectGetMaxY(objj_msgSend(friendlyNameField,"frame"))));
var _b=objj_msgSend(CPPlatformString,"sizeOfString:withFont:forWidth:",objj_msgSend(friendlyNameSummary,"stringValue"),objj_msgSend(friendlyNameSummary,"font"),CGRectGetWidth(objj_msgSend(friendlyNameField,"frame")));
objj_msgSend(friendlyNameSummary,"setFrameSize:",_b);
objj_msgSend(friendlyNameSummary,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(friendlyNameSummary,"setAutoresizingMask:",CPViewMaxXMargin);
objj_msgSend(friendlyNameSummary,"sizeToFit");
objj_msgSend(_8,"addSubview:",friendlyNameField);
objj_msgSend(_8,"addSubview:",friendlyNameLabel);
objj_msgSend(_8,"addSubview:",friendlyNameSummary);
generalSeparator=objj_msgSend(objj_msgSend(CPBox,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(generalSeparator,"setBorderColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",137/255,1));
objj_msgSend(generalSeparator,"setBoxType:",CPBoxSeparator);
objj_msgSend(generalSeparator,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_8,"addSubview:",generalSeparator);
sendAnonymousUsageCheckbox=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("Send anonymous usage data to Plex","Send anonymous usage data to Plex"));
objj_msgSend(sendAnonymousUsageCheckbox,"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.collectUsageData",nil);
objj_msgSend(_8,"addSubview:",sendAnonymousUsageCheckbox);
sendAnonymousUsageSummary=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("This helps us improve your experience (for example, to help us match movies and TV shows).","Summary info for collecting usage data"));
objj_msgSend(sendAnonymousUsageSummary,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
var _c=objj_msgSend(CPPlatformString,"sizeOfString:withFont:forWidth:",objj_msgSend(sendAnonymousUsageSummary,"stringValue"),objj_msgSend(sendAnonymousUsageSummary,"font"),CGRectGetWidth(objj_msgSend(_8,"frame"))-17);
objj_msgSend(sendAnonymousUsageSummary,"setFrameSize:",_c);
objj_msgSend(sendAnonymousUsageSummary,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(sendAnonymousUsageSummary,"setAutoresizingMask:",CPViewMaxXMargin);
objj_msgSend(sendAnonymousUsageSummary,"sizeToFit");
objj_msgSend(_8,"addSubview:",sendAnonymousUsageSummary);
objj_msgSend(_8,"layoutSubviews");
}
return _8;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_d,_e){
with(_d){
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("MMPreferencesGeneralPanel").super_class},"layoutSubviews");
objj_msgSend(generalSeparator,"setFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(friendlyNameSummary,"frame"))+10,CGRectGetWidth(objj_msgSend(_d,"frame")),5));
objj_msgSend(sendAnonymousUsageCheckbox,"sizeToFit");
objj_msgSend(sendAnonymousUsageCheckbox,"setFrameOrigin:",CGPointMake(0,CGRectGetMaxY(objj_msgSend(generalSeparator,"frame"))+10));
objj_msgSend(sendAnonymousUsageSummary,"setFrameOrigin:",CGPointMake(17,CGRectGetMaxY(objj_msgSend(sendAnonymousUsageCheckbox,"frame"))));
}
})]);
p;49;Controllers/MMPreferencesLibraryPanelController.jt;788;@STATIC;1.0;i;34;MMPreferencesBasePanelController.ji;36;../Views/MMPreferencesLibraryPanel.jt;690;
objj_executeFile("MMPreferencesBasePanelController.j",YES);
objj_executeFile("../Views/MMPreferencesLibraryPanel.j",YES);
var _1=objj_allocateClassPair(MMPreferencesBasePanelController,"MMPreferencesLibraryPanelController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("identifier"),function(_3,_4){
with(_3){
return "Library";
}
}),new objj_method(sel_getUid("title"),function(_5,_6){
with(_5){
return CPLocalizedString("Library","Library");
}
}),new objj_method(sel_getUid("loadView"),function(_7,_8){
with(_7){
objj_msgSend(_7,"setView:",objj_msgSend(objj_msgSend(MMPreferencesLibraryPanel,"alloc"),"initWithFrame:",CGRectMakeZero()));
}
})]);
p;33;Views/MMPreferencesLibraryPanel.jt;9508;@STATIC;1.0;I;15;AppKit/CPView.ji;27;../Models/PMSCapabilities.jt;9437;
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("../Models/PMSCapabilities.j",YES);
var _1=objj_allocateClassPair(CPView,"MMPreferencesLibraryPanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("updateLibraryOnChangesCheckBox"),new objj_ivar("updateLibraryPeriodicallyCheckBox"),new objj_ivar("updateLibraryPeriodPopUp"),new objj_ivar("autoEmptyTrashCheckBox"),new objj_ivar("includeMusicSectionsInAutomaticUpdatesCheckBox"),new objj_ivar("includeMusicSectionsInAutomaticUpdatesLabel"),new objj_ivar("allowMediaDeletionCheckBox"),new objj_ivar("allowMediaDeletionLabel")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMPreferencesLibraryPanel").super_class},"initWithFrame:",_5)){
if(objj_msgSend(objj_msgSend(PMSCapabilities,"sharedPMSCapabilities"),"libraryChangeWatchingSupported")){
updateLibraryOnChangesCheckBox=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("Update my library when changes to my folders are detected","Preference window setting"));
objj_msgSend(updateLibraryOnChangesCheckBox,"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.FSEventLibraryUpdatesEnabled",nil);
objj_msgSend(_3,"addSubview:",updateLibraryOnChangesCheckBox);
}
if(objj_msgSend(objj_msgSend(PMSCapabilities,"sharedPMSCapabilities"),"libraryTimedUpdatesSupported")){
updateLibraryPeriodicallyCheckBox=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("Update my library","Preference window setting - will have frequencies after it e.g. Update my library every two hours"));
objj_msgSend(updateLibraryPeriodicallyCheckBox,"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.ScheduledLibraryUpdatesEnabled",nil);
objj_msgSend(_3,"addSubview:",updateLibraryPeriodicallyCheckBox);
updateLibraryPeriodPopUp=objj_msgSend(CPPopUpButton,"buttonWithTitle:",nil);
var _6=objj_msgSend(_3,"_periodTitles"),_7=objj_msgSend(_3,"_periodValues");
for(var i=0,_8=objj_msgSend(_6,"count");i<_8;i++){
var _9=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_6[i],nil,nil);
objj_msgSend(_9,"setTag:",_7[i]);
objj_msgSend(updateLibraryPeriodPopUp,"addItem:",_9);
}
objj_msgSend(updateLibraryPeriodPopUp,"bind:toObject:withKeyPath:options:","enabled",objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.ScheduledLibraryUpdatesEnabled",nil);
objj_msgSend(updateLibraryPeriodPopUp,"bind:toObject:withKeyPath:options:","selectedTag",objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.ScheduledLibraryUpdateInterval",nil);
objj_msgSend(updateLibraryPeriodPopUp,"addObserver:forKeyPath:options:context:",_3,"selectedTag",CPKeyValueObservingOptionNew,nil);
objj_msgSend(_3,"addSubview:",updateLibraryPeriodPopUp);
}
autoEmptyTrashCheckBox=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("Empty trash automatically after every scan","Preference window setting"));
objj_msgSend(autoEmptyTrashCheckBox,"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.autoEmptyTrash",nil);
objj_msgSend(_3,"addSubview:",autoEmptyTrashCheckBox);
if(objj_msgSend(objj_msgSend(PMSCapabilities,"sharedPMSCapabilities"),"libraryChangeWatchingSupported")||objj_msgSend(objj_msgSend(PMSCapabilities,"sharedPMSCapabilities"),"libraryTimedUpdatesSupported")){
includeMusicSectionsInAutomaticUpdatesCheckBox=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("Include music sections in automatic updates","Preference window setting"));
objj_msgSend(includeMusicSectionsInAutomaticUpdatesCheckBox,"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.autoScanMusicSections",nil);
objj_msgSend(_3,"addSubview:",includeMusicSectionsInAutomaticUpdatesCheckBox);
includeMusicSectionsInAutomaticUpdatesLabel=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Large music sections may take a long time to scan","Preference window setting"));
objj_msgSend(_3,"addSubview:",includeMusicSectionsInAutomaticUpdatesLabel);
}
if(objj_msgSend(objj_msgSend(PMSCapabilities,"sharedPMSCapabilities"),"allowMediaDeletionSupported")){
allowMediaDeletionCheckBox=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("Allow clients to delete media","Preference window setting"));
objj_msgSend(allowMediaDeletionCheckBox,"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.allowMediaDeletion",nil);
objj_msgSend(_3,"addSubview:",allowMediaDeletionCheckBox);
allowMediaDeletionLabel=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Clients will have the ability to request deletion of media files from the hard drive.","Preference window setting"));
objj_msgSend(allowMediaDeletionLabel,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(allowMediaDeletionLabel,"sizeToFit");
objj_msgSend(_3,"addSubview:",allowMediaDeletionLabel);
}
}
return _3;
}
}),new objj_method(sel_getUid("viewWillMoveToSuperview:"),function(_a,_b,_c){
with(_a){
objj_msgSend(_a,"layoutSubviews");
objj_msgSend(_a,"sizeToFitWithInset:adjustWidth:adjustHeight:",nil,NO,YES);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_d,_e){
with(_d){
var _f=0;
if(updateLibraryOnChangesCheckBox){
objj_msgSend(updateLibraryOnChangesCheckBox,"sizeToFit");
objj_msgSend(updateLibraryOnChangesCheckBox,"setFrameOrigin:",CGPointMake(0,_f));
_f=CGRectGetMaxY(objj_msgSend(updateLibraryOnChangesCheckBox,"frame"))+10;
}else{
_f=5;
}
if(updateLibraryPeriodicallyCheckBox){
objj_msgSend(updateLibraryPeriodicallyCheckBox,"sizeToFit");
objj_msgSend(updateLibraryPeriodicallyCheckBox,"setFrameOrigin:",CGPointMake(0,_f));
objj_msgSend(updateLibraryPeriodPopUp,"sizeToFit");
objj_msgSend(updateLibraryPeriodPopUp,"setFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(updateLibraryPeriodicallyCheckBox,"frame"))+5,CGRectGetMinY(objj_msgSend(updateLibraryPeriodicallyCheckBox,"frame"))+(CGRectGetHeight(objj_msgSend(updateLibraryPeriodicallyCheckBox,"frame"))-CGRectGetHeight(objj_msgSend(updateLibraryPeriodPopUp,"frame")))/2,140,CGRectGetHeight(objj_msgSend(updateLibraryPeriodPopUp,"frame"))));
_f=CGRectGetMaxY(objj_msgSend(updateLibraryPeriodicallyCheckBox,"frame"))+10;
}
objj_msgSend(autoEmptyTrashCheckBox,"sizeToFit");
objj_msgSend(autoEmptyTrashCheckBox,"setFrameOrigin:",CGPointMake(0,_f));
_f=CGRectGetMaxY(objj_msgSend(autoEmptyTrashCheckBox,"frame"))+10;
if(includeMusicSectionsInAutomaticUpdatesCheckBox){
objj_msgSend(includeMusicSectionsInAutomaticUpdatesCheckBox,"sizeToFit");
objj_msgSend(includeMusicSectionsInAutomaticUpdatesCheckBox,"setFrameOrigin:",CGPointMake(0,_f));
objj_msgSend(includeMusicSectionsInAutomaticUpdatesLabel,"setFrameOrigin:",CGPointMake(17,CGRectGetMaxY(objj_msgSend(includeMusicSectionsInAutomaticUpdatesCheckBox,"frame"))));
_f=CGRectGetMaxY(objj_msgSend(includeMusicSectionsInAutomaticUpdatesLabel,"frame"))+10;
}
if(allowMediaDeletionCheckBox){
objj_msgSend(allowMediaDeletionCheckBox,"sizeToFit");
objj_msgSend(allowMediaDeletionCheckBox,"setFrameOrigin:",CGPointMake(0,_f));
objj_msgSend(allowMediaDeletionLabel,"setFrameOrigin:",CGPointMake(17,CGRectGetMaxY(objj_msgSend(allowMediaDeletionCheckBox,"frame"))));
var _10=CGRectGetWidth(objj_msgSend(_d,"frame"))-CGRectGetMinX(objj_msgSend(allowMediaDeletionLabel,"frame"))*2,_11=objj_msgSend(objj_msgSend(allowMediaDeletionLabel,"stringValue"),"sizeWithFont:inWidth:",objj_msgSend(allowMediaDeletionLabel,"font"),_10);
_11.height+=5;
objj_msgSend(allowMediaDeletionLabel,"setFrameSize:",_11);
_f=CGRectGetMaxY(objj_msgSend(allowMediaDeletionLabel,"frame"))+10;
}
objj_msgSendSuper({receiver:_d,super_class:objj_getClass("MMPreferencesLibraryPanel").super_class},"layoutSubviews");
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_12,_13,_14,_15,_16,_17){
with(_12){
if(objj_msgSend(_14,"isEqualToString:","selectedTag")&&objj_msgSend(_15,"isKindOfClass:",objj_msgSend(CPPopUpButton,"class"))){
var _18=objj_msgSend(objj_msgSend(MMPrefsController,"sharedPrefsController"),"values"),key="ScheduledLibraryUpdateInterval",_19=objj_msgSend(_16,"objectForKey:",CPKeyValueChangeNewKey),_1a=objj_msgSend(_18,"valueForKey:",key);
if(_19!==_1a){
objj_msgSend(_18,"setValue:forKey:",_19,key);
}
}
}
}),new objj_method(sel_getUid("_periodTitles"),function(_1b,_1c){
with(_1b){
return [CPLocalizedString("every 15 minutes","Library scan interval (i.e. Update my library every 15 minutes)"),CPLocalizedString("every 30 minutes","Library scan interval (i.e. Update my library every 30 minutes)"),CPLocalizedString("hourly","Library scan interval (i.e. Update my library hourly)"),CPLocalizedString("every 2 hours","Library scan interval (i.e. Update my library every 2 hours)"),CPLocalizedString("every 6 hours","Library scan interval (i.e. Update my library every 6 hours)"),CPLocalizedString("every 12 hours","Library scan interval (i.e. Update my library every 12 hours)"),CPLocalizedString("daily","Library scan interval (i.e. Update my library daily")];
}
}),new objj_method(sel_getUid("_periodValues"),function(_1d,_1e){
with(_1d){
return [15*60,30*60,60*60,2*60*60,6*60*60,12*60*60,24*60*60];
}
})]);
p;49;Controllers/MMPreferencesSharingPanelController.jt;795;@STATIC;1.0;i;34;MMPreferencesBasePanelController.ji;36;../Views/MMPreferencesSharingPanel.jt;697;
objj_executeFile("MMPreferencesBasePanelController.j",YES);
objj_executeFile("../Views/MMPreferencesSharingPanel.j",YES);
var _1=objj_allocateClassPair(MMPreferencesBasePanelController,"MMPreferencesSharingPanelController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("identifier"),function(_3,_4){
with(_3){
return "Sharing";
}
}),new objj_method(sel_getUid("title"),function(_5,_6){
with(_5){
return CPLocalizedString("Sharing","Sharing");
}
}),new objj_method(sel_getUid("loadView"),function(_7,_8){
with(_7){
objj_msgSend(_7,"setView:",objj_msgSend(objj_msgSend(MMPreferencesSharingPanel,"alloc"),"initWithFrame:",CGRectMake(0,0,485,145)));
}
})]);
p;33;Views/MMPreferencesSharingPanel.jt;1995;@STATIC;1.0;I;15;AppKit/CPView.jt;1956;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"MMPreferencesSharingPanel"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMPreferencesSharingPanel").super_class},"initWithFrame:",_5)){
var _6=0;
if(objj_msgSend(objj_msgSend(PMSCapabilities,"sharedPMSCapabilities"),"iTunesSharingSupported")){
var _7=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("iTunes Sharing Enabled","Preference window setting"));
objj_msgSend(_7,"setFrameOrigin:",CGPointMake(0,_6));
objj_msgSend(_7,"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.iTunesSharingEnabled",nil);
objj_msgSend(_3,"addSubview:",_7);
_6=CGRectGetMaxY(objj_msgSend(_7,"frame"))+10;
}
if(objj_msgSend(objj_msgSend(PMSCapabilities,"sharedPMSCapabilities"),"iPhotoSharingSupported")){
var _8=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("iPhoto Sharing Enabled","Preference window setting"));
objj_msgSend(_8,"setFrameOrigin:",CGPointMake(0,_6));
objj_msgSend(_8,"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.iPhotoSharingEnabled",nil);
objj_msgSend(_3,"addSubview:",_8);
_6=CGRectGetMaxY(objj_msgSend(_8,"frame"))+10;
}
if(objj_msgSend(objj_msgSend(PMSCapabilities,"sharedPMSCapabilities"),"ApertureSharingSupported")){
var _9=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("Aperture Sharing Enabled","Preference window setting"));
objj_msgSend(_9,"setFrameOrigin:",CGPointMake(0,_6));
objj_msgSend(_9,"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.ApertureSharingEnabled",nil);
objj_msgSend(_3,"addSubview:",_9);
}
objj_msgSend(_3,"sizeToFit");
}
return _3;
}
})]);
p;51;Controllers/MMPreferencesLanguagesPanelController.jt;5489;@STATIC;1.0;i;34;MMPreferencesBasePanelController.ji;38;../Views/MMPreferencesLanguagesPanel.ji;21;../Models/MMAccount.ji;36;../DataSources/MMAccountDataSource.jt;5321;
objj_executeFile("MMPreferencesBasePanelController.j",YES);
objj_executeFile("../Views/MMPreferencesLanguagesPanel.j",YES);
objj_executeFile("../Models/MMAccount.j",YES);
objj_executeFile("../DataSources/MMAccountDataSource.j",YES);
var _1=objj_allocateClassPair(MMPreferencesBasePanelController,"MMPreferencesLanguagesPanelController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("languages"),new objj_ivar("account")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("identifier"),function(_3,_4){
with(_3){
return "Languages";
}
}),new objj_method(sel_getUid("title"),function(_5,_6){
with(_5){
return CPLocalizedString("Languages","Languages");
}
}),new objj_method(sel_getUid("loadView"),function(_7,_8){
with(_7){
account=objj_msgSend(objj_msgSend(MMAccountDataSource,"sharedDataSource"),"adminAccount");
objj_msgSend(_7,"setView:",objj_msgSend(objj_msgSend(MMPreferencesLanguagesPanel,"alloc"),"initWithFrame:",CGRectMake(0,0,485,125)));
objj_msgSend(_7,"setInitialFirstResponder:",objj_msgSend(objj_msgSend(_7,"view"),"initialFirstResponder"));
var _9=objj_msgSend(objj_msgSend(_7,"view"),"defaultAudioLanguagePopup"),_a=objj_msgSend(objj_msgSend(_7,"view"),"defaultSubtitleLanguagePopup"),_b=objj_msgSend(objj_msgSend(_7,"view"),"autoSelectAudioCheckbox"),_c=objj_msgSend(objj_msgSend(_7,"view"),"subtitleModePopup");
languages=objj_msgSend(objj_msgSend(objj_msgSend(LanguageConfig,"allLanguages"),"allObjects"),"sortedArrayUsingFunction:",function(a,b){
return objj_msgSend(objj_msgSend(a,"name"),"caseInsensitiveCompare:",objj_msgSend(b,"name"));
});
objj_msgSend(languages,"enumerateObjectsUsingBlock:",function(_d){
objj_msgSend(_9,"addItemWithTitle:",objj_msgSend(_d,"name"));
objj_msgSend(_a,"addItemWithTitle:",objj_msgSend(_d,"name"));
});
objj_msgSend(_9,"setTarget:",_7);
objj_msgSend(_9,"setAction:",sel_getUid("selectDefaultAudioLanguage:"));
objj_msgSend(_9,"bind:toObject:withKeyPath:options:","enabled",account,"autoSelectAudio",nil);
objj_msgSend(_b,"setTarget:",_7);
objj_msgSend(_b,"setAction:",sel_getUid("toggleAutoSelectAudio:"));
objj_msgSend(_c,"setTarget:",_7);
objj_msgSend(_c,"setAction:",sel_getUid("selectSubtitleMode:"));
objj_msgSend(_a,"setTarget:",_7);
objj_msgSend(_a,"setAction:",sel_getUid("selectDefaultSubtitleLanguage:"));
objj_msgSend(account,"addObserver:forKeyPath:options:context:",_7,"defaultAudioLanguage",CPKeyValueObservingOptionInitial|CPKeyValueObservingOptionNew,nil);
objj_msgSend(account,"addObserver:forKeyPath:options:context:",_7,"defaultSubtitleLanguage",CPKeyValueObservingOptionInitial|CPKeyValueObservingOptionNew,nil);
objj_msgSend(account,"addObserver:forKeyPath:options:context:",_7,"autoSelectAudio",CPKeyValueObservingOptionInitial|CPKeyValueObservingOptionNew,nil);
objj_msgSend(account,"addObserver:forKeyPath:options:context:",_7,"subtitleMode",CPKeyValueObservingOptionInitial|CPKeyValueObservingOptionNew,nil);
}
}),new objj_method(sel_getUid("selectDefaultAudioLanguage:"),function(_e,_f,_10){
with(_e){
objj_msgSend(account,"setDefaultAudioLanguage:",objj_msgSend(languages,"objectAtIndex:",objj_msgSend(_10,"selectedIndex")));
objj_msgSend(objj_msgSend(MMAccountDataSource,"sharedDataSource"),"updateRecord:",account);
}
}),new objj_method(sel_getUid("toggleAutoSelectAudio:"),function(_11,_12,_13){
with(_11){
objj_msgSend(account,"setAutoSelectAudio:",objj_msgSend(_13,"state")==CPOnState);
objj_msgSend(objj_msgSend(MMAccountDataSource,"sharedDataSource"),"updateRecord:",account);
}
}),new objj_method(sel_getUid("selectSubtitleMode:"),function(_14,_15,_16){
with(_14){
objj_msgSend(account,"setSubtitleMode:",objj_msgSend(_16,"selectedIndex"));
objj_msgSend(objj_msgSend(MMAccountDataSource,"sharedDataSource"),"updateRecord:",account);
}
}),new objj_method(sel_getUid("selectDefaultSubtitleLanguage:"),function(_17,_18,_19){
with(_17){
objj_msgSend(account,"setDefaultSubtitleLanguage:",objj_msgSend(languages,"objectAtIndex:",objj_msgSend(_19,"selectedIndex")));
objj_msgSend(objj_msgSend(MMAccountDataSource,"sharedDataSource"),"updateRecord:",account);
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_1a,_1b,_1c,_1d,_1e,_1f){
with(_1a){
if(_1d===account&&_1c==="defaultAudioLanguage"){
var _20=objj_msgSend(_1e,"objectForKey:",CPKeyValueChangeNewKey),_21=objj_msgSend(languages,"indexOfObject:",_20);
objj_msgSend(objj_msgSend(objj_msgSend(_1a,"view"),"defaultAudioLanguagePopup"),"setSelectedIndex:",_21);
}else{
if(_1d===account&&_1c==="defaultSubtitleLanguage"){
var _20=objj_msgSend(_1e,"objectForKey:",CPKeyValueChangeNewKey),_21=objj_msgSend(languages,"indexOfObject:",_20);
objj_msgSend(objj_msgSend(objj_msgSend(_1a,"view"),"defaultSubtitleLanguagePopup"),"setSelectedIndex:",_21);
}else{
if(_1d===account&&_1c==="autoSelectAudio"){
var _22=objj_msgSend(_1e,"objectForKey:",CPKeyValueChangeNewKey);
objj_msgSend(objj_msgSend(objj_msgSend(_1a,"view"),"autoSelectAudioCheckbox"),"setState:",_22?CPOnState:CPOffState);
}else{
if(_1d===account&&_1c==="subtitleMode"){
var _23=objj_msgSend(_1e,"objectForKey:",CPKeyValueChangeNewKey);
objj_msgSend(objj_msgSend(objj_msgSend(_1a,"view"),"subtitleModePopup"),"setSelectedIndex:",_23);
objj_msgSend(objj_msgSend(objj_msgSend(_1a,"view"),"defaultSubtitleLanguagePopup"),"setEnabled:",_23>0);
}
}
}
}
}
})]);
p;35;Views/MMPreferencesLanguagesPanel.jt;5390;@STATIC;1.0;I;15;AppKit/CPView.jt;5351;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"MMPreferencesLanguagesPanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("initialFirstResponder"),new objj_ivar("autoSelectAudioCheckbox"),new objj_ivar("defaultAudioLanguagePopup"),new objj_ivar("subtitleModePopup"),new objj_ivar("defaultSubtitleLanguagePopup")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initialFirstResponder"),function(_3,_4){
with(_3){
return initialFirstResponder;
}
}),new objj_method(sel_getUid("setInitialFirstResponder:"),function(_5,_6,_7){
with(_5){
initialFirstResponder=_7;
}
}),new objj_method(sel_getUid("autoSelectAudioCheckbox"),function(_8,_9){
with(_8){
return autoSelectAudioCheckbox;
}
}),new objj_method(sel_getUid("setAutoSelectAudioCheckbox:"),function(_a,_b,_c){
with(_a){
autoSelectAudioCheckbox=_c;
}
}),new objj_method(sel_getUid("defaultAudioLanguagePopup"),function(_d,_e){
with(_d){
return defaultAudioLanguagePopup;
}
}),new objj_method(sel_getUid("setDefaultAudioLanguagePopup:"),function(_f,_10,_11){
with(_f){
defaultAudioLanguagePopup=_11;
}
}),new objj_method(sel_getUid("subtitleModePopup"),function(_12,_13){
with(_12){
return subtitleModePopup;
}
}),new objj_method(sel_getUid("setSubtitleModePopup:"),function(_14,_15,_16){
with(_14){
subtitleModePopup=_16;
}
}),new objj_method(sel_getUid("defaultSubtitleLanguagePopup"),function(_17,_18){
with(_17){
return defaultSubtitleLanguagePopup;
}
}),new objj_method(sel_getUid("setDefaultSubtitleLanguagePopup:"),function(_19,_1a,_1b){
with(_19){
defaultSubtitleLanguagePopup=_1b;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_1c,_1d,_1e){
with(_1c){
if(_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("MMPreferencesLanguagesPanel").super_class},"initWithFrame:",_1e)){
defaultAudioLanguagePopup=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(defaultAudioLanguagePopup,"sizeToFit");
autoSelectAudioCheckbox=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("Prefer audio tracks in:","Language preference pane audio checkbox label"));
objj_msgSend(autoSelectAudioCheckbox,"setAlignment:",CPRightTextAlignment);
var _1f=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Subtitle mode:","Languages preference pane subtitle mode label"));
objj_msgSend(_1f,"setAlignment:",CPRightTextAlignment);
subtitleModePopup=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(subtitleModePopup,"sizeToFit");
objj_msgSend(subtitleModePopup,"addItemWithTitle:",CPLocalizedString("Manually selected","Language preference pane subtitle mode option"));
objj_msgSend(subtitleModePopup,"addItemWithTitle:",CPLocalizedString("Shown with foreign audio","Language preference pane subtitle mode option"));
objj_msgSend(subtitleModePopup,"addItemWithTitle:",CPLocalizedString("Always enabled","Language preference pane subtitle mode option"));
var _20=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Prefer subtitles in:","Languages preference pane default subtitle language label"));
objj_msgSend(_20,"setAlignment:",CPRightTextAlignment);
defaultSubtitleLanguagePopup=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(defaultSubtitleLanguagePopup,"sizeToFit");
var _21=MAX(CGRectGetWidth(objj_msgSend(autoSelectAudioCheckbox,"frame")),CGRectGetWidth(objj_msgSend(_1f,"frame")),CGRectGetWidth(objj_msgSend(_20,"frame"))),_22=230,_23=_21+10+_22,_24=(CGRectGetWidth(objj_msgSend(_1c,"frame"))-_23)/2;
objj_msgSend(defaultAudioLanguagePopup,"setFrame:",CGRectMake(_24+_21+10,0,_22,CGRectGetHeight(objj_msgSend(defaultAudioLanguagePopup,"frame"))));
objj_msgSend(autoSelectAudioCheckbox,"setFrameOrigin:",CGPointMake(_24,CGRectGetMidY(objj_msgSend(defaultAudioLanguagePopup,"frame"))-CGRectGetHeight(objj_msgSend(defaultAudioLanguagePopup,"frame"))/2));
objj_msgSend(subtitleModePopup,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(defaultAudioLanguagePopup,"frame")),CGRectGetMaxY(objj_msgSend(defaultAudioLanguagePopup,"frame"))+10,_22,CGRectGetHeight(objj_msgSend(subtitleModePopup,"frame"))));
objj_msgSend(_1f,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(autoSelectAudioCheckbox,"frame")),CGRectGetMidY(objj_msgSend(subtitleModePopup,"frame"))-CGRectGetHeight(objj_msgSend(_1f,"frame"))/2,CGRectGetWidth(objj_msgSend(autoSelectAudioCheckbox,"frame")),CGRectGetHeight(objj_msgSend(_1f,"frame"))));
objj_msgSend(defaultSubtitleLanguagePopup,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(subtitleModePopup,"frame")),CGRectGetMaxY(objj_msgSend(subtitleModePopup,"frame"))+10,_22,CGRectGetHeight(objj_msgSend(defaultSubtitleLanguagePopup,"frame"))));
objj_msgSend(_20,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(autoSelectAudioCheckbox,"frame")),CGRectGetMidY(objj_msgSend(defaultSubtitleLanguagePopup,"frame"))-CGRectGetHeight(objj_msgSend(_20,"frame"))/2,_21,CGRectGetHeight(objj_msgSend(_20,"frame"))));
objj_msgSend(_1c,"addSubview:",autoSelectAudioCheckbox);
objj_msgSend(_1c,"addSubview:",defaultAudioLanguagePopup);
objj_msgSend(_1c,"addSubview:",_1f);
objj_msgSend(_1c,"addSubview:",subtitleModePopup);
objj_msgSend(_1c,"addSubview:",_20);
objj_msgSend(_1c,"addSubview:",defaultSubtitleLanguagePopup);
}
return _1c;
}
})]);
p;18;Models/MMAccount.jt;3223;@STATIC;1.0;i;10;MMRecord.ji;8;PMSURL.jt;3177;
objj_executeFile("MMRecord.j",YES);
objj_executeFile("PMSURL.j",YES);
MMAccountSubtitleModeManual=0;
MMAccountSubtitleModeForeignAudio=1;
MMAccountSubtitleModeAlwaysEnabled=2;
var _1=objj_allocateClassPair(MMRecord,"MMAccount"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("password"),new objj_ivar("defaultAudioLanguage"),new objj_ivar("defaultSubtitleLanguage"),new objj_ivar("autoSelectAudio"),new objj_ivar("subtitleMode")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_5,_6,_7){
with(_5){
name=_7;
}
}),new objj_method(sel_getUid("password"),function(_8,_9){
with(_8){
return password;
}
}),new objj_method(sel_getUid("setPassword:"),function(_a,_b,_c){
with(_a){
password=_c;
}
}),new objj_method(sel_getUid("defaultAudioLanguage"),function(_d,_e){
with(_d){
return defaultAudioLanguage;
}
}),new objj_method(sel_getUid("setDefaultAudioLanguage:"),function(_f,_10,_11){
with(_f){
defaultAudioLanguage=_11;
}
}),new objj_method(sel_getUid("defaultSubtitleLanguage"),function(_12,_13){
with(_12){
return defaultSubtitleLanguage;
}
}),new objj_method(sel_getUid("setDefaultSubtitleLanguage:"),function(_14,_15,_16){
with(_14){
defaultSubtitleLanguage=_16;
}
}),new objj_method(sel_getUid("autoSelectAudio"),function(_17,_18){
with(_17){
return autoSelectAudio;
}
}),new objj_method(sel_getUid("setAutoSelectAudio:"),function(_19,_1a,_1b){
with(_19){
autoSelectAudio=_1b;
}
}),new objj_method(sel_getUid("subtitleMode"),function(_1c,_1d){
with(_1c){
return subtitleMode;
}
}),new objj_method(sel_getUid("setSubtitleMode:"),function(_1e,_1f,_20){
with(_1e){
subtitleMode=_20;
}
}),new objj_method(sel_getUid("key"),function(_21,_22){
with(_21){
return objj_msgSend(CPString,"stringWithFormat:","/accounts/%@",objj_msgSend(_21,"id"));
}
}),new objj_method(sel_getUid("setKey:"),function(_23,_24,_25){
with(_23){
objj_msgSend(_23,"setId:",objj_msgSend(objj_msgSend(_23,"class"),"idFromKey:",_25));
}
}),new objj_method(sel_getUid("setDefaultAudioLanguage:"),function(_26,_27,_28){
with(_26){
if(objj_msgSend(_28,"isKindOfClass:",objj_msgSend(CPString,"class"))){
_28=objj_msgSend(objj_msgSend(LanguageConfig,"alloc"),"initWithCode:",_28);
}
defaultAudioLanguage=_28;
}
}),new objj_method(sel_getUid("setDefaultSubtitleLanguage:"),function(_29,_2a,_2b){
with(_29){
if(objj_msgSend(_2b,"isKindOfClass:",objj_msgSend(CPString,"class"))){
_2b=objj_msgSend(objj_msgSend(LanguageConfig,"alloc"),"initWithCode:",_2b);
}
defaultSubtitleLanguage=_2b;
}
}),new objj_method(sel_getUid("URL"),function(_2c,_2d){
with(_2c){
return objj_msgSend(PMSURL,"URLWithPath:",objj_msgSend(_2c,"key"));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("observedAttributes"),function(_2e,_2f){
with(_2e){
return objj_msgSend(CPSet,"setWithObjects:","name","password","defaultAudioLanguage","defaultSubtitleLanguage","autoSelectAudio","subtitleMode");
}
}),new objj_method(sel_getUid("idFromKey:"),function(_30,_31,_32){
with(_30){
return Number(objj_msgSend(_32,"stringByReplacingOccurrencesOfString:withString:","/accounts/",""));
}
})]);
p;33;DataSources/MMAccountDataSource.jt;3057;@STATIC;1.0;i;14;MMDataSource.ji;21;../Models/MMAccount.jt;2993;
objj_executeFile("MMDataSource.j",YES);
objj_executeFile("../Models/MMAccount.j",YES);
var _1=objj_allocateClassPair(MMDataSource,"MMAccountDataSource"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("adminAccount")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("URLForRecordsWithContextInfo:"),function(_3,_4,_5){
with(_3){
return objj_msgSend(PMSURL,"URLWithPath:","/accounts");
}
}),new objj_method(sel_getUid("URLForRecord:contextInfo:"),function(_6,_7,_8,_9){
with(_6){
return objj_msgSend(_8,"URL");
}
}),new objj_method(sel_getUid("URLForUpdatedRecord:contextInfo:"),function(_a,_b,_c,_d){
with(_a){
var _e=objj_msgSend(CPMutableDictionary,"dictionaryWithDictionary:",objj_msgSend(_c,"changedAttributeDictionary"));
if(objj_msgSend(_e,"containsKey:","name")){
objj_msgSend(_e,"setObject:forKey:",objj_msgSend(_e,"objectForKey:","name"),"username");
objj_msgSend(_e,"removeObjectForKey:","name");
}
if(objj_msgSend(_e,"containsKey:","password")){
objj_msgSend(_e,"setObject:forKey:",objj_msgSend(_e,"objectForKey:","password"),"newPassword");
objj_msgSend(_e,"removeObjectForKey:","password");
}
if(objj_msgSend(_e,"containsKey:","subtitleMode")){
objj_msgSend(_e,"setObject:forKey:",objj_msgSend(_e,"objectForKey:","subtitleMode"),"autoSelectSubtitle");
}
if(objj_msgSend(_d,"isKindOfClass:",objj_msgSend(CPDictionary,"class"))){
objj_msgSend(_e,"addEntriesFromDictionary:",_d);
}
return objj_msgSend(PMSURL,"URLWithPath:params:",objj_msgSend(objj_msgSend(_c,"URL"),"path"),_e);
}
}),new objj_method(sel_getUid("HTTPBodyForUpdatedRecord:contextInfo:"),function(_f,_10,_11,_12){
with(_f){
return nil;
}
}),new objj_method(sel_getUid("recordFromElement:contextInfo:"),function(_13,_14,_15,_16){
with(_13){
return objj_msgSend(objj_msgSend(_13,"dataStore"),"recordWithClass:id:",objj_msgSend(MMAccount,"class"),objj_msgSend(MMAccount,"idFromKey:",_15.getAttribute("key")));
}
}),new objj_method(sel_getUid("updateRecord:fromElement:contextInfo:"),function(_17,_18,_19,_1a,_1b){
with(_17){
objj_msgSend(_19,"setName:",_1a.getAttribute("name"));
objj_msgSend(_19,"setDefaultAudioLanguage:",_1a.getAttribute("defaultAudioLanguage"));
objj_msgSend(_19,"setDefaultSubtitleLanguage:",_1a.getAttribute("defaultSubtitleLanguage"));
objj_msgSend(_19,"setAutoSelectAudio:",(_1a.getAttribute("autoSelectAudio")=="1"));
objj_msgSend(_19,"setSubtitleMode:",Number(_1a.getAttribute("subtitleMode")||_1a.getAttribute("autoSelectSubtitle")));
}
}),new objj_method(sel_getUid("adminAccount"),function(_1c,_1d){
with(_1c){
if(!adminAccount){
adminAccount=objj_msgSend(objj_msgSend(MMDataStore,"defaultDataStore"),"recordWithClass:id:",objj_msgSend(MMAccount,"class"),1);
objj_msgSend(_1c,"refreshRecord:",adminAccount);
}
return adminAccount;
}
}),new objj_method(sel_getUid("updateRecord:withPassword:"),function(_1e,_1f,_20,_21){
with(_1e){
objj_msgSend(_1e,"updateRecord:contextInfo:",_20,objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",_21,"password"));
}
})]);
p;48;Controllers/MMPreferencesAgentsPanelController.jt;10975;@STATIC;1.0;i;34;MMPreferencesBasePanelController.ji;34;../DataSources/MMAgentDataSource.ji;19;../Models/MMAgent.ji;35;../Views/MMPreferencesAgentsPanel.jt;10813;
objj_executeFile("MMPreferencesBasePanelController.j",YES);
objj_executeFile("../DataSources/MMAgentDataSource.j",YES);
objj_executeFile("../Models/MMAgent.j",YES);
objj_executeFile("../Views/MMPreferencesAgentsPanel.j",YES);
var _1=objj_allocateClassPair(MMPreferencesBasePanelController,"MMPreferencesAgentsPanelController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("agentsDataSource"),new objj_ivar("agentsByMediaType"),new objj_ivar("agentGroups"),new objj_ivar("agentOutlineView"),new objj_ivar("contributorsTableView"),new objj_ivar("selectedAgent"),new objj_ivar("loadingContributors"),new objj_ivar("loadingIndicatorDelayTimer"),new objj_ivar("contributorsForSelectedAgent")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("identifier"),function(_3,_4){
with(_3){
return "Agents";
}
}),new objj_method(sel_getUid("title"),function(_5,_6){
with(_5){
return CPLocalizedString("Agents","Agents");
}
}),new objj_method(sel_getUid("contentInset"),function(_7,_8){
with(_7){
return CGInsetMake(0,0,0,0);
}
}),new objj_method(sel_getUid("loadView"),function(_9,_a){
with(_9){
objj_msgSend(_9,"setView:",objj_msgSend(objj_msgSend(MMPreferencesAgentsPanel,"alloc"),"initWithFrame:",CGRectMake(0,0,520,350)));
agentOutlineView=objj_msgSend(objj_msgSend(_9,"view"),"agentOutlineView");
objj_msgSend(agentOutlineView,"setDataSource:",_9);
objj_msgSend(agentOutlineView,"setDelegate:",_9);
contributorsTableView=objj_msgSend(objj_msgSend(_9,"view"),"contributorsTableView");
objj_msgSend(contributorsTableView,"setDataSource:",_9);
objj_msgSend(contributorsTableView,"setDelegate:",_9);
agentsDataSource=objj_msgSend(objj_msgSend(MMAgentDataSource,"alloc"),"initWithDelegate:",_9);
objj_msgSend(agentsDataSource,"refreshRecords");
}
}),new objj_method(sel_getUid("dataSource:didReceiveRecords:contextInfo:"),function(_b,_c,_d,_e,_f){
with(_b){
if(objj_msgSend(_f,"isEqual:",selectedAgent)){
contributorsForSelectedAgent=objj_msgSend(selectedAgent,"contributorList");
loadingContributors=NO;
objj_msgSend(contributorsTableView,"setEnabled:",YES);
objj_msgSend(contributorsTableView,"reloadData");
}else{
agentsByMediaType=objj_msgSend(CPMutableDictionary,"dictionary");
agentGroups=objj_msgSend(CPMutableArray,"array");
objj_msgSend(_e,"enumerateObjectsUsingBlock:",function(_10){
var _11=objj_msgSend(_10,"mediaType");
if(!objj_msgSend(agentsByMediaType,"containsKey:",_11)){
objj_msgSend(agentsByMediaType,"setObject:forKey:",objj_msgSend(CPMutableArray,"array"),_11);
objj_msgSend(agentGroups,"addObject:",objj_msgSend(agentsByMediaType,"objectForKey:",_11));
}
objj_msgSend(objj_msgSend(agentsByMediaType,"objectForKey:",_11),"addObject:",_10);
});
objj_msgSend(objj_msgSend(agentsByMediaType,"allValues"),"enumerateObjectsUsingBlock:",function(_12){
objj_msgSend(_12,"sortUsingSelector:",sel_getUid("compare:"));
});
objj_msgSend(agentOutlineView,"reloadData");
objj_msgSend(agentOutlineView,"expandItem:expandChildren:",nil,YES);
if(objj_msgSend(objj_msgSend(agentOutlineView,"selectedRowIndexes"),"count")==0&&objj_msgSend(_e,"count")!=0){
objj_msgSend(agentOutlineView,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",1),NO);
}
}
}
}),new objj_method(sel_getUid("dataSource:didUpdateRecord:contextInfo:"),function(_13,_14,_15,_16,_17){
with(_13){
}
}),new objj_method(sel_getUid("dataSource:didFailToUpdateRecord:contextInfo:"),function(_18,_19,_1a,_1b,_1c){
with(_18){
objj_msgSend(AppController,"notifyUserOfError:withTitle:",CPLocalizedString("There was a problem saving your changes to the agent settings. Make sure Plex Media Server is running and try again.","Error message for problems saving agent settings"),CPLocalizedString("Agent Settings Save Error","Error title for problems saving agent settings"));
}
}),new objj_method(sel_getUid("outlineView:child:ofItem:"),function(_1d,_1e,_1f,_20,_21){
with(_1d){
if(_21==nil){
return objj_msgSend(agentGroups,"objectAtIndex:",_20);
}
return objj_msgSend(_21,"objectAtIndex:",_20);
}
}),new objj_method(sel_getUid("outlineView:numberOfChildrenOfItem:"),function(_22,_23,_24,_25){
with(_22){
if(_25==nil){
return objj_msgSend(agentGroups,"count");
}else{
if(objj_msgSend(_25,"isKindOfClass:",CPArray)){
return objj_msgSend(_25,"count");
}else{
return 0;
}
}
}
}),new objj_method(sel_getUid("outlineView:objectValueForTableColumn:byItem:"),function(_26,_27,_28,_29,_2a){
with(_26){
if(objj_msgSend(_2a,"isKindOfClass:",objj_msgSend(CPArray,"class"))){
return objj_msgSend(_26,"localizedSectionTitleForMediaType:",objj_msgSend(objj_msgSend(_2a,"objectAtIndex:",0),"mediaType"));
}
return objj_msgSend(_2a,"name");
}
}),new objj_method(sel_getUid("localizedSectionTitleForMediaType:"),function(_2b,_2c,_2d){
with(_2b){
switch(_2d){
case "artist":
return CPLocalizedString("ARTISTS","Agent settings title for musical artists");
case "movie":
return CPLocalizedString("MOVIES","Agent settings title for movies");
case "album":
return CPLocalizedString("ALBUMS","Agent settings title for music albums");
case "show":
return CPLocalizedString("TV SHOWS","Agent settings title for TV shows");
case "photo":
return CPLocalizedString("PHOTOS","Agent settings title for photos");
default:
return objj_msgSend(_2d,"uppercaseString");
}
}
}),new objj_method(sel_getUid("outlineView:isGroupItem:"),function(_2e,_2f,_30,_31){
with(_2e){
return objj_msgSend(_31,"isKindOfClass:",objj_msgSend(CPArray,"class"));
}
}),new objj_method(sel_getUid("outlineView:shouldSelectItem:"),function(_32,_33,_34,_35){
with(_32){
return objj_msgSend(_35,"isKindOfClass:",objj_msgSend(MMAgent,"class"));
}
}),new objj_method(sel_getUid("outlineView:isItemExpandable:"),function(_36,_37,_38,_39){
with(_36){
return objj_msgSend(_36,"outlineView:numberOfChildrenOfItem:",_38,_39)>0;
}
}),new objj_method(sel_getUid("outlineView:dataViewForTableColumn:item:"),function(_3a,_3b,_3c,_3d,_3e){
with(_3a){
return objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMakeZero());
}
}),new objj_method(sel_getUid("outlineViewSelectionDidChange:"),function(_3f,_40,_41){
with(_3f){
selectedAgent=objj_msgSend(agentOutlineView,"itemAtRow:",objj_msgSend(agentOutlineView,"selectedRow"));
objj_msgSend(objj_msgSend(_3f,"view"),"setSelectedAgentName:",objj_msgSend(selectedAgent,"name"));
contributorsForSelectedAgent=objj_msgSend(CPArray,"array");
loadingContributors=YES;
objj_msgSend(contributorsTableView,"setEnabled:",NO);
objj_msgSend(loadingIndicatorDelayTimer,"invalidate");
loadingIndicatorDelayTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",0.3,function(){
objj_msgSend(contributorsTableView,"reloadData");
},NO);
objj_msgSend(agentsDataSource,"refreshRecord:",selectedAgent);
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_42,_43,_44){
with(_42){
if(loadingContributors){
return 1;
}
return objj_msgSend(contributorsForSelectedAgent,"count");
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_45,_46,_47,_48,_49){
with(_45){
if(loadingContributors){
return (objj_msgSend(_48,"identifier")=="enabled")?CPOffState:CPLocalizedString("Loading...","Text-based loading indicator");
}
var _4a=objj_msgSend(contributorsForSelectedAgent,"objectAtIndex:",_49);
switch(objj_msgSend(_48,"identifier")){
case "enabled":
return objj_msgSend(_4a,"isEnabled")?CPOnState:CPOffState;
case "name":
return objj_msgSend(_4a,"name");
}
}
}),new objj_method(sel_getUid("tableView:setObjectValue:forTableColumn:row:"),function(_4b,_4c,_4d,_4e,_4f,_50){
with(_4b){
switch(objj_msgSend(_4f,"identifier")){
case "enabled":
objj_msgSend(objj_msgSend(contributorsForSelectedAgent,"objectAtIndex:",_50),"setEnabled:",_4e==CPOnState);
objj_msgSend(_4b,"saveCurrentAgentConfig");
break;
default:
CPLog.warn("[%@ %@] set object value for unexpected column '%@'",objj_msgSend(_4b,"class"),_4c,objj_msgSend(_4f,"identifier"));
break;
}
}
}),new objj_method(sel_getUid("tableView:writeRowsWithIndexes:toPasteboard:"),function(_51,_52,_53,_54,_55){
with(_51){
var _56=objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_54);
objj_msgSend(_55,"declareTypes:owner:",objj_msgSend(CPArray,"arrayWithObject:",AgentDropType),_51);
objj_msgSend(_55,"setData:forType:",_56,AgentDropType);
return YES;
}
}),new objj_method(sel_getUid("tableView:validateDrop:proposedRow:proposedDropOperation:"),function(_57,_58,_59,_5a,row,_5b){
with(_57){
if(objj_msgSend(_5a,"draggingSource")==contributorsTableView){
if(_5b==CPTableViewDropOn){
objj_msgSend(_59,"setDropRow:dropOperation:",row,CPTableViewDropAbove);
}
return CPDragOperationMove;
}else{
return CPDragOperationNone;
}
}
}),new objj_method(sel_getUid("tableView:acceptDrop:row:dropOperation:"),function(_5c,_5d,_5e,_5f,row,_60){
with(_5c){
var _61=objj_msgSend(_5f,"draggingPasteboard");
var _62=objj_msgSend(_61,"dataForType:",AgentDropType);
var _63=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_62);
var _64=objj_msgSend(CPMutableArray,"arrayWithArray:",contributorsForSelectedAgent);
var _65=objj_msgSend(CPMutableArray,"arrayWithCapacity:",objj_msgSend(_63,"count"));
var _66=objj_msgSend(_63,"firstIndex");
while(_66!=CPNotFound){
var _67=objj_msgSend(_64,"objectAtIndex:",_66);
objj_msgSend(_65,"addObject:",_67);
objj_msgSend(_64,"removeObject:",_67);
if(_66<row){
row--;
}
_66=objj_msgSend(_63,"indexGreaterThanIndex:",_66);
}
var _68=objj_msgSend(_64,"objectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(0,row)));
var _69=objj_msgSend(_64,"objectsAtIndexes:",objj_msgSend(CPIndexSet,"indexSetWithIndexesInRange:",CPMakeRange(row,objj_msgSend(_64,"count")-row)));
var _6a=objj_msgSend(CPMutableArray,"arrayWithArray:",_68);
objj_msgSend(_6a,"addObjectsFromArray:",_65);
objj_msgSend(_6a,"addObjectsFromArray:",_69);
contributorsForSelectedAgent=_6a;
objj_msgSend(contributorsTableView,"reloadData");
objj_msgSend(contributorsTableView,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",row),NO);
objj_msgSend(_5c,"saveCurrentAgentConfig");
}
}),new objj_method(sel_getUid("saveCurrentAgentConfig"),function(_6b,_6c){
with(_6b){
var _6d=objj_msgSend(CPMutableArray,"array");
objj_msgSend(contributorsForSelectedAgent,"enumerateObjectsUsingBlock:",function(_6e){
if(objj_msgSend(_6e,"isEnabled")){
objj_msgSend(_6d,"addObject:",_6e);
}
});
objj_msgSend(agentsDataSource,"updateContributors:forAgent:",_6d,selectedAgent);
return YES;
}
}),new objj_method(sel_getUid("tableView:willDisplayView:forTableColumn:row:"),function(_6f,_70,_71,_72,_73,_74){
with(_6f){
if(loadingContributors){
return;
}
if(objj_msgSend(objj_msgSend(_73,"identifier"),"isEqual:","enabled")){
objj_msgSend(_72,"setEnabled:",!objj_msgSend(objj_msgSend(contributorsForSelectedAgent,"objectAtIndex:",_74),"isEqual:",selectedAgent));
}
}
})]);
p;32;Views/MMPreferencesAgentsPanel.jt;5866;@STATIC;1.0;I;15;AppKit/CPView.ji;15;MMOutlineView.jt;5807;
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("MMOutlineView.j",YES);
AgentDropType="AgentDropType";
var _1=objj_allocateClassPair(CPView,"MMPreferencesAgentsPanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("agentOutlineView"),new objj_ivar("descriptionLabel"),new objj_ivar("contributorsTableView"),new objj_ivar("contributorsScrollView"),new objj_ivar("selectedAgentName")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("agentOutlineView"),function(_3,_4){
with(_3){
return agentOutlineView;
}
}),new objj_method(sel_getUid("descriptionLabel"),function(_5,_6){
with(_5){
return descriptionLabel;
}
}),new objj_method(sel_getUid("contributorsTableView"),function(_7,_8){
with(_7){
return contributorsTableView;
}
}),new objj_method(sel_getUid("selectedAgentName"),function(_9,_a){
with(_9){
return selectedAgentName;
}
}),new objj_method(sel_getUid("setSelectedAgentName:"),function(_b,_c,_d){
with(_b){
selectedAgentName=_d;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_e,_f,_10){
with(_e){
if(_e=objj_msgSendSuper({receiver:_e,super_class:objj_getClass("MMPreferencesAgentsPanel").super_class},"initWithFrame:",_10)){
var _11=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,175,CGRectGetHeight(_10)));
objj_msgSend(_11,"setHasHorizontalScroller:",NO);
objj_msgSend(_11,"setAutohidesScrollers:",YES);
agentOutlineView=objj_msgSend(objj_msgSend(MMOutlineView,"alloc"),"initWithFrame:",objj_msgSend(_11,"bounds"));
objj_msgSend(_11,"setDocumentView:",agentOutlineView);
var _12=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","TextColumn");
objj_msgSend(_12,"setWidth:",CGRectGetWidth(objj_msgSend(agentOutlineView,"frame"))-10);
objj_msgSend(agentOutlineView,"setAllowsEmptySelection:",NO);
objj_msgSend(agentOutlineView,"setAllowsMultipleSelection:",NO);
objj_msgSend(agentOutlineView,"setShouldShowDisclosureViews:",NO);
objj_msgSend(agentOutlineView,"setHeaderView:",nil);
objj_msgSend(agentOutlineView,"setCornerView:",nil);
objj_msgSend(agentOutlineView,"addTableColumn:",_12);
objj_msgSend(agentOutlineView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",222/255,228/255,234/255,1));
objj_msgSend(agentOutlineView,"setRowHeight:",17);
objj_msgSend(_e,"addSubview:",_11);
objj_msgSend(CPBox,"boxEnclosingView:",_11);
descriptionLabel=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(descriptionLabel,"setLineBreakMode:",CPLineBreakByWordWrapping);
var _13=objj_msgSend(descriptionLabel,"frame");
_13.origin=CGPointMake(CGRectGetMaxX(objj_msgSend(agentOutlineView,"frame"))+20,CGRectGetMinY(objj_msgSend(agentOutlineView,"frame"))+5);
_13.size=CGSizeMake(CGRectGetWidth(objj_msgSend(_e,"frame"))-CGRectGetMinX(_13)-20,0);
objj_msgSend(descriptionLabel,"setFrame:",_13);
objj_msgSend(descriptionLabel,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_e,"addSubview:",descriptionLabel);
contributorsScrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(contributorsScrollView,"setAutohidesScrollers:",YES);
objj_msgSend(contributorsScrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(contributorsScrollView,"setBorderType:",CPLineBorder);
contributorsTableView=objj_msgSend(objj_msgSend(CPTableView,"alloc"),"initWithFrame:",objj_msgSend(contributorsScrollView,"bounds"));
objj_msgSend(contributorsTableView,"setUsesAlternatingRowBackgroundColors:",YES);
objj_msgSend(contributorsTableView,"setHeaderView:",nil);
objj_msgSend(contributorsTableView,"setCornerView:",nil);
objj_msgSend(contributorsTableView,"registerForDraggedTypes:",objj_msgSend(CPArray,"arrayWithObject:",AgentDropType));
objj_msgSend(contributorsScrollView,"setDocumentView:",contributorsTableView);
var _14=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","enabled");
objj_msgSend(_14,"setWidth:",18);
objj_msgSend(_14,"setDataView:",objj_msgSend(CPCheckBox,"checkBoxWithTitle:",""));
objj_msgSend(contributorsTableView,"addTableColumn:",_14);
var _15=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","name");
objj_msgSend(contributorsTableView,"addTableColumn:",_15);
objj_msgSend(contributorsTableView,"setAlternatingRowBackgroundColors:",[objj_msgSend(CPColor,"whiteColor"),objj_msgSend(CPColor,"colorWithRed:green:blue:alpha:",237/255,243/255,254/255,1)]);
objj_msgSend(_e,"addSubview:",contributorsScrollView);
}
return _e;
}
}),new objj_method(sel_getUid("setSelectedAgentName:"),function(_16,_17,_18){
with(_16){
if(objj_msgSend(selectedAgentName,"isEqualToString:",_18)){
return;
}
selectedAgentName=_18;
objj_msgSend(_16,"setNeedsLayout");
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_19,_1a){
with(_19){
objj_msgSendSuper({receiver:_19,super_class:objj_getClass("MMPreferencesAgentsPanel").super_class},"layoutSubviews");
var _1b=objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Select which additional agents should contribute to metadata from %@, and drag them to change the order of preference.","Instructions on the Agent preferences panel"),selectedAgentName);
var _1c=objj_msgSend(_1b,"sizeWithFont:inWidth:",objj_msgSend(descriptionLabel,"font"),CGRectGetWidth(objj_msgSend(descriptionLabel,"frame")));
_1c.height+=5;
objj_msgSend(descriptionLabel,"setFrameSize:",_1c);
objj_msgSend(descriptionLabel,"setStringValue:",_1b);
objj_msgSend(contributorsScrollView,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(descriptionLabel,"frame")),CGRectGetMaxY(objj_msgSend(descriptionLabel,"frame"))+5,CGRectGetWidth(objj_msgSend(descriptionLabel,"frame")),CGRectGetHeight(objj_msgSend(_19,"frame"))-CGRectGetMaxY(objj_msgSend(descriptionLabel,"frame"))-10));
objj_msgSend(contributorsTableView,"sizeLastColumnToFit");
}
})]);
p;53;Controllers/MMPreferencesTranscodingPanelController.jt;816;@STATIC;1.0;i;34;MMPreferencesBasePanelController.ji;40;../Views/MMPreferencesTranscodingPanel.jt;714;
objj_executeFile("MMPreferencesBasePanelController.j",YES);
objj_executeFile("../Views/MMPreferencesTranscodingPanel.j",YES);
var _1=objj_allocateClassPair(MMPreferencesBasePanelController,"MMPreferencesTranscodingPanelController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("identifier"),function(_3,_4){
with(_3){
return "Transcoding";
}
}),new objj_method(sel_getUid("title"),function(_5,_6){
with(_5){
return CPLocalizedString("Transcoding","Transcoding");
}
}),new objj_method(sel_getUid("loadView"),function(_7,_8){
with(_7){
objj_msgSend(_7,"setView:",objj_msgSend(objj_msgSend(MMPreferencesTranscodingPanel,"alloc"),"initWithFrame:",CGRectMakeZero()));
}
})]);
p;37;Views/MMPreferencesTranscodingPanel.jt;832;@STATIC;1.0;I;15;AppKit/CPView.jt;794;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"MMPreferencesTranscodingPanel"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMPreferencesTranscodingPanel").super_class},"initWithFrame:",_5)){
var _6=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("Offer higher bitrates over 3G connections","Preference window setting"));
objj_msgSend(_6,"sizeToFit");
objj_msgSend(_6,"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.higherBitrate3G",nil);
objj_msgSend(_3,"addSubview:",_6);
objj_msgSend(_3,"sizeToFit");
}
return _3;
}
})]);
p;48;Controllers/MMPreferencesMyPlexPanelController.jt;17742;@STATIC;1.0;i;34;MMPreferencesBasePanelController.ji;35;../DataSources/MMMyPlexDataSource.ji;26;../Models/MMMyPlexStatus.ji;35;../Views/MMPreferencesMyPlexPanel.ji;19;../Views/MMPrompt.jt;17548;
objj_executeFile("MMPreferencesBasePanelController.j",YES);
objj_executeFile("../DataSources/MMMyPlexDataSource.j",YES);
objj_executeFile("../Models/MMMyPlexStatus.j",YES);
objj_executeFile("../Views/MMPreferencesMyPlexPanel.j",YES);
objj_executeFile("../Views/MMPrompt.j",YES);
var _1=objj_allocateClassPair(MMPreferencesBasePanelController,"MMPreferencesMyPlexPanelController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("signInPrompt"),new objj_ivar("signUpPrompt"),new objj_ivar("myPlexDataSource"),new objj_ivar("statusRefreshTimer")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("identifier"),function(_3,_4){
with(_3){
return "myPlex";
}
}),new objj_method(sel_getUid("title"),function(_5,_6){
with(_5){
return CPLocalizedString("myPlex","myPlex");
}
}),new objj_method(sel_getUid("viewWillAppear"),function(_7,_8){
with(_7){
myPlexDataSource=objj_msgSend(objj_msgSend(MMMyPlexDataSource,"alloc"),"initWithDelegate:",_7);
objj_msgSend(myPlexDataSource,"refreshRecord:",objj_msgSend(MMMyPlexStatus,"sharedStatus"));
objj_msgSend(objj_msgSend(MMPrefsController,"sharedPrefsController"),"addObserver:forKeyPath:options:context:",_7,"values.PublishServerOnPlexOnlineKey",CPKeyValueChangeNewKey,nil);
objj_msgSend(objj_msgSend(objj_msgSend(_7,"view"),"publishCheckbox"),"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.PublishServerOnPlexOnlineKey",nil);
objj_msgSend(objj_msgSend(objj_msgSend(_7,"view"),"mappingStatus"),"bind:toObject:withKeyPath:options:","hidden",objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.PublishServerOnPlexOnlineKey",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPNegateBooleanTransformer,CPValueTransformerNameBindingOption));
[objj_msgSend(objj_msgSend(objj_msgSend(_7,"view"),"myPlexStatus"),"bind:toObject:withKeyPath:options:","hidden",objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.PublishServerOnPlexOnlineKey",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPNegateBooleanTransformer,CPValueTransformerNameBindingOption))];
objj_msgSend(objj_msgSend(objj_msgSend(_7,"view"),"manualMappingCheckbox"),"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.ManualPortMappingMode",nil);
objj_msgSend(objj_msgSend(objj_msgSend(_7,"view"),"manualMappingPortField"),"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.ManualPortMappingPort",nil);
objj_msgSend(objj_msgSend(_7,"view"),"bind:toObject:withKeyPath:options:","manualPortControlsHidden",_7,"manualPortControlsHidden",nil);
}
}),new objj_method(sel_getUid("viewWillDisappear"),function(_9,_a){
with(_9){
objj_msgSend(myPlexDataSource,"cancelAllRequests"),myPlexDataSource=nil;
objj_msgSend(statusRefreshTimer,"invalidate"),statusRefreshTimer=nil;
objj_msgSend(objj_msgSend(MMPrefsController,"sharedPrefsController"),"removeObserver:forKeyPath:",_9,"values.PublishServerOnPlexOnlineKey");
objj_msgSend(objj_msgSend(objj_msgSend(_9,"view"),"publishCheckbox"),"unbind:",CPValueBinding);
objj_msgSend(objj_msgSend(objj_msgSend(_9,"view"),"mappingStatus"),"unbind:","hidden");
objj_msgSend(objj_msgSend(objj_msgSend(_9,"view"),"myPlexStatus"),"unbind:","hidden");
objj_msgSend(objj_msgSend(objj_msgSend(_9,"view"),"manualMappingCheckbox"),"unbind:",CPValueBinding);
objj_msgSend(objj_msgSend(objj_msgSend(_9,"view"),"manualMappingPortField"),"unbind:",CPValueBinding);
objj_msgSend(objj_msgSend(_9,"view"),"unbind:","manualPortControlsHidden");
}
}),new objj_method(sel_getUid("manualPortControlsHidden"),function(_b,_c){
with(_b){
return !objj_msgSend(objj_msgSend(MMMyPlexStatus,"sharedStatus"),"signedIn");
}
}),new objj_method(sel_getUid("dataSource:didReceiveRecords:contextInfo:"),function(_d,_e,_f,_10,_11){
with(_d){
statusRefreshTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",2,function(){
objj_msgSend(myPlexDataSource,"refreshRecord:",objj_msgSend(MMMyPlexStatus,"sharedStatus"));
},NO);
objj_msgSend(_d,"invalidateAllStatusFieldsWithCallback:",nil);
objj_msgSend(objj_msgSend(_d,"view"),"setNeedsLayout");
objj_msgSend(objj_msgSend(_d,"view"),"setSignedIn:",objj_msgSend(objj_msgSend(MMMyPlexStatus,"sharedStatus"),"signedIn"));
}
}),new objj_method(sel_getUid("dataSource:didFailToReceiveRecordsWithError:contextInfo:"),function(_12,_13,_14,_15,_16){
with(_12){
statusRefreshTimer=objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:callback:repeats:",10,function(){
objj_msgSend(myPlexDataSource,"refreshRecord:",objj_msgSend(MMMyPlexStatus,"sharedStatus"));
},NO);
}
}),new objj_method(sel_getUid("dataSource:didUpdateRecord:contextInfo:"),function(_17,_18,_19,_1a,_1b){
with(_17){
if(objj_msgSend(_1a,"signInState")===MMMyPlexSignInStateAuthenticated){
objj_msgSend(signInPrompt,"dismissPrompt"),signInPrompt=nil;
}else{
objj_msgSend(signInPrompt,"shake");
}
}
}),new objj_method(sel_getUid("dataSource:didFailToUpdateRecord:withError:contextInfo:"),function(_1c,_1d,_1e,_1f,_20,_21){
with(_1c){
objj_msgSend(signInPrompt,"shake");
}
}),new objj_method(sel_getUid("dataSource:didCreateRecord:contextInfo:"),function(_22,_23,_24,_25,_26){
with(_22){
if(objj_msgSend(_25,"signInState")===MMMyPlexSignInStateAuthenticated){
objj_msgSend(signUpPrompt,"dismissPrompt"),signUpPrompt=nil;
}else{
objj_msgSend(signUpPrompt,"shake");
}
}
}),new objj_method(sel_getUid("dataSource:didFailToCreateRecord:withError:contextInfo:"),function(_27,_28,_29,_2a,_2b,_2c){
with(_27){
objj_msgSend(signUpPrompt,"shake");
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_2d,_2e,_2f,_30,_31,_32){
with(_2d){
if(_30===objj_msgSend(MMPrefsController,"sharedPrefsController")&&objj_msgSend(_2f,"isEqualToString:","values.PublishServerOnPlexOnlineKey")){
objj_msgSend(_2d,"invalidateAllStatusFieldsWithCallback:",function(){
var _33=objj_msgSend(MMMyPlexStatus,"sharedStatus");
objj_msgSend(_33,"setMappingState:",MMMyPlexMappingStateWaiting);
objj_msgSend(_33,"setMappingError:",nil);
objj_msgSend(_33,"setMappingErrorMessage:",nil);
});
}
}
}),new objj_method(sel_getUid("invalidateAllStatusFieldsWithCallback:"),function(_34,_35,_36){
with(_34){
objj_msgSend(_34,"willChangeValueForKey:","hasSignInError");
objj_msgSend(_34,"willChangeValueForKey:","signInStatusMessage");
objj_msgSend(_34,"willChangeValueForKey:","signInStatusType");
objj_msgSend(_34,"willChangeValueForKey:","mappingStatusMessage");
objj_msgSend(_34,"willChangeValueForKey:","mappingStatusType");
objj_msgSend(_34,"willChangeValueForKey:","myPlexStatusMessage");
objj_msgSend(_34,"willChangeValueForKey:","myPlexStatusType");
objj_msgSend(_34,"willChangeValueForKey:","manualPortControlsHidden");
if(_36){
_36();
}
objj_msgSend(_34,"didChangeValueForKey:","manualPortControlsHidden");
objj_msgSend(_34,"didChangeValueForKey:","myPlexStatusType");
objj_msgSend(_34,"didChangeValueForKey:","myPlexStatusMessage");
objj_msgSend(_34,"didChangeValueForKey:","mappingStatusType");
objj_msgSend(_34,"didChangeValueForKey:","mappingStatusMessage");
objj_msgSend(_34,"didChangeValueForKey:","signInStatusType");
objj_msgSend(_34,"didChangeValueForKey:","signInStatusMessage");
objj_msgSend(_34,"didChangeValueForKey:","hasSignInError");
}
}),new objj_method(sel_getUid("loadView"),function(_37,_38){
with(_37){
objj_msgSend(_37,"setView:",objj_msgSend(objj_msgSend(MMPreferencesMyPlexPanel,"alloc"),"initWithFrame:",CGRectMake(0,0,455,225)));
var _39=objj_msgSend(objj_msgSend(_37,"view"),"signInStatus");
objj_msgSend(_39,"bind:toObject:withKeyPath:options:","type",_37,"signInStatusType",nil);
objj_msgSend(_39,"bind:toObject:withKeyPath:options:","stringValue",_37,"signInStatusMessage",nil);
var _3a=objj_msgSend(objj_msgSend(_37,"view"),"signInErrorStatus");
objj_msgSend(_3a,"bind:toObject:withKeyPath:options:","hidden",_37,"hasSignInError",objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",CPNegateBooleanTransformer,CPValueTransformerNameBindingOption));
objj_msgSend(_3a,"bind:toObject:withKeyPath:options:","stringValue",_37,"signInStatusMessage",nil);
var _3b=objj_msgSend(objj_msgSend(_37,"view"),"mappingStatus");
objj_msgSend(_3b,"bind:toObject:withKeyPath:options:","type",_37,"mappingStatusType",nil);
objj_msgSend(_3b,"bind:toObject:withKeyPath:options:","stringValue",_37,"mappingStatusMessage",nil);
var _3c=objj_msgSend(objj_msgSend(_37,"view"),"myPlexStatus");
objj_msgSend(_3c,"bind:toObject:withKeyPath:options:","type",_37,"myPlexStatusType",nil);
objj_msgSend(_3c,"bind:toObject:withKeyPath:options:","stringValue",_37,"myPlexStatusMessage",nil);
objj_msgSend(objj_msgSend(_37,"view"),"setSignedIn:",NO);
var _3d=objj_msgSend(objj_msgSend(_37,"view"),"signInButton");
objj_msgSend(_3d,"setTarget:",_37);
objj_msgSend(_3d,"setAction:",sel_getUid("signIn:"));
var _3e=objj_msgSend(objj_msgSend(_37,"view"),"signUpButton");
objj_msgSend(_3e,"setTarget:",_37);
objj_msgSend(_3e,"setAction:",sel_getUid("signUp:"));
var _3f=objj_msgSend(objj_msgSend(_37,"view"),"signOutButton");
objj_msgSend(_3f,"setTarget:",_37);
objj_msgSend(_3f,"setAction:",sel_getUid("signOut:"));
}
}),new objj_method(sel_getUid("signInStatusType"),function(_40,_41){
with(_40){
switch(objj_msgSend(objj_msgSend(MMMyPlexStatus,"sharedStatus"),"signInState")){
case MMMyPlexSignInStateAuthenticated:
return MMStatusIndicatorOK;
case MMMyPlexSignInStateNotSignedIn:
return MMStatusIndicatorDisabled;
case MMMyPlexSignInStateInvalid:
return MMStatusIndicatorError;
case MMMyPlexSignInStateUnknown:
default:
return MMStatusIndicatorWarning;
}
}
}),new objj_method(sel_getUid("signInStatusMessage"),function(_42,_43){
with(_42){
var _44=objj_msgSend(MMMyPlexStatus,"sharedStatus");
switch(objj_msgSend(_44,"signInState")){
case MMMyPlexSignInStateAuthenticated:
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Signed in as %@","myPlex preference pane successfully authenticated string"),objj_msgSend(_44,"username"));
case MMMyPlexSignInStateNotSignedIn:
return CPLocalizedString("Disabled","Disabled status message for the myPlex preference pane");
case MMMyPlexSignInStateInvalid:
return CPLocalizedString("Invalid email, username, or password","myPlex preference pane invalid credential message");
case MMMyPlexSignInStateUnknown:
default:
return CPLocalizedString("Unknown sign in state","myPlex preference pane unknown sign in state message");
}
}
}),new objj_method(sel_getUid("hasSignInError"),function(_45,_46){
with(_45){
return objj_msgSend(objj_msgSend(MMMyPlexStatus,"sharedStatus"),"signInState")==MMMyPlexSignInStateInvalid;
}
}),new objj_method(sel_getUid("mappingStatusType"),function(_47,_48){
with(_47){
switch(objj_msgSend(objj_msgSend(MMMyPlexStatus,"sharedStatus"),"mappingState")){
case MMMyPlexMappingStateMapped:
return MMStatusIndicatorOK;
case MMMyPlexMappingStateWaiting:
return MMStatusIndicatorWarning;
case MMMyPlexMappingStateFailed:
return MMStatusIndicatorError;
case MMMyPlexMappingStateUnknown:
default:
return MMStatusIndicatorWarning;
}
}
}),new objj_method(sel_getUid("mappingStatusMessage"),function(_49,_4a){
with(_49){
var _4b=objj_msgSend(MMMyPlexStatus,"sharedStatus");
switch(objj_msgSend(_4b,"mappingState")){
case MMMyPlexMappingStateMapped:
if(_4b.publicAddress){
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Server is mapped to port %i (%s)","myPlex prefpane mapping status message"),_4b.publicPort,_4b.publicAddress);
}else{
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Server is mapped to port %i","myPlex prefpane mapping status message"),_4b.publicPort);
}
case MMMyPlexMappingStateWaiting:
return CPLocalizedString("Waiting for a valid mapping...","myPlex prefpane mapping status message");
case MMMyPlexMappingStateFailed:
if(objj_msgSend(_4b,"mappingErrorMessage")){
return objj_msgSend(CPString,"stringWithFormat:",CPLocalizedString("Failed to map ports: %@","myPlex prefpane mapping status message"),objj_msgSend(_4b,"mappingErrorMessage"));
}else{
return CPLocalizedString("Failed to map ports","myPlex prefpane mapping status message");
}
case MMMyPlexMappingStateUnknown:
default:
return CPLocalizedString("Publishing state is unknown","myPlex prefpane mapping status message");
}
}
}),new objj_method(sel_getUid("myPlexStatusType"),function(_4c,_4d){
with(_4c){
switch(objj_msgSend(objj_msgSend(MMMyPlexStatus,"sharedStatus"),"mappingError")){
case MMMyPlexMappingErrorBadAuth:
case MMMyPlexMappingErrorUnreachable:
case MMMyPlexMappingErrorMyPlexGone:
case MMMyPlexMappingErrorNotPublished:
return MMStatusIndicatorError;
default:
return nil;
}
}
}),new objj_method(sel_getUid("myPlexStatusMessage"),function(_4e,_4f){
with(_4e){
switch(objj_msgSend(objj_msgSend(MMMyPlexStatus,"sharedStatus"),"mappingError")){
case MMMyPlexMappingErrorBadAuth:
return CPLocalizedString("Unable to authenticate","myPlex prefpane myPlex status message");
case MMMyPlexMappingErrorUnreachable:
return CPLocalizedString("myPlex was unable to connect to your Server","myPlex prefpane myPlex status message");
case MMMyPlexMappingErrorMyPlexGone:
return CPLocalizedString("myPlex appears to be offline","myPlex prefpane myPlex status message");
case MMMyPlexMappingErrorNotPublished:
return CPLocalizedString("There was an error publishing the connection","myPlex prefpane myPlex status message");
default:
return "";
}
}
}),new objj_method(sel_getUid("signIn:"),function(_50,_51,_52){
with(_50){
if(signInPrompt||signUpPrompt){
return;
}
signInPrompt=objj_msgSend(objj_msgSend(MMPrompt,"alloc"),"init");
objj_msgSend(signInPrompt,"setAlertStyle:",CPInformationalAlertStyle);
objj_msgSend(signInPrompt,"setMessageText:",CPLocalizedString("Sign in to myPlex","myPlex sign in sheet title"));
objj_msgSend(signInPrompt,"addFieldWithLabel:value:",CPLocalizedString("Email:","Email label"),"");
objj_msgSend(signInPrompt,"addFieldWithLabel:value:placeholder:secure:",CPLocalizedString("Password:","Password label"),"","",YES);
objj_msgSend(signInPrompt,"addButtonWithTitle:",CPLocalizedString("Sign In","Sign in button on myPlex preference panel"));
objj_msgSend(signInPrompt,"addButtonWithTitle:",CPLocalizedString("Cancel","Cancel"));
objj_msgSend(signInPrompt,"setDelegate:",_50);
objj_msgSend(signInPrompt,"beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:",objj_msgSend(objj_msgSend(_50,"view"),"window"),nil,nil,nil);
}
}),new objj_method(sel_getUid("signUp:"),function(_53,_54,_55){
with(_53){
if(signInPrompt||signUpPrompt){
return;
}
signUpPrompt=objj_msgSend(objj_msgSend(MMPrompt,"alloc"),"init");
objj_msgSend(signUpPrompt,"setAlertStyle:",CPInformationalAlertStyle);
objj_msgSend(signUpPrompt,"setMessageText:",CPLocalizedString("Sign up to myPlex","myPlex sign up sheet title"));
objj_msgSend(signUpPrompt,"addFieldWithLabel:value:",CPLocalizedString("Email:","Email label"),"");
objj_msgSend(signUpPrompt,"addFieldWithLabel:value:placeholder:secure:",CPLocalizedString("Password:","Password label"),"","",YES);
objj_msgSend(signUpPrompt,"addFieldWithLabel:value:placeholder:secure:",CPLocalizedString("Confirm password:","Confirm password label"),"","",YES);
objj_msgSend(signUpPrompt,"addButtonWithTitle:",CPLocalizedString("Sign Up","Sign up button on myPlex preference panel"));
objj_msgSend(signUpPrompt,"addButtonWithTitle:",CPLocalizedString("Cancel","Cancel"));
objj_msgSend(signUpPrompt,"setDelegate:",_53);
objj_msgSend(statusRefreshTimer,"invalidate"),statusRefreshTimer=nil;
objj_msgSend(signUpPrompt,"beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:",objj_msgSend(objj_msgSend(_53,"view"),"window"),nil,nil,nil);
}
}),new objj_method(sel_getUid("signOut:"),function(_56,_57,_58){
with(_56){
var _59=objj_msgSend(MMMyPlexStatus,"sharedStatus");
objj_msgSend(_56,"invalidateAllStatusFieldsWithCallback:",function(){
objj_msgSend(_59,"setSignInState:",MMMyPlexSignInStateNotSignedIn);
objj_msgSend(_59,"setAuthToken:",nil);
objj_msgSend(_59,"setPassword:",nil);
});
objj_msgSend(objj_msgSend(_56,"view"),"setSignedIn:",NO);
objj_msgSend(myPlexDataSource,"deleteRecord:",_59);
}
}),new objj_method(sel_getUid("prompt:userDidActivateButtonWithReturnCode:"),function(_5a,_5b,_5c,_5d){
with(_5a){
switch(_5d){
case 0:
objj_msgSend(_5a,"promptWasSubmitted:",_5c);
break;
case 1:
objj_msgSend(_5a,"promptWasCancelled:",_5c);
break;
}
}
}),new objj_method(sel_getUid("promptWasCancelled:"),function(_5e,_5f,_60){
with(_5e){
if(signInPrompt===_60||signUpPrompt===_60){
objj_msgSend(_60,"dismissPrompt"),signInPrompt=nil,signUpPrompt=nil;
}
}
}),new objj_method(sel_getUid("promptWasSubmitted:"),function(_61,_62,_63){
with(_61){
if(_63===signInPrompt){
var _64=objj_msgSend(signInPrompt,"stringValueAtIndex:",0),_65=objj_msgSend(signInPrompt,"stringValueAtIndex:",1),_66=objj_msgSend(MMMyPlexStatus,"sharedStatus");
if(!_64||!_65){
objj_msgSend(signInPrompt,"shake");
return;
}
objj_msgSend(_66,"setUsername:",_64);
objj_msgSend(_66,"setPassword:",_65);
objj_msgSend(myPlexDataSource,"updateRecord:",_66);
}else{
if(_63===signUpPrompt){
var _64=objj_msgSend(signUpPrompt,"stringValueAtIndex:",0),_65=objj_msgSend(signUpPrompt,"stringValueAtIndex:",1),_67=objj_msgSend(signUpPrompt,"stringValueAtIndex:",2),_66=objj_msgSend(MMMyPlexStatus,"sharedStatus");
if(!_64||!_65||!objj_msgSend(_65,"isEqualToString:",_67)){
objj_msgSend(signUpPrompt,"shake");
return;
}
objj_msgSend(_66,"setUsername:",_64);
objj_msgSend(_66,"setPassword:",_65);
objj_msgSend(myPlexDataSource,"createRecord:",_66);
}
}
}
})]);
p;32;DataSources/MMMyPlexDataSource.jt;4518;@STATIC;1.0;i;14;MMDataSource.ji;26;../Models/MMMyPlexStatus.jt;4449;
objj_executeFile("MMDataSource.j",YES);
objj_executeFile("../Models/MMMyPlexStatus.j",YES);
var _1=objj_allocateClassPair(MMDataSource,"MMMyPlexDataSource"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("URLForRecord:contextInfo:"),function(_3,_4,_5,_6){
with(_3){
return objj_msgSend(PMSURL,"URLWithPath:","/myplex/account");
}
}),new objj_method(sel_getUid("URLForUpdatedRecord:contextInfo:"),function(_7,_8,_9,_a){
with(_7){
return objj_msgSend(PMSURL,"URLWithPath:params:","/myplex/account",objj_msgSend(CPDictionary,"dictionaryWithObjectsAndKeys:",objj_msgSend(_9,"username"),"username",objj_msgSend(_9,"password"),"password"));
}
}),new objj_method(sel_getUid("URLForNewRecord:contextInfo:"),function(_b,_c,_d,_e){
with(_b){
return objj_msgSend(_b,"URLForUpdatedRecord:contextInfo:",_d,_e);
}
}),new objj_method(sel_getUid("HTTPBodyForUpdatedRecord:contextInfo:"),function(_f,_10,_11,_12){
with(_f){
return "";
}
}),new objj_method(sel_getUid("HTTPBodyForNewRecord:contextInfo:"),function(_13,_14,_15,_16){
with(_13){
return "";
}
}),new objj_method(sel_getUid("shouldProcessRootElement:contextInfo:"),function(_17,_18,_19,_1a){
with(_17){
return YES;
}
}),new objj_method(sel_getUid("shouldProcessNode:contextInfo:"),function(_1b,_1c,_1d,_1e){
with(_1b){
return _1d&&objj_msgSend(String(_1d.nodeName),"isEqualToString:","MyPlex");
}
}),new objj_method(sel_getUid("recordFromElement:contextInfo:"),function(_1f,_20,_21,_22){
with(_1f){
return objj_msgSend(MMMyPlexStatus,"sharedStatus");
}
}),new objj_method(sel_getUid("updateRecord:fromElement:contextInfo:"),function(_23,_24,_25,_26,_27){
with(_23){
objj_msgSend(_25,"setMappingState:",_26.getAttribute("mappingState"));
objj_msgSend(_25,"setMappingError:",_26.getAttribute("mappingError"));
objj_msgSend(_25,"setMappingErrorMessage:",_26.getAttribute("mappingErrorMessage"));
objj_msgSend(_25,"setUsername:",_26.getAttribute("username"));
objj_msgSend(_25,"setSignInState:",_26.getAttribute("signInState"));
objj_msgSend(_25,"setAuthToken:",_26.getAttribute("authToken"));
objj_msgSend(_25,"setPublicAddress:",_26.getAttribute("publicAddress"));
objj_msgSend(_25,"setPublicPort:",_26.getAttribute("publicPort"));
objj_msgSend(_25,"setPrivateAddress:",_26.getAttribute("privateAddress"));
objj_msgSend(_25,"setPrivatePort:",_26.getAttribute("privatePort"));
}
}),new objj_method(sel_getUid("connectionDidReceiveAuthenticationChallenge:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_28,"connection:didFailWithError:",_2a,"invalid credentials");
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_2b,_2c,_2d,_2e){
with(_2b){
CPLog.trace("[%@ -%@] START (data=%@)",objj_msgSend(_2b,"class"),_2c,_2e);
var _2f=objj_msgSend(statusCodeByConnection,"objectForKey:",_2d),_30=objj_msgSend(contextInfoByConnection,"objectForKey:",_2d);
if(!_2f||_2f>=400){
objj_msgSend(_2b,"connection:didFailWithError:",_2d,_2e);
}else{
if(objj_msgSend(recordsByRefreshConnection,"containsKey:",_2d)){
objj_msgSend(_2b,"didReceiveRecordsAsData:connection:contextInfo:",_2e,_2d,_30);
}else{
if(objj_msgSend(recordsByDeleteConnection,"containsKey:",_2d)){
var _31=objj_msgSend(recordsByDeleteConnection,"objectForKey:",_2d);
objj_msgSend(_2b,"didDeleteRecord:contextInfo:",_31,_30);
}else{
if(objj_msgSend(recordsByCreateConnection,"containsKey:",_2d)){
objj_msgSend(_2b,"didReceiveRecordsAsData:connection:contextInfo:",_2e,_2d,_30);
var _31=objj_msgSend(recordsByCreateConnection,"objectForKey:",_2d);
objj_msgSend(_2b,"didCreateRecord:contextInfo:",_31,_30);
}else{
if(objj_msgSend(recordsByUpdateConnection,"containsKey:",_2d)){
objj_msgSend(_2b,"didReceiveRecordsAsData:connection:contextInfo:",_2e,_2d,_30);
var _31=objj_msgSend(recordsByUpdateConnection,"objectForKey:",_2d);
objj_msgSend(_2b,"didUpdateRecord:contextInfo:",_31,_30);
}else{
CPLog.warn("[%@ -] got message for unknown connection: %@ data: %@",objj_msgSend(_2b,"class"),_2c,_2d,_2e);
}
}
}
}
}
objj_msgSend(recordsByRefreshConnection,"removeObjectForKey:",_2d);
objj_msgSend(recordsByDeleteConnection,"removeObjectForKey:",_2d);
objj_msgSend(recordsByCreateConnection,"removeObjectForKey:",_2d);
objj_msgSend(recordsByUpdateConnection,"removeObjectForKey:",_2d);
objj_msgSend(contextInfoByConnection,"removeObjectForKey:",_2d);
objj_msgSend(statusCodeByConnection,"removeObjectForKey:",_2d);
CPLog.trace("[%@ -connection:didReceiveData:] END",objj_msgSend(_2b,"class"));
}
})]);
p;23;Models/MMMyPlexStatus.jt;4147;@STATIC;1.0;I;21;Foundation/CPObject.jt;4102;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=nil;
MMMyPlexSignInStateAuthenticated="ok";
MMMyPlexSignInStateNotSignedIn="none";
MMMyPlexSignInStateInvalid="invalid";
MMMyPlexSignInStateUnknown="unknown";
MMMyPlexMappingStateMapped="mapped";
MMMyPlexMappingStateWaiting="waiting";
MMMyPlexMappingStateFailed="failed";
MMMyPlexMappingStateUnknown="unknown";
MMMyPlexMappingErrorBadAuth="badauth";
MMMyPlexMappingErrorUnreachable="unreachable";
MMMyPlexMappingErrorMyPlexGone="myplexgone";
MMMyPlexMappingErrorNotPublished="publisherror";
var _2=objj_allocateClassPair(MMRecord,"MMMyPlexStatus"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("mappingState"),new objj_ivar("mappingError"),new objj_ivar("mappingErrorMessage"),new objj_ivar("signInState"),new objj_ivar("username"),new objj_ivar("password"),new objj_ivar("authToken"),new objj_ivar("publicAddress"),new objj_ivar("publicPort"),new objj_ivar("privateAddress"),new objj_ivar("privatePort")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("mappingState"),function(_4,_5){
with(_4){
return mappingState;
}
}),new objj_method(sel_getUid("setMappingState:"),function(_6,_7,_8){
with(_6){
mappingState=_8;
}
}),new objj_method(sel_getUid("mappingError"),function(_9,_a){
with(_9){
return mappingError;
}
}),new objj_method(sel_getUid("setMappingError:"),function(_b,_c,_d){
with(_b){
mappingError=_d;
}
}),new objj_method(sel_getUid("mappingErrorMessage"),function(_e,_f){
with(_e){
return mappingErrorMessage;
}
}),new objj_method(sel_getUid("setMappingErrorMessage:"),function(_10,_11,_12){
with(_10){
mappingErrorMessage=_12;
}
}),new objj_method(sel_getUid("signInState"),function(_13,_14){
with(_13){
return signInState;
}
}),new objj_method(sel_getUid("setSignInState:"),function(_15,_16,_17){
with(_15){
signInState=_17;
}
}),new objj_method(sel_getUid("username"),function(_18,_19){
with(_18){
return username;
}
}),new objj_method(sel_getUid("setUsername:"),function(_1a,_1b,_1c){
with(_1a){
username=_1c;
}
}),new objj_method(sel_getUid("password"),function(_1d,_1e){
with(_1d){
return password;
}
}),new objj_method(sel_getUid("setPassword:"),function(_1f,_20,_21){
with(_1f){
password=_21;
}
}),new objj_method(sel_getUid("authToken"),function(_22,_23){
with(_22){
return authToken;
}
}),new objj_method(sel_getUid("setAuthToken:"),function(_24,_25,_26){
with(_24){
authToken=_26;
}
}),new objj_method(sel_getUid("publicAddress"),function(_27,_28){
with(_27){
return publicAddress;
}
}),new objj_method(sel_getUid("setPublicAddress:"),function(_29,_2a,_2b){
with(_29){
publicAddress=_2b;
}
}),new objj_method(sel_getUid("publicPort"),function(_2c,_2d){
with(_2c){
return publicPort;
}
}),new objj_method(sel_getUid("setPublicPort:"),function(_2e,_2f,_30){
with(_2e){
publicPort=_30;
}
}),new objj_method(sel_getUid("privateAddress"),function(_31,_32){
with(_31){
return privateAddress;
}
}),new objj_method(sel_getUid("setPrivateAddress:"),function(_33,_34,_35){
with(_33){
privateAddress=_35;
}
}),new objj_method(sel_getUid("privatePort"),function(_36,_37){
with(_36){
return privatePort;
}
}),new objj_method(sel_getUid("setPrivatePort:"),function(_38,_39,_3a){
with(_38){
privatePort=_3a;
}
}),new objj_method(sel_getUid("isMapped"),function(_3b,_3c){
with(_3b){
return mappingState===MMMyPlexMappingStateMapped;
}
}),new objj_method(sel_getUid("signedIn"),function(_3d,_3e){
with(_3d){
return signInState===MMMyPlexSignInStateAuthenticated;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedStatus"),function(_3f,_40){
with(_3f){
return _1||(_1=objj_msgSend(objj_msgSend(_3f,"alloc"),"init"));
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingMapped"),function(_41,_42){
with(_41){
return objj_msgSend(CPSet,"setWithObjects:","mappingState");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingPublished"),function(_43,_44){
with(_43){
return objj_msgSend(CPSet,"setWithObjects:","signedIn");
}
}),new objj_method(sel_getUid("keyPathsForValuesAffectingSignedIn"),function(_45,_46){
with(_45){
return objj_msgSend(CPSet,"setWithObjects:","signInState");
}
})]);
p;32;Views/MMPreferencesMyPlexPanel.jt;13529;@STATIC;1.0;I;15;AppKit/CPView.ji;19;MMStatusIndicator.jt;13465;
objj_executeFile("AppKit/CPView.j",NO);
objj_executeFile("MMStatusIndicator.j",YES);
var _1=objj_allocateClassPair(CPView,"MMPreferencesMyPlexPanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("initialFirstResponder"),new objj_ivar("descriptionLabel"),new objj_ivar("signInStatus"),new objj_ivar("signedIn"),new objj_ivar("signedInContainer"),new objj_ivar("signedOutContainer"),new objj_ivar("signOutButton"),new objj_ivar("signInButton"),new objj_ivar("signInButtonLabel"),new objj_ivar("signUpButton"),new objj_ivar("signUpButtonLabel"),new objj_ivar("signInErrorStatus"),new objj_ivar("separator"),new objj_ivar("publishCheckbox"),new objj_ivar("mappingStatus"),new objj_ivar("myPlexStatus"),new objj_ivar("manualMappingCheckbox"),new objj_ivar("manualMappingPortField")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initialFirstResponder"),function(_3,_4){
with(_3){
return initialFirstResponder;
}
}),new objj_method(sel_getUid("setInitialFirstResponder:"),function(_5,_6,_7){
with(_5){
initialFirstResponder=_7;
}
}),new objj_method(sel_getUid("signInStatus"),function(_8,_9){
with(_8){
return signInStatus;
}
}),new objj_method(sel_getUid("setSignInStatus:"),function(_a,_b,_c){
with(_a){
signInStatus=_c;
}
}),new objj_method(sel_getUid("signOutButton"),function(_d,_e){
with(_d){
return signOutButton;
}
}),new objj_method(sel_getUid("setSignOutButton:"),function(_f,_10,_11){
with(_f){
signOutButton=_11;
}
}),new objj_method(sel_getUid("signInButton"),function(_12,_13){
with(_12){
return signInButton;
}
}),new objj_method(sel_getUid("setSignInButton:"),function(_14,_15,_16){
with(_14){
signInButton=_16;
}
}),new objj_method(sel_getUid("signUpButton"),function(_17,_18){
with(_17){
return signUpButton;
}
}),new objj_method(sel_getUid("setSignUpButton:"),function(_19,_1a,_1b){
with(_19){
signUpButton=_1b;
}
}),new objj_method(sel_getUid("signInErrorStatus"),function(_1c,_1d){
with(_1c){
return signInErrorStatus;
}
}),new objj_method(sel_getUid("setSignInErrorStatus:"),function(_1e,_1f,_20){
with(_1e){
signInErrorStatus=_20;
}
}),new objj_method(sel_getUid("publishCheckbox"),function(_21,_22){
with(_21){
return publishCheckbox;
}
}),new objj_method(sel_getUid("setPublishCheckbox:"),function(_23,_24,_25){
with(_23){
publishCheckbox=_25;
}
}),new objj_method(sel_getUid("mappingStatus"),function(_26,_27){
with(_26){
return mappingStatus;
}
}),new objj_method(sel_getUid("setMappingStatus:"),function(_28,_29,_2a){
with(_28){
mappingStatus=_2a;
}
}),new objj_method(sel_getUid("myPlexStatus"),function(_2b,_2c){
with(_2b){
return myPlexStatus;
}
}),new objj_method(sel_getUid("setMyPlexStatus:"),function(_2d,_2e,_2f){
with(_2d){
myPlexStatus=_2f;
}
}),new objj_method(sel_getUid("manualMappingCheckbox"),function(_30,_31){
with(_30){
return manualMappingCheckbox;
}
}),new objj_method(sel_getUid("setManualMappingCheckbox:"),function(_32,_33,_34){
with(_32){
manualMappingCheckbox=_34;
}
}),new objj_method(sel_getUid("manualMappingPortField"),function(_35,_36){
with(_35){
return manualMappingPortField;
}
}),new objj_method(sel_getUid("setManualMappingPortField:"),function(_37,_38,_39){
with(_37){
manualMappingPortField=_39;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_3a,_3b,_3c){
with(_3a){
if(_3a=objj_msgSendSuper({receiver:_3a,super_class:objj_getClass("MMPreferencesMyPlexPanel").super_class},"initWithFrame:",_3c)){
signedInContainer=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(20,0,CGRectGetWidth(objj_msgSend(_3a,"frame"))-40,0));
objj_msgSend(signedInContainer,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3a,"addSubview:",signedInContainer);
signedOutContainer=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(signedInContainer,"frame"));
objj_msgSend(signedOutContainer,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3a,"addSubview:",signedOutContainer);
descriptionLabel=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("myPlex ties all your Plex clients and servers together, making it easy for your devices to communicate with each other and share settings and media.","myPlex preference panel description"));
objj_msgSend(descriptionLabel,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_3a,"addSubview:",descriptionLabel);
signInStatus=objj_msgSend(objj_msgSend(MMStatusIndicator,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(signInStatus,"sizeToFit");
objj_msgSend(signedInContainer,"addSubview:",signInStatus);
signInButtonLabel=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Have a myPlex or forums account?","Sign in button help label"));
objj_msgSend(signInButtonLabel,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(signInButtonLabel,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",10));
objj_msgSend(signedOutContainer,"addSubview:",signInButtonLabel);
signInButton=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Sign In","Sign in button on myPlex preference panel"));
objj_msgSend(signedOutContainer,"addSubview:",signInButton);
signUpButtonLabel=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Don't have an account? It's easy to sign up!","Sign up button help label"));
objj_msgSend(signUpButtonLabel,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(signUpButtonLabel,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",10));
objj_msgSend(signedOutContainer,"addSubview:",signUpButtonLabel);
signUpButton=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Sign Up","Sign up button on myPlex preference panel"));
objj_msgSend(signedOutContainer,"addSubview:",signUpButton);
signOutButton=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Sign Out","Sign out button on myPlex preference panel"));
objj_msgSend(signedInContainer,"addSubview:",signOutButton);
signInErrorStatus=objj_msgSend(objj_msgSend(MMStatusIndicator,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(signInErrorStatus,"sizeToFit");
objj_msgSend(signInErrorStatus,"setType:",MMStatusIndicatorError);
objj_msgSend(signedOutContainer,"addSubview:",signInErrorStatus);
separator=objj_msgSend(objj_msgSend(CPBox,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(separator,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(signedInContainer,"addSubview:",separator);
publishCheckbox=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("Publish server to myPlex","Check box option on the myPlex prefpane"));
objj_msgSend(signedInContainer,"addSubview:",publishCheckbox);
mappingStatus=objj_msgSend(objj_msgSend(MMStatusIndicator,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(mappingStatus,"sizeToFit");
objj_msgSend(signedInContainer,"addSubview:",mappingStatus);
myPlexStatus=objj_msgSend(objj_msgSend(MMStatusIndicator,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(myPlexStatus,"sizeToFit");
objj_msgSend(signedInContainer,"addSubview:",myPlexStatus);
manualMappingContainer=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",objj_msgSend(signedInContainer,"frame"));
objj_msgSend(manualMappingContainer,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_3a,"addSubview:",manualMappingContainer);
manualMappingCheckbox=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("Manually specify port","Check box option to allow choosing a port manually"));
objj_msgSend(manualMappingCheckbox,"setFrameOrigin:",CGPointMakeZero());
objj_msgSend(manualMappingContainer,"addSubview:",manualMappingCheckbox);
manualMappingPortField=objj_msgSend(CPTextField,"textFieldWithStringValue:placeholder:width:","","",70);
objj_msgSend(manualMappingPortField,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(manualMappingCheckbox,"frame"))+10,CGRectGetMidY(objj_msgSend(manualMappingCheckbox,"frame"))-CGRectGetHeight(objj_msgSend(manualMappingPortField,"frame"))/2));
objj_msgSend(manualMappingContainer,"addSubview:",manualMappingPortField);
var _3d=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Enable this if your router doesn't support automatic configuration.","Description of manual mapping in the myPlex prefpane"));
objj_msgSend(_3d,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",10));
var _3e=CGRectGetWidth(objj_msgSend(manualMappingContainer,"frame")),_3f=objj_msgSend(objj_msgSend(_3d,"stringValue"),"sizeWithFont:inWidth:",objj_msgSend(_3d,"font"),_3e);
_3f.height+=5;
objj_msgSend(_3d,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_3d,"setFrameSize:",_3f);
objj_msgSend(_3d,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(manualMappingCheckbox,"frame"))+17,CGRectGetMaxY(objj_msgSend(manualMappingPortField,"frame"))));
objj_msgSend(manualMappingContainer,"addSubview:",_3d);
if(CGRectGetMinY(objj_msgSend(manualMappingPortField,"frame"))<0){
var _40=CGRectGetMinY(objj_msgSend(manualMappingPortField,"frame"));
objj_msgSend(objj_msgSend(CPArray,"arrayWithObjects:",manualMappingCheckbox,manualMappingPortField,_3d),"enumerateObjectsUsingBlock:",function(_41){
objj_msgSend(_41,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(_41,"frame")),CGRectGetMinY(objj_msgSend(_41,"frame"))-_40));
});
}
objj_msgSend(manualMappingContainer,"sizeToFit");
objj_msgSend(_3a,"layoutSubviews");
objj_msgSend(_3a,"setSignedIn:",NO);
}
return _3a;
}
}),new objj_method(sel_getUid("setSignedIn:"),function(_42,_43,_44){
with(_42){
_44=!!_44;
if(signedIn===_44){
return;
}
signedIn=_44;
objj_msgSend(signedOutContainer,"setHidden:",_44);
objj_msgSend(signedInContainer,"setHidden:",!_44);
}
}),new objj_method(sel_getUid("manualPortControlsHidden"),function(_45,_46){
with(_45){
return objj_msgSend(manualMappingContainer,"isHidden");
}
}),new objj_method(sel_getUid("setManualPortControlsHidden:"),function(_47,_48,_49){
with(_47){
objj_msgSend(manualMappingContainer,"setHidden:",_49);
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_4a,_4b){
with(_4a){
var _4c=objj_msgSend(objj_msgSend(descriptionLabel,"stringValue"),"sizeWithFont:inWidth:",objj_msgSend(descriptionLabel,"font"),CGRectGetWidth(objj_msgSend(_4a,"frame")));
_4c.height+=5;
objj_msgSend(descriptionLabel,"setFrameSize:",_4c);
objj_msgSend(descriptionLabel,"setFrameOrigin:",CGPointMakeZero());
objj_msgSend(signedInContainer,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(signedInContainer,"frame")),CGRectGetMaxY(objj_msgSend(descriptionLabel,"frame"))+5));
objj_msgSend(signedOutContainer,"setFrameOrigin:",objj_msgSend(signedInContainer,"frame").origin);
objj_msgSend(signInStatus,"sizeToFit");
objj_msgSend(signInStatus,"setFrameOrigin:",CGPointMake(0,10));
objj_msgSend(signOutButton,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(signInStatus,"frame"))+5,CGRectGetMidY(objj_msgSend(signInStatus,"frame"))-CGRectGetHeight(objj_msgSend(signOutButton,"frame"))/2));
objj_msgSend(separator,"setFrame:",CGRectMake(0,CGRectGetMaxY(objj_msgSend(signOutButton,"frame"))+10,CGRectGetWidth(objj_msgSend(signedInContainer,"frame")),1));
objj_msgSend(publishCheckbox,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(signInStatus,"frame")),CGRectGetMaxY(objj_msgSend(separator,"frame"))+10));
objj_msgSend(mappingStatus,"sizeToFit");
objj_msgSend(mappingStatus,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(signInStatus,"frame")),CGRectGetMaxY(objj_msgSend(publishCheckbox,"frame"))+10));
objj_msgSend(myPlexStatus,"sizeToFit");
objj_msgSend(myPlexStatus,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(mappingStatus,"frame")),CGRectGetMaxY(objj_msgSend(mappingStatus,"frame"))+5));
objj_msgSend(signInButton,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(signInStatus,"frame")),CGRectGetMinY(objj_msgSend(signInStatus,"frame"))+50));
var _4d=objj_msgSend(objj_msgSend(signInButtonLabel,"stringValue"),"sizeWithFont:inWidth:",objj_msgSend(signInButtonLabel,"font"),140);
_4d.height+=5;
objj_msgSend(signInButtonLabel,"setFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(signInButton,"frame"))+10,CGRectGetMidY(objj_msgSend(signInButton,"frame"))-_4d.height/2,_4d.width,_4d.height));
objj_msgSend(signUpButton,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(signInButtonLabel,"frame"))+10,CGRectGetMinY(objj_msgSend(signInButtonLabel,"frame"))));
var _4e=objj_msgSend(objj_msgSend(signUpButtonLabel,"stringValue"),"sizeWithFont:inWidth:",objj_msgSend(signUpButtonLabel,"font"),140);
_4e.height+=5;
objj_msgSend(signUpButtonLabel,"setFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(signUpButton,"frame"))+10,CGRectGetMidY(objj_msgSend(signUpButton,"frame"))-_4e.height/2,_4e.width,_4e.height));
objj_msgSend(signInErrorStatus,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(signInButton,"frame")),CGRectGetMaxY(objj_msgSend(signInButton,"frame"))+10,CGRectGetMaxX(objj_msgSend(signUpButtonLabel,"frame"))-CGRectGetMinX(objj_msgSend(signInErrorStatus,"frame")),CGRectGetHeight(objj_msgSend(signInErrorStatus,"frame"))));
objj_msgSend(signedInContainer,"sizeToFitWithInset:adjustWidth:adjustHeight:",CPViewInsetDefault,NO,YES);
objj_msgSend(signedOutContainer,"sizeToFitWithInset:adjustWidth:adjustHeight:",CPViewInsetDefault,NO,YES);
objj_msgSend(manualMappingContainer,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(signedInContainer,"frame")),CGRectGetMaxY(objj_msgSend(signedInContainer,"frame"))+10));
objj_msgSendSuper({receiver:_4a,super_class:objj_getClass("MMPreferencesMyPlexPanel").super_class},"layoutSubviews");
}
})]);
p;25;Views/MMStatusIndicator.jt;4066;@STATIC;1.0;I;15;AppKit/CPView.jt;4027;
objj_executeFile("AppKit/CPView.j",NO);
MMStatusIndicatorDisabled="MMStatusIndicatorDisabled";
MMStatusIndicatorWarning="MMStatusIndicatorWarning";
MMStatusIndicatorError="MMStatusIndicatorError";
MMStatusIndicatorOK="MMStatusIndicatorOK";
var _1=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","dot-gray.png"),CGSizeMake(16,16));
var _2=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","dot-yellow.png"),CGSizeMake(16,16));
var _3=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","dot-red.png"),CGSizeMake(16,16));
var _4=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","dot-green.png"),CGSizeMake(16,16));
var _5=objj_allocateClassPair(CPView,"MMStatusIndicator"),_6=_5.isa;
class_addIvars(_5,[new objj_ivar("type"),new objj_ivar("stringValue"),new objj_ivar("statusLight"),new objj_ivar("statusMessage")]);
objj_registerClassPair(_5);
class_addMethods(_5,[new objj_method(sel_getUid("type"),function(_7,_8){
with(_7){
return type;
}
}),new objj_method(sel_getUid("setType:"),function(_9,_a,_b){
with(_9){
type=_b;
}
}),new objj_method(sel_getUid("stringValue"),function(_c,_d){
with(_c){
return stringValue;
}
}),new objj_method(sel_getUid("setStringValue:"),function(_e,_f,_10){
with(_e){
stringValue=_10;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_11,_12,_13){
with(_11){
if(_11=objj_msgSendSuper({receiver:_11,super_class:objj_getClass("MMStatusIndicator").super_class},"initWithFrame:",_13)){
var _14=objj_msgSend(_1,"size");
statusLight=objj_msgSend(objj_msgSend(CPImageView,"alloc"),"initWithFrame:",CGRectMake(0,0,_14.width,_14.height));
objj_msgSend(_11,"addSubview:",statusLight);
statusMessage=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(_11,"addSubview:",statusMessage);
}
return _11;
}
}),new objj_method(sel_getUid("setStringValue:"),function(_15,_16,_17){
with(_15){
stringValue=_17;
objj_msgSend(statusMessage,"setStringValue:",stringValue);
}
}),new objj_method(sel_getUid("setType:"),function(_18,_19,_1a){
with(_18){
switch(_1a){
case MMStatusIndicatorDisabled:
objj_msgSend(statusLight,"setImage:",_1);
break;
case MMStatusIndicatorWarning:
objj_msgSend(statusLight,"setImage:",_2);
break;
case MMStatusIndicatorError:
objj_msgSend(statusLight,"setImage:",_3);
break;
case MMStatusIndicatorOK:
objj_msgSend(statusLight,"setImage:",_4);
break;
default:
if(_1a===nil){
objj_msgSend(statusLight,"setImage:",nil);
}else{
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,objj_msgSend(CPString,"stringWithFormat:","type must be one of MMStatusIndicatorType, got %@",_1a));
}
}
type=_1a;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_1b,_1c){
with(_1b){
objj_msgSend(statusMessage,"sizeToFit");
objj_msgSend(_1b,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(statusLight,"frame"))+CGRectGetWidth(objj_msgSend(statusMessage,"frame")),MAX(CGRectGetHeight(objj_msgSend(statusLight,"frame")),CGRectGetHeight(objj_msgSend(statusLight,"frame")))));
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_1d,_1e){
with(_1d){
objj_msgSend(statusMessage,"setFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(statusLight,"frame")),MAX(0,(CGRectGetHeight(objj_msgSend(statusLight,"frame"))-CGRectGetHeight(objj_msgSend(statusMessage,"frame")))/2),CGRectGetWidth(objj_msgSend(_1d,"frame"))-CGRectGetMaxX(objj_msgSend(statusLight,"frame")),CGRectGetHeight(objj_msgSend(statusMessage,"frame"))));
objj_msgSend(statusLight,"setFrameOrigin:",CGPointMake(0,CGRectGetMidY(objj_msgSend(statusMessage,"frame"))-CGRectGetHeight(objj_msgSend(statusLight,"frame"))/2));
objj_msgSendSuper({receiver:_1d,super_class:objj_getClass("MMStatusIndicator").super_class},"layoutSubviews");
}
})]);
p;50;Controllers/MMPreferencesSecurityPanelController.jt;11203;@STATIC;1.0;i;34;MMPreferencesBasePanelController.ji;36;../DataSources/MMAccountDataSource.ji;21;../Models/MMAccount.ji;37;../Views/MMPreferencesSecurityPanel.ji;19;../Views/MMPrompt.jt;11011;
objj_executeFile("MMPreferencesBasePanelController.j",YES);
objj_executeFile("../DataSources/MMAccountDataSource.j",YES);
objj_executeFile("../Models/MMAccount.j",YES);
objj_executeFile("../Views/MMPreferencesSecurityPanel.j",YES);
objj_executeFile("../Views/MMPrompt.j",YES);
var _1=objj_allocateClassPair(MMPreferencesBasePanelController,"MMPreferencesSecurityPanelController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("accountDataSource"),new objj_ivar("adminAccount"),new objj_ivar("enableSecurityPrompt"),new objj_ivar("disableSecurityPrompt"),new objj_ivar("changeUsernamePrompt"),new objj_ivar("changePasswordPrompt")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("init"),function(_3,_4){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMPreferencesSecurityPanelController").super_class},"init")){
accountDataSource=objj_msgSend(objj_msgSend(MMAccountDataSource,"alloc"),"initWithDelegate:",_3);
adminAccount=objj_msgSend(accountDataSource,"adminAccount");
objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"addObserver:forKeyPath:options:context:",_3,"securityEnabled",CPKeyValueObservingOptionNew|CPKeyValueObservingOptionInitial,nil);
}
return _3;
}
}),new objj_method(sel_getUid("identifier"),function(_5,_6){
with(_5){
return "Security";
}
}),new objj_method(sel_getUid("title"),function(_7,_8){
with(_7){
return CPLocalizedString("Security","Security");
}
}),new objj_method(sel_getUid("loadView"),function(_9,_a){
with(_9){
var _b=objj_msgSend(objj_msgSend(MMPreferencesSecurityPanel,"alloc"),"initWithFrame:",CGRectMake(0,0,455,195));
objj_msgSend(objj_msgSend(_b,"usernameValueLabel"),"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(accountDataSource,"adminAccount"),"name",nil);
objj_msgSend(objj_msgSend(_b,"changeUsernameButton"),"setTarget:",_9);
objj_msgSend(objj_msgSend(_b,"changeUsernameButton"),"setAction:",sel_getUid("changeUsername:"));
objj_msgSend(objj_msgSend(_b,"changePasswordButton"),"setTarget:",_9);
objj_msgSend(objj_msgSend(_b,"changePasswordButton"),"setAction:",sel_getUid("changePassword:"));
objj_msgSend(objj_msgSend(_b,"enableSecurityCheckbox"),"setTarget:",_9);
objj_msgSend(objj_msgSend(_b,"enableSecurityCheckbox"),"setAction:",sel_getUid("toggleSecurityEnabled:"));
objj_msgSend(_9,"setView:",_b);
}
}),new objj_method(sel_getUid("prompt:userDidActivateButtonWithReturnCode:"),function(_c,_d,_e,_f){
with(_c){
switch(_f){
case 0:
objj_msgSend(_c,"promptWasSubmitted:",_e);
break;
case 1:
objj_msgSend(_c,"promptWasCancelled:",_e);
break;
}
}
}),new objj_method(sel_getUid("promptWasCancelled:"),function(_10,_11,_12){
with(_10){
if(_12==enableSecurityPrompt){
objj_msgSend(objj_msgSend(objj_msgSend(_10,"view"),"enableSecurityCheckbox"),"setState:",CPOffState);
objj_msgSend(enableSecurityPrompt,"dismissPrompt"),enableSecurityPrompt=nil;
}else{
if(_12==disableSecurityPrompt){
objj_msgSend(objj_msgSend(objj_msgSend(_10,"view"),"enableSecurityCheckbox"),"setState:",CPOnState);
objj_msgSend(disableSecurityPrompt,"dismissPrompt"),disableSecurityPrompt=nil;
}else{
if(_12==changeUsernamePrompt){
objj_msgSend(changeUsernamePrompt,"dismissPrompt"),changeUsernamePrompt=nil;
}else{
if(_12==changePasswordPrompt){
objj_msgSend(changePasswordPrompt,"dismissPrompt"),changePasswordPrompt=nil;
}
}
}
}
}
}),new objj_method(sel_getUid("promptWasSubmitted:"),function(_13,_14,_15){
with(_13){
if(_15==enableSecurityPrompt){
var _16=objj_msgSend(enableSecurityPrompt,"stringValueAtIndex:",0),_17=objj_msgSend(enableSecurityPrompt,"stringValueAtIndex:",1);
if(_16!=_17){
objj_msgSend(enableSecurityPrompt,"shake");
return;
}
if(!objj_msgSend(adminAccount,"name")){
objj_msgSend(adminAccount,"setName:","Administrator");
}
objj_msgSend(adminAccount,"setPassword:",_16);
objj_msgSend(accountDataSource,"updateRecord:withPassword:",adminAccount,"");
}else{
if(_15==disableSecurityPrompt){
var _18=objj_msgSend(disableSecurityPrompt,"stringValueAtIndex:",0),_16="";
objj_msgSend(adminAccount,"setPassword:",_16);
objj_msgSend(accountDataSource,"updateRecord:withPassword:",adminAccount,_18);
}else{
if(_15==changeUsernamePrompt){
var _19=objj_msgSend(changeUsernamePrompt,"stringValueAtIndex:",0),_18=objj_msgSend(changeUsernamePrompt,"stringValueAtIndex:",1);
objj_msgSend(adminAccount,"setName:",_19);
objj_msgSend(accountDataSource,"updateRecord:withPassword:",adminAccount,_18);
}else{
if(_15==changePasswordPrompt){
var _1a=objj_msgSend(changePasswordPrompt,"stringValueAtIndex:",0),_16=objj_msgSend(changePasswordPrompt,"stringValueAtIndex:",1),_17=objj_msgSend(changePasswordPrompt,"stringValueAtIndex:",2);
if(_16!=_17){
objj_msgSend(changePasswordPrompt,"shake");
return;
}
objj_msgSend(adminAccount,"setPassword:",_16);
objj_msgSend(accountDataSource,"updateRecord:withPassword:",adminAccount,_1a);
}
}
}
}
}
}),new objj_method(sel_getUid("dataSource:didUpdateRecord:contextInfo:"),function(_1b,_1c,_1d,_1e,_1f){
with(_1b){
if(enableSecurityPrompt){
objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"setUsername:",objj_msgSend(_1e,"name"));
objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"setPassword:",objj_msgSend(_1e,"password"));
objj_msgSend(enableSecurityPrompt,"dismissPrompt"),enableSecurityPrompt=nil;
objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"setSecurityEnabled:",YES);
}else{
if(disableSecurityPrompt){
objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"setUsername:",nil);
objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"setPassword:",nil);
objj_msgSend(disableSecurityPrompt,"dismissPrompt"),disableSecurityPrompt=nil;
objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"setSecurityEnabled:",NO);
}else{
if(changeUsernamePrompt){
objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"setUsername:",objj_msgSend(_1e,"name"));
objj_msgSend(changeUsernamePrompt,"dismissPrompt"),changeUsernamePrompt=nil;
}else{
if(changePasswordPrompt){
objj_msgSend(objj_msgSend(PMSSecurity,"sharedSecurity"),"setPassword:",objj_msgSend(_1e,"password"));
objj_msgSend(changePasswordPrompt,"dismissPrompt"),changePasswordPrompt=nil;
}
}
}
}
}
}),new objj_method(sel_getUid("dataSource:didFailToUpdateRecord:withError:contextInfo:"),function(_20,_21,_22,_23,_24,_25){
with(_20){
var _26=enableSecurityPrompt||disableSecurityPrompt||changeUsernamePrompt||changePasswordPrompt;
objj_msgSend(_26,"shake");
objj_msgSend(_23,"rejectChangedAttributes");
}
}),new objj_method(sel_getUid("changeUsername:"),function(_27,_28,_29){
with(_27){
if(changeUsernamePrompt){
return;
}
var _2a=objj_msgSend(objj_msgSend(MMPrompt,"alloc"),"init");
changeUsernamePrompt=_2a;
objj_msgSend(_2a,"setMessageText:",CPLocalizedString("Change your username, and enter your password to authenticate.","Change username prompt message"));
objj_msgSend(_2a,"addFieldWithLabel:value:",CPLocalizedString("Username:","Username label"),objj_msgSend(adminAccount,"name"));
objj_msgSend(_2a,"addFieldWithLabel:value:placeholder:secure:",CPLocalizedString("Password:","Password label"),"","",YES);
objj_msgSend(_2a,"addButtonWithTitle:",CPLocalizedString("Change","Change"));
objj_msgSend(_2a,"addButtonWithTitle:",CPLocalizedString("Cancel","Cancel"));
objj_msgSend(_2a,"setDelegate:",_27);
objj_msgSend(_2a,"beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:",objj_msgSend(objj_msgSend(_27,"view"),"window"),nil,nil,nil);
}
}),new objj_method(sel_getUid("changePassword:"),function(_2b,_2c,_2d){
with(_2b){
if(changePasswordPrompt){
return;
}
var _2e=objj_msgSend(objj_msgSend(MMPrompt,"alloc"),"init");
changePasswordPrompt=_2e;
objj_msgSend(_2e,"setMessageText:",CPLocalizedString("Enter your current password to authenticate, then enter and verify your new password.","Change password prompt message"));
objj_msgSend(_2e,"addFieldWithLabel:value:placeholder:secure:",CPLocalizedString("Current Password:","Password label"),"","",YES);
objj_msgSend(_2e,"addFieldWithLabel:value:placeholder:secure:",CPLocalizedString("New Password:","Password label"),"","",YES);
objj_msgSend(_2e,"addFieldWithLabel:value:placeholder:secure:",CPLocalizedString("Verify:","Verify password label"),"","",YES);
objj_msgSend(_2e,"addButtonWithTitle:",CPLocalizedString("Change","Change"));
objj_msgSend(_2e,"addButtonWithTitle:",CPLocalizedString("Cancel","Cancel"));
objj_msgSend(_2e,"setDelegate:",_2b);
objj_msgSend(_2e,"beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:",objj_msgSend(objj_msgSend(_2b,"view"),"window"),nil,nil,nil);
}
}),new objj_method(sel_getUid("toggleSecurityEnabled:"),function(_2f,_30,_31){
with(_2f){
var _32=(objj_msgSend(_31,"state")==CPOnState);
if(_32){
var _33=objj_msgSend(objj_msgSend(MMPrompt,"alloc"),"init");
enableSecurityPrompt=_33;
objj_msgSend(_33,"setMessageText:",CPLocalizedString("Enter a password to enable secure access to your server:","Enable security prompt message"));
objj_msgSend(_33,"addFieldWithLabel:value:placeholder:secure:",CPLocalizedString("Password:","Password label"),"","",YES);
objj_msgSend(_33,"addFieldWithLabel:value:placeholder:secure:",CPLocalizedString("Verify:","Verify password label"),"","",YES);
objj_msgSend(_33,"addButtonWithTitle:",CPLocalizedString("Enable","Enable"));
objj_msgSend(_33,"addButtonWithTitle:",CPLocalizedString("Cancel","Cancel"));
objj_msgSend(_33,"setDelegate:",_2f);
objj_msgSend(_33,"beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:",objj_msgSend(objj_msgSend(_2f,"view"),"window"),nil,nil,nil);
}else{
var _33=objj_msgSend(objj_msgSend(MMPrompt,"alloc"),"init");
disableSecurityPrompt=_33;
objj_msgSend(_33,"setMessageText:",CPLocalizedString("Are you sure you want to disable secure access to your server?","Disable secure server access confirmation"));
objj_msgSend(_33,"addFieldWithLabel:value:placeholder:secure:",CPLocalizedString("Password:","Password label"),"","",YES);
objj_msgSend(_33,"addButtonWithTitle:",CPLocalizedString("Disable Secure Access","Disable secure server confirmation button"));
objj_msgSend(_33,"addButtonWithTitle:",CPLocalizedString("Cancel","Cancel"));
objj_msgSend(_33,"setInformativeText:",CPLocalizedString("Turning off secure server access will allow incoming connections from any computer.","Disable secure server access confirmation info"));
objj_msgSend(_33,"setDelegate:",_2f);
objj_msgSend(_33,"beginSheetModalForWindow:modalDelegate:didEndSelector:contextInfo:",objj_msgSend(objj_msgSend(_2f,"view"),"window"),_2f,nil,nil);
}
}
}),new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"),function(_34,_35,_36,_37,_38,_39){
with(_34){
if(enableSecurityPrompt||disableSecurityPrompt){
return;
}
var _3a=objj_msgSend(_38,"objectForKey:",CPKeyValueChangeNewKey);
objj_msgSend(objj_msgSend(objj_msgSend(_34,"view"),"enableSecurityCheckbox"),"setState:",_3a?CPOnState:CPOffState);
objj_msgSend(objj_msgSend(objj_msgSend(_34,"view"),"changeUsernameButton"),"setEnabled:",_3a);
objj_msgSend(objj_msgSend(objj_msgSend(_34,"view"),"changePasswordButton"),"setEnabled:",_3a);
}
})]);
p;34;Views/MMPreferencesSecurityPanel.jt;7177;@STATIC;1.0;I;15;AppKit/CPView.jt;7138;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"MMPreferencesSecurityPanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("securityTitleLabel"),new objj_ivar("securityExplanationLabel"),new objj_ivar("enableSecurityCheckbox"),new objj_ivar("settingsBox"),new objj_ivar("changeUsernameButton"),new objj_ivar("changePasswordButton"),new objj_ivar("usernameLabel"),new objj_ivar("usernameValueLabel"),new objj_ivar("keyImageView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("enableSecurityCheckbox"),function(_3,_4){
with(_3){
return enableSecurityCheckbox;
}
}),new objj_method(sel_getUid("setEnableSecurityCheckbox:"),function(_5,_6,_7){
with(_5){
enableSecurityCheckbox=_7;
}
}),new objj_method(sel_getUid("changeUsernameButton"),function(_8,_9){
with(_8){
return changeUsernameButton;
}
}),new objj_method(sel_getUid("setChangeUsernameButton:"),function(_a,_b,_c){
with(_a){
changeUsernameButton=_c;
}
}),new objj_method(sel_getUid("changePasswordButton"),function(_d,_e){
with(_d){
return changePasswordButton;
}
}),new objj_method(sel_getUid("setChangePasswordButton:"),function(_f,_10,_11){
with(_f){
changePasswordButton=_11;
}
}),new objj_method(sel_getUid("usernameValueLabel"),function(_12,_13){
with(_12){
return usernameValueLabel;
}
}),new objj_method(sel_getUid("setUsernameValueLabel:"),function(_14,_15,_16){
with(_14){
usernameValueLabel=_16;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_17,_18,_19){
with(_17){
if(_17=objj_msgSendSuper({receiver:_17,super_class:objj_getClass("MMPreferencesSecurityPanel").super_class},"initWithFrame:",_19)){
securityTitleLabel=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Secure Server Access","Security preference pane title"));
securityExplanationLabel=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("If you want to share your media over the Internet, you can turn on Secure Server Access to prevent unauthorized access to your server.","Security preference pane explanation"));
objj_msgSend(securityTitleLabel,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",14));
objj_msgSend(securityTitleLabel,"sizeToFit");
objj_msgSend(securityTitleLabel,"setFrameOrigin:",CGPointMake(0,0));
objj_msgSend(securityExplanationLabel,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",12));
objj_msgSend(securityExplanationLabel,"setLineBreakMode:",CPLineBreakByWordWrapping);
enableSecurityCheckbox=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("Enable Secure Access","Check box label to enable secure server access"));
objj_msgSend(enableSecurityCheckbox,"setTarget:",_17);
objj_msgSend(enableSecurityCheckbox,"setAction:",sel_getUid("toggleSecurityEnabled:"));
objj_msgSend(enableSecurityCheckbox,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",13));
objj_msgSend(enableSecurityCheckbox,"sizeToFit");
var _1a=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMakeZero());
settingsBox=objj_msgSend(CPBox,"boxEnclosingView:",_1a);
objj_msgSend(settingsBox,"setBorderType:",CPBezelBorder);
objj_msgSend(settingsBox,"setBoxType:",CPBoxPrimary);
objj_msgSend(settingsBox,"setCornerRadius:",5);
objj_msgSend(settingsBox,"setFillColor:",objj_msgSend(CPColor,"colorWithWhite:alpha:",229/255,1));
objj_msgSend(settingsBox,"setAutoresizingMask:",CPViewWidthSizable);
var _1b=objj_msgSend(objj_msgSend(CPImage,"alloc"),"initWithContentsOfFile:size:",objj_msgSend(objj_msgSend(CPBundle,"mainBundle"),"pathForResource:","Key_Large.png"),CGSizeMake(128,128));
keyImageView=objj_msgSend(objj_msgSend(MMImageView,"alloc"),"initWithFrame:",CGRectMake(0,0,objj_msgSend(_1b,"size").width,objj_msgSend(_1b,"size").height));
objj_msgSend(keyImageView,"setImage:",_1b);
objj_msgSend(_17,"addSubview:",keyImageView);
usernameLabel=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Username:","Username label"));
objj_msgSend(usernameLabel,"setFrameOrigin:",CGPointMake(15,15));
objj_msgSend(usernameLabel,"setFont:",objj_msgSend(CPFont,"boldSystemFontOfSize:",12));
objj_msgSend(usernameLabel,"sizeToFit");
objj_msgSend(_1a,"addSubview:",usernameLabel);
usernameValueLabel=objj_msgSend(CPTextField,"labelWithTitle:","");
objj_msgSend(usernameValueLabel,"setFrame:",CGRectMake(CGRectGetMaxX(objj_msgSend(usernameLabel,"frame"))+5,CGRectGetMinY(objj_msgSend(usernameLabel,"frame")),CGRectGetWidth(objj_msgSend(_1a,"frame"))-CGRectGetMaxX(objj_msgSend(usernameLabel,"frame"))-5,CGRectGetHeight(objj_msgSend(usernameValueLabel,"frame"))));
objj_msgSend(usernameValueLabel,"setAutoresizingMask:",CPViewWidthSizable);
objj_msgSend(_1a,"addSubview:",usernameValueLabel);
changeUsernameButton=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Change Username","Security preferences button to change the main account username"));
objj_msgSend(changeUsernameButton,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(usernameLabel,"frame")),CGRectGetMaxY(objj_msgSend(usernameLabel,"frame"))+10));
objj_msgSend(_1a,"addSubview:",changeUsernameButton);
changePasswordButton=objj_msgSend(CPButton,"buttonWithTitle:",CPLocalizedString("Change Password","Security preferences button to change the main account password"));
objj_msgSend(changePasswordButton,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(changeUsernameButton,"frame"))+10,CGRectGetMinY(objj_msgSend(changeUsernameButton,"frame"))));
objj_msgSend(_1a,"addSubview:",changePasswordButton);
objj_msgSend(_17,"addSubview:",securityTitleLabel);
objj_msgSend(_17,"addSubview:",securityExplanationLabel);
objj_msgSend(_17,"addSubview:",enableSecurityCheckbox);
objj_msgSend(_17,"addSubview:",settingsBox);
objj_msgSend(_17,"layoutSubviews");
}
return _17;
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_1c,_1d){
with(_1c){
var _1e=CGRectGetWidth(objj_msgSend(_1c,"frame"));
var _1f=objj_msgSend(objj_msgSend(securityExplanationLabel,"stringValue"),"sizeWithFont:inWidth:",objj_msgSend(securityExplanationLabel,"font"),_1e);
_1f.height+=5;
objj_msgSend(securityExplanationLabel,"setFrameSize:",_1f);
objj_msgSend(securityExplanationLabel,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(securityTitleLabel,"frame")),CGRectGetMaxY(objj_msgSend(securityTitleLabel,"frame"))+5));
objj_msgSend(keyImageView,"setFrameOrigin:",CGPointMake(-15,CGRectGetMaxY(objj_msgSend(securityExplanationLabel,"frame"))+5));
objj_msgSend(enableSecurityCheckbox,"setFrameOrigin:",CGPointMake(CGRectGetMaxX(objj_msgSend(keyImageView,"frame"))-15,CGRectGetMinY(objj_msgSend(keyImageView,"frame"))+15));
objj_msgSend(settingsBox,"setFrame:",CGRectMake(CGRectGetMinX(objj_msgSend(enableSecurityCheckbox,"frame")),CGRectGetMaxY(objj_msgSend(enableSecurityCheckbox,"frame"))+5,_1e-CGRectGetMinX(objj_msgSend(enableSecurityCheckbox,"frame")),CGRectGetMaxY(objj_msgSend(changeUsernameButton,"frame"))+15));
objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("MMPreferencesSecurityPanel").super_class},"layoutSubviews");
}
}),new objj_method(sel_getUid("toggleSecurityEnabled:"),function(_20,_21,_22){
with(_20){
var _23=objj_msgSend(enableSecurityCheckbox,"state")==CPOnState;
}
})]);
p;50;Controllers/MMPreferencesAdvancedPanelController.jt;802;@STATIC;1.0;i;34;MMPreferencesBasePanelController.ji;37;../Views/MMPreferencesAdvancedPanel.jt;703;
objj_executeFile("MMPreferencesBasePanelController.j",YES);
objj_executeFile("../Views/MMPreferencesAdvancedPanel.j",YES);
var _1=objj_allocateClassPair(MMPreferencesBasePanelController,"MMPreferencesAdvancedPanelController"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("identifier"),function(_3,_4){
with(_3){
return "Advanced";
}
}),new objj_method(sel_getUid("title"),function(_5,_6){
with(_5){
return CPLocalizedString("Advanced","Advanced");
}
}),new objj_method(sel_getUid("loadView"),function(_7,_8){
with(_7){
objj_msgSend(_7,"setView:",objj_msgSend(objj_msgSend(MMPreferencesAdvancedPanel,"alloc"),"initWithFrame:",CGRectMake(0,0,485,120)));
}
})]);
p;34;Views/MMPreferencesAdvancedPanel.jt;4324;@STATIC;1.0;I;15;AppKit/CPView.jt;4285;
objj_executeFile("AppKit/CPView.j",NO);
var _1=objj_allocateClassPair(CPView,"MMPreferencesAdvancedPanel"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("disableCapabilityCheckingCheckBox"),new objj_ivar("disableCapabilityCheckingLabel"),new objj_ivar("dtsMixdownCheckbox"),new objj_ivar("dtsMixdownLabel")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:"),function(_3,_4,_5){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("MMPreferencesAdvancedPanel").super_class},"initWithFrame:",_5)){
disableCapabilityCheckingCheckBox=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("Disable capability checking","Preference window setting"));
objj_msgSend(disableCapabilityCheckingCheckBox,"sizeToFit");
objj_msgSend(disableCapabilityCheckingCheckBox,"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.disableCapabilityChecking",nil);
objj_msgSend(_3,"addSubview:",disableCapabilityCheckingCheckBox);
disableCapabilityCheckingLabel=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Capability checking ensures that plug-ins that are incompatible with this version of the server or the current client application you are using are hidden. Disabling capability checking is useful during development, but will enable access to plug-ins that may perform unreliably with certain client applications.","Preference window setting detail"));
objj_msgSend(disableCapabilityCheckingLabel,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(disableCapabilityCheckingLabel,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_3,"addSubview:",disableCapabilityCheckingLabel);
if(objj_msgSend(objj_msgSend(PMSCapabilities,"sharedPMSCapabilities"),"dtsMixdownSupported")){
dtsMixdownCheckbox=objj_msgSend(CPCheckBox,"checkBoxWithTitle:",CPLocalizedString("Enable DTS mix-down for Media Link clients","Preference window setting"));
objj_msgSend(dtsMixdownCheckbox,"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(MMPrefsController,"sharedPrefsController"),"values.enableMediaLinkDtsDownmixing",nil);
objj_msgSend(_3,"addSubview:",dtsMixdownCheckbox);
dtsMixdownLabel=objj_msgSend(CPTextField,"labelWithTitle:",CPLocalizedString("Media Link does not support DTS audio in certain regions. The Plex Media Server can automatically convert DTS to stereo so that it will play.","Preference window setting detail"));
objj_msgSend(dtsMixdownLabel,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",11));
objj_msgSend(dtsMixdownLabel,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_3,"addSubview:",dtsMixdownLabel);
}
objj_msgSend(_3,"sizeToFit");
}
return _3;
}
}),new objj_method(sel_getUid("sizeToFit"),function(_6,_7){
with(_6){
objj_msgSend(_6,"layoutSubviews");
objj_msgSend(_6,"setFrameSize:",CGSizeMake(CGRectGetWidth(objj_msgSend(_6,"frame")),CGRectGetMaxY(objj_msgSend((dtsMixdownLabel||disableCapabilityCheckingLabel),"frame"))));
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_8,_9){
with(_8){
objj_msgSend(disableCapabilityCheckingCheckBox,"sizeToFit");
objj_msgSend(dtsMixdownCheckbox,"sizeToFit");
var _a=CGRectGetWidth(objj_msgSend(_8,"frame")),_b=17,_c=_a-_b,_d=_a-_b;
var _e=objj_msgSend(CPPlatformString,"sizeOfString:withFont:forWidth:",objj_msgSend(disableCapabilityCheckingLabel,"stringValue"),objj_msgSend(disableCapabilityCheckingLabel,"font"),_c);
_e.height+=5;
objj_msgSend(disableCapabilityCheckingLabel,"setFrameOrigin:",CGPointMake(_b,CGRectGetMaxY(objj_msgSend(disableCapabilityCheckingCheckBox,"frame"))));
objj_msgSend(disableCapabilityCheckingLabel,"setFrameSize:",_e);
if(dtsMixdownCheckbox){
objj_msgSend(dtsMixdownCheckbox,"setFrameOrigin:",CGPointMake(CGRectGetMinX(objj_msgSend(disableCapabilityCheckingCheckBox,"frame")),CGRectGetMaxY(objj_msgSend(disableCapabilityCheckingLabel,"frame"))+10));
var _f=objj_msgSend(CPPlatformString,"sizeOfString:withFont:forWidth:",objj_msgSend(dtsMixdownLabel,"stringValue"),objj_msgSend(dtsMixdownLabel,"font"),_d);
_f.height+=5;
objj_msgSend(dtsMixdownLabel,"setFrameOrigin:",CGPointMake(_b,CGRectGetMaxY(objj_msgSend(dtsMixdownCheckbox,"frame"))));
objj_msgSend(dtsMixdownLabel,"setFrameSize:",_f);
}
}
})]);
