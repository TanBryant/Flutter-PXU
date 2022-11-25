/*global chrome*/

const ELEM_ID = 'css-page-layout-extension';
const remove = () => {
    const styleEl = document.getElementById(ELEM_ID);
	if (styleEl) {
		styleEl.remove();
	}
};

const add = () => {
    let styleEl = document.getElementById(ELEM_ID);
	if (styleEl) {
		return;
	}
    styleEl = document.createElement('style');
	styleEl.id = ELEM_ID;
	styleEl.innerHTML = '* { background:#000!important;color:#0f0!important;outline:solid #f00 1px!important; background-color: rgba(0,2,54,.1) !important; }\
    * * { background-color: rgba(0,255,0,.2) !important; }\
    * * * { background-color: rgba(0,0,255,.2) !important; }\
    * * * * { background-color: rgba(255,0,255,.2) !important; }\
    * * * * * { background-color: rgba(0,255,255,.2) !important; }\
    * * * * * * { background-color: rgba(255,255,0,.2) !important; }\
    * * * * * * * { background-color: rgba(255,0,0,.2) !important; }\
    * * * * * * * * { background-color: rgba(0,255,0,.2) !important; }\
    * * * * * * * * * { background-color: rgba(0,0,30,.2) !important; }\
    * * * * * * * * * * { background-color: rgba(0,0,60,.2) !important; }\
    * * * * * * * * * * * { background-color: rgba(0,0,90,.2) !important; }\
    * * * * * * * * * * * * { background-color: rgba(0,0,120,.2) !important; }\
    * * * * * * * * * * * * * { background-color: rgba(0,0,150,.2) !important; }\
    * * * * * * * * * * * * * * { background-color: rgba(0,0,180,.2) !important; }\
    * * * * * * * * * * * * * * * { background-color: rgba(0,0,210,.2) !important; }\
    * * * * * * * * * * * * * * * * { background-color: rgba(0,0,255,.2) !important; }';
	document.body.append(styleEl);
};

const checkIfExist = () => {
    const styleEl = document.getElementById(ELEM_ID);
    return !!styleEl;
};

chrome.runtime.onConnect.addListener((port) => {
	port.onMessage.addListener((request, senderPort) => {
		switch (request.type) {
		case 'add':
            add();
            break;
        case 'remove':
            remove();
            break;
        case 'check':
            const exist = checkIfExist();
            chrome.runtime.sendMessage({type: 'checked', exist});
            break;
		default: break;
		}
	});
});

chrome.runtime.onMessage.addListener((request) => {
	switch (request.type) {
	case 'connectPort':
		chrome.runtime.sendMessage({type: 'tabReadyToConnect'});
		break;
	default: break;
	}
});
