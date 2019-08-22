package com.feathersui.components.screens;

import feathers.core.PopUpManager;
import feathers.controls.Label;
import openfl.events.Event;
import openfl.events.MouseEvent;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;
import feathers.controls.Button;
import feathers.controls.TextInput;
import feathers.controls.LayoutGroup;
import feathers.controls.Panel;

class PopUpManagerScreen extends Panel {
	private var button:Button;

	override private function initialize():Void {
		super.initialize();

		this.layout = new AnchorLayout();

		this.headerFactory = function():LayoutGroup {
			var header = new LayoutGroup();
			header.variant = LayoutGroup.VARIANT_TOOL_BAR;
			header.layout = new AnchorLayout();

			var headerTitle = new Label();
			headerTitle.variant = Label.VARIANT_HEADING;
			headerTitle.text = "Pop Up Manager";
			headerTitle.layoutData = AnchorLayoutData.center();
			header.addChild(headerTitle);

			var backButton = new Button();
			backButton.text = "Back";
			backButton.layoutData = new AnchorLayoutData(null, null, null, 10, null, 0);
			backButton.addEventListener(MouseEvent.CLICK, backButton_clickHandler);
			header.addChild(backButton);

			return header;
		};

		this.button = new Button();
		this.button.text = "Add Pop Up";
		this.button.layoutData = AnchorLayoutData.center();
		this.button.addEventListener(MouseEvent.CLICK, addPopUpButton_clickHandler);
		this.addChild(this.button);
	}

	private function backButton_clickHandler(event:MouseEvent):Void {
		this.dispatchEvent(new Event(Event.COMPLETE));
	}

	private function addPopUpButton_clickHandler(event:MouseEvent):Void {
		var popUp = new Panel();
		popUp.layout = new AnchorLayout();
		var message = new Label();
		message.text = "I'm a pop-up!";
		message.layoutData = AnchorLayoutData.center();
		popUp.addChild(message);
		popUp.footerFactory = () -> {
			var footer = new LayoutGroup();
			footer.variant = LayoutGroup.VARIANT_TOOL_BAR;
			var closeButton = new Button();
			closeButton.text = "Close";
			closeButton.addEventListener(MouseEvent.CLICK, (event:MouseEvent) -> {
				PopUpManager.removePopUp(popUp);
			});
			footer.addChild(closeButton);
			return footer;
		}
		PopUpManager.addPopUp(popUp, this);
	}
}