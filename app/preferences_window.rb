class PreferencesWindow < NSWindowController
  include FoggyConstants

  extend IB

  outlet :activateOnLaunch, NSButton
  outlet :openAtLogin, NSButton
  outlet :popup, NSPopUpButton

  def windowDidLoad
    # Check/uncheck boxes based on UserDefaults.
    @activateOnLaunch.state = NSUserDefaults[:activateOnLaunch]
    @openAtLogin.state = NSUserDefaults[:openAtLogin]

    # Set the user's default toggle time.
    @popup.selectItemWithTag(NSUserDefaults[:timer])
  end

  def saveDefaultBooleanPreference(sender)
    NSUserDefaults[PreferencesMap[sender.tag]] = sender.state == NSOnState ? NSOnState : NSOffState
  end

  def saveDefaultTimerPreference(sender)
    NSUserDefaults[:timer] = sender.selectedItem.tag
  end
end
