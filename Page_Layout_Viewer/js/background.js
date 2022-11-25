/*global chrome*/

let port;
let isPortConnected = null;

const disconnectPort = () => {
	if (port && isPortConnected) {
		port.disconnect();
		isPortConnected = null;
	}
}

const connectPort = (tab) => {
	if (isPortConnected === tab.id) {
		return;
	}
	port = chrome.tabs.connect(tab.id);
	isPortConnected = tab.id;
}

const getActiveTab = (cb) => {
	chrome.tabs.query({ active: true, currentWindow: true }, (tabs) => {
		if (tabs && tabs.length) {
			cb(tabs[0]);
		}
	});
}

const handleContentChange = (tabId) => {
	disconnectPort();
	chrome.tabs.sendMessage(tabId, { type: 'connectPort' });
}

let active = false;

chrome.tabs.onActivated.addListener((activeInfo) => {
	handleContentChange(activeInfo.tabId);
});

chrome.tabs.onUpdated.addListener((tabId, changeInfo, tab) => {
	if (changeInfo.status === 'complete') {
		handleContentChange(tab.id);
	} else if (changeInfo.status === 'loading') {
		disconnectPort();
		chrome.browserAction.disable(tab.id);
	}
});

chrome.runtime.onMessage.addListener((request) => {
	switch (request.type) {
        case 'checked':
			active = request.exist;
			chrome.browserAction.setIcon({path: request.exist ? 'icons/icon_128X128_active.png' : 'icons/icon_128X128.png'});
			getActiveTab((tab) => {
				chrome.browserAction.enable(tab.id);
			});
			break;
		case 'tabReadyToConnect':
			getActiveTab((tab) => {
				connectPort(tab);
				port.postMessage({ type: 'check' });
			});
			break;
	default:
		break;
	}
});

chrome.browserAction.onClicked.addListener(() => {
	if (!port || !isPortConnected) {
		return;
	}
	active = !active;
	port.postMessage({ type: active ? 'add' : 'remove' });
	chrome.browserAction.setIcon({path: active ? 'icons/icon_128X128_active.png' : 'icons/icon_128X128.png'});
});
