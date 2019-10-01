/*
	Feathers UI
	Copyright 2019 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package feathers.themes.steel.components;

import feathers.skins.CircleSkin;
import feathers.controls.BasicToggleButton;
import feathers.controls.ToggleSwitch;
import feathers.skins.RectangleSkin;
import feathers.style.Theme;
import feathers.themes.steel.SteelTheme;

/**
	Initialize "steel" styles for the `ToggleSwitch` component.

	@since 1.0.0
**/
@:access(feathers.themes.steel.SteelTheme)
class SteelToggleSwitchStyles {
	public static function initialize():Void {
		var theme = Std.downcast(Theme.fallbackTheme, SteelTheme);
		if (theme != null && theme.styleProvider.getStyleFunction(ToggleSwitch, null) == null) {
			theme.styleProvider.setStyleFunction(ToggleSwitch, null, setStyles);
		}
	}

	private static function setStyles(toggle:ToggleSwitch):Void {
		var theme = Std.downcast(Theme.fallbackTheme, SteelTheme);
		if (theme == null) {
			return;
		}

		if (toggle.trackSkin == null) {
			var trackSkin = new RectangleSkin();
			trackSkin.width = 64.0;
			trackSkin.height = 32.0;
			trackSkin.minWidth = 64.0;
			trackSkin.minHeight = 32.0;
			trackSkin.cornerRadius = 32.0;
			trackSkin.fill = theme.getInsetFill();
			trackSkin.border = theme.getInsetBorder();
			trackSkin.selectedFill = theme.getReversedActiveThemeFill();
			trackSkin.selectedBorder = theme.getActiveFillBorder();

			var track:BasicToggleButton = new BasicToggleButton();
			track.toggleable = false;
			track.keepDownStateOnRollOut = true;
			track.backgroundSkin = trackSkin;
			toggle.trackSkin = track;
		}
		if (toggle.thumbSkin == null) {
			var thumbSkin = new CircleSkin();
			thumbSkin.width = 32.0;
			thumbSkin.height = 32.0;
			thumbSkin.minWidth = 32.0;
			thumbSkin.minHeight = 32.0;
			thumbSkin.fill = theme.getButtonFill();
			thumbSkin.border = theme.getBorder();
			thumbSkin.selectedBorder = theme.getActiveFillBorder();

			var thumb:BasicToggleButton = new BasicToggleButton();
			thumb.toggleable = false;
			thumb.keepDownStateOnRollOut = true;
			thumb.backgroundSkin = thumbSkin;
			toggle.thumbSkin = thumb;
		}
	}
}