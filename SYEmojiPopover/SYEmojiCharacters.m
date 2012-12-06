//
//  SYEmojiCharacters.m
//  SYEmojiPopoverExample
//
//  Created by rominet on 12/6/12.
//  Copyright (c) 2012 Syan. All rights reserved.
//

#import "SYEmojiCharacters.h"

@interface SYEmojiCharacters (Private)
-(void)loadCharacters;
@end


@implementation SYEmojiCharacters

#pragma mark - Initialization
- (id)init
{ if (self = [super init]) { [self loadCharacters]; } return self; }

+ (SYEmojiCharacters*)sharedCharacters
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

#pragma mark - Methods

-(BOOL)isCharacterEmoji:(NSString *)string
{
    for(NSArray *panel in self->_characters)
        for(NSString *emoji in panel)
            if([emoji isEqualToString:string])
                return YES;
    
    return NO;
}

-(NSInteger)numberOfSections
{
    return [self->_characters count];
}

-(NSInteger)numberOfRowsInSection:(NSUInteger)section
{
    if(section >= [self numberOfSections])
        return 0;
    
    return [(NSArray*)[self->_characters objectAtIndex:section] count];
}

-(NSString*)emojiAtRow:(NSUInteger)row andSection:(NSUInteger)section
{
    if(section >= [self numberOfSections])
        return nil;
    
    if(row >= [self numberOfRowsInSection:section])
        return nil;
    
    return [(NSArray*)[self->_characters objectAtIndex:section] objectAtIndex:row];
}

#pragma mark - Private Methods
-(void)loadCharacters
{
    self->_characters = [NSMutableArray array];
    // ## Characters should all by separated by commas
    // ##
    // ##
    // ##
    // ##
    // ##
    // ##
    // ##  iOS 6.0.1 character set from Emoji keyboard
    // ##
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0") &&
        SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        NSArray *chars_000 = @[
        @"😄", @"😃", @"😀", @"😊", @"☺", @"😉", @"😍", @"😘", @"😚", @"😗",
        @"😙", @"😜", @"😝", @"😛", @"😳", @"😁", @"😔", @"😌", @"😒", @"😞",
        @"😣", @"😢", @"😂", @"😭", @"😪", @"😥", @"😰", @"😅", @"😓", @"😩",
        @"😫", @"😨", @"😱", @"😠", @"😡", @"😤", @"😖", @"😆", @"😋", @"😷",
        @"😎", @"😴", @"😵", @"😲", @"😟", @"😦", @"😧", @"😈", @"👿", @"😮",
        @"😬", @"😐", @"😕", @"😯", @"😶", @"😇", @"😏", @"😑", @"👲", @"👳",
        @"👮", @"👷", @"💂", @"👶", @"👦", @"👧", @"👨", @"👩", @"👴", @"👵",
        @"👱", @"👼", @"👸", @"😺", @"😸", @"😻", @"😽", @"😼", @"🙀", @"😿",
        @"😹", @"😾", @"👹", @"👺", @"🙈", @"🙉", @"🙊", @"💀", @"👽", @"💩",
        @"🔥", @"✨", @"🌟", @"💫", @"💥", @"💢", @"💦", @"💧", @"💤", @"💨",
        @"👂", @"👀", @"👃", @"👅", @"👄", @"👍", @"👎", @"👌", @"👊", @"✊",
        @"✌", @"👋", @"✋", @"👐", @"👆", @"👇", @"👉", @"👈", @"🙌", @"🙏",
        @"☝", @"👏", @"💪", @"🚶", @"🏃", @"💃", @"👫", @"👪", @"👬", @"👭",
        @"💏", @"💑", @"👯", @"🙆", @"🙅", @"💁", @"🙋", @"💆", @"💇", @"💅",
        @"👰", @"🙎", @"🙍", @"🙇", @"🎩", @"👑", @"👒", @"👟", @"👞", @"👡",
        @"👠", @"👢", @"👕", @"👔", @"👚", @"👗", @"🎽", @"👖", @"👘", @"👙",
        @"💼", @"👜", @"👝", @"👛", @"👓", @"🎀", @"🌂", @"💄", @"💛", @"💙",
        @"💜", @"💚", @"❤", @"💔", @"💗", @"💓", @"💕", @"💖", @"💞", @"💘",
        @"💌", @"💋", @"💍", @"💎", @"👤", @"👥", @"💬", @"👣", @"💭"];
        [self->_characters addObject:chars_000];
        
        // ##
        NSArray *chars_001 = @[
        @"🐶", @"🐺", @"🐱", @"🐭", @"🐹", @"🐰", @"🐸", @"🐯", @"🐨", @"🐻",
        @"🐷", @"🐽", @"🐮", @"🐗", @"🐵", @"🐒", @"🐴", @"🐑", @"🐘", @"🐼",
        @"🐧", @"🐦", @"🐤", @"🐥", @"🐣", @"🐔", @"🐍", @"🐢", @"🐛", @"🐝",
        @"🐜", @"🐞", @"🐌", @"🐙", @"🐚", @"🐠", @"🐟", @"🐬", @"🐳", @"🐋",
        @"🐄", @"🐏", @"🐀", @"🐃", @"🐅", @"🐇", @"🐉", @"🐎", @"🐐", @"🐓",
        @"🐕", @"🐖", @"🐁", @"🐂", @"🐲", @"🐡", @"🐊", @"🐫", @"🐪", @"🐆",
        @"🐈", @"🐩", @"🐾", @"💐", @"🌸", @"🌷", @"🍀", @"🌹", @"🌻", @"🌺",
        @"🍁", @"🍃", @"🍂", @"🌿", @"🌾", @"🍄", @"🌵", @"🌴", @"🌲", @"🌳",
        @"🌰", @"🌱", @"🌼", @"🌐", @"🌞", @"🌝", @"🌚", @"🌑", @"🌒", @"🌓",
        @"🌔", @"🌕", @"🌖", @"🌗", @"🌘", @"🌜", @"🌛", @"🌙", @"🌍", @"🌎",
        @"🌏", @"🌋", @"🌌", @"🌠", @"⭐", @"☀", @"⛅", @"☁", @"⚡", @"☔",
        @"❄", @"⛄", @"🌀", @"🌁", @"🌈", @"🌊"];
        [self->_characters addObject:chars_001];
        
        // ##
        NSArray *chars_002 = @[
        @"🎍", @"💝", @"🎎", @"🎒", @"🎓", @"🎏", @"🎆", @"🎇", @"🎐", @"🎑",
        @"🎃", @"👻", @"🎅", @"🎄", @"🎁", @"🎋", @"🎉", @"🎊", @"🎈", @"🎌",
        @"🔮", @"🎥", @"📷", @"📹", @"📼", @"💿", @"📀", @"💽", @"💾", @"💻",
        @"📱", @"☎", @"📞", @"📟", @"📠", @"📡", @"📺", @"📻", @"🔊", @"🔉",
        @"🔈", @"🔇", @"🔔", @"🔕", @"📢", @"📣", @"⏳", @"⌛", @"⏰", @"⌚",
        @"🔓", @"🔒", @"🔏", @"🔐", @"🔑", @"🔎", @"💡", @"🔦", @"🔆", @"🔅",
        @"🔌", @"🔋", @"🔍", @"🛁", @"🛀", @"🚿", @"🚽", @"🔧", @"🔩", @"🔨",
        @"🚪", @"🚬", @"💣", @"🔫", @"🔪", @"💊", @"💉", @"💰", @"💴", @"💵",
        @"💷", @"💶", @"💳", @"💸", @"📲", @"📧", @"📥", @"📤", @"✉", @"📩",
        @"📨", @"📯", @"📫", @"📪", @"📬", @"📭", @"📮", @"📦", @"📝", @"📄",
        @"📃", @"📑", @"📊", @"📈", @"📉", @"📜", @"📋", @"📅", @"📆", @"📇",
        @"📁", @"📂", @"✂", @"📌", @"📎", @"✒", @"✏", @"📏", @"📐", @"📕",
        @"📗", @"📘", @"📙", @"📓", @"📔", @"📒", @"📚", @"📖", @"🔖", @"📛",
        @"🔬", @"🔭", @"📰", @"🎨", @"🎬", @"🎤", @"🎧", @"🎼", @"🎵", @"🎶",
        @"🎹", @"🎻", @"🎺", @"🎷", @"🎸", @"👾", @"🎮", @"🃏", @"🎴", @"🀄",
        @"🎲", @"🎯", @"🏈", @"🏀", @"⚽", @"⚾", @"🎾", @"🎱", @"🏉", @"🎳",
        @"⛳", @"🚵", @"🚴", @"🏁", @"🏇", @"🏆", @"🎿", @"🏂", @"🏊", @"🏄",
        @"🎣", @"☕", @"🍵", @"🍶", @"🍼", @"🍺", @"🍻", @"🍸", @"🍹", @"🍷",
        @"🍴", @"🍕", @"🍔", @"🍟", @"🍗", @"🍖", @"🍝", @"🍛", @"🍤", @"🍱",
        @"🍣", @"🍥", @"🍙", @"🍘", @"🍚", @"🍜", @"🍲", @"🍢", @"🍡", @"🍳",
        @"🍞", @"🍩", @"🍮", @"🍦", @"🍨", @"🍧", @"🎂", @"🍰", @"🍪", @"🍫",
        @"🍬", @"🍭", @"🍯", @"🍎", @"🍏", @"🍊", @"🍋", @"🍒", @"🍇", @"🍉",
        @"🍓", @"🍑", @"🍈", @"🍌", @"🍐", @"🍍", @"🍠", @"🍆", @"🍅", @"🌽"
        ];
        [self->_characters addObject:chars_002];
        
        // ##
        NSArray *chars_003 = @[
        @"🏠", @"🏡", @"🏫", @"🏢", @"🏣", @"🏥", @"🏦", @"🏪", @"🏩", @"🏨",
        @"💒", @"⛪", @"🏬", @"🏤", @"🌇", @"🌆", @"🏯", @"🏰", @"⛺", @"🏭",
        @"🗼", @"🗾", @"🗻", @"🌄", @"🌅", @"🌃", @"🗽", @"🌉", @"🎠", @"🎡",
        @"⛲", @"🎢", @"🚢", @"⛵", @"🚤", @"🚣", @"⚓", @"🚀", @"✈", @"💺",
        @"🚁", @"🚂", @"🚊", @"🚉", @"🚞", @"🚆", @"🚄", @"🚅", @"🚈", @"🚇",
        @"🚝", @"🚋", @"🚃", @"🚎", @"🚌", @"🚍", @"🚙", @"🚘", @"🚗", @"🚕",
        @"🚖", @"🚛", @"🚚", @"🚨", @"🚓", @"🚔", @"🚒", @"🚑", @"🚐", @"🚲",
        @"🚡", @"🚟", @"🚠", @"🚜", @"💈", @"🚏", @"🎫", @"🚦", @"🚥", @"⚠",
        @"🚧", @"🔰", @"⛽", @"🏮", @"🎰", @"♨", @"🗿", @"🎪", @"🎭", @"📍",
        @"🚩", @"🇯🇵", @"🇰🇷", @"🇩🇪", @"🇨🇳", @"🇺🇸", @"🇫🇷", @"🇪🇸", @"🇮🇹", @"🇷🇺",
        @"🇬🇧"];
        [self->_characters addObject:chars_003];
        
        // ##
        NSArray *chars_004 = @[
        @"1⃣", @"2⃣", @"3⃣", @"4⃣", @"5⃣", @"6⃣", @"7⃣", @"8⃣", @"9⃣", @"0⃣",
        @"🔟", @"🔢", @"#⃣", @"🔣", @"⬆", @"⬇", @"⬅", @"➡", @"🔠", @"🔡",
        @"🔤", @"↗", @"↖", @"↘", @"↙", @"↔", @"↕", @"🔄", @"◀", @"▶",
        @"🔼", @"🔽", @"↩", @"↪", @"ℹ", @"⏪", @"⏩", @"⏫", @"⏬", @"⤵",
        @"⤴", @"🆗", @"🔀", @"🔁", @"🔂", @"🆕", @"🆙", @"🆒", @"🆓", @"🆖",
        @"📶", @"🎦", @"🈁", @"🈯", @"🈳", @"🈵", @"🈴", @"🈲", @"🉐", @"🈹",
        @"🈺", @"🈶", @"🈚", @"🚻", @"🚹", @"🚺", @"🚼", @"🚾", @"🚰", @"🚮",
        @"🅿", @"♿", @"🚭", @"🈷", @"🈸", @"🈂", @"Ⓜ", @"🛂", @"🛄", @"🛅",
        @"🛃", @"🉑", @"㊙", @"㊗", @"🆑", @"🆘", @"🆔", @"🚫", @"🔞", @"📵",
        @"🚯", @"🚱", @"🚳", @"🚷", @"🚸", @"⛔", @"✳", @"❇", @"❎", @"✅",
        @"✴", @"💟", @"🆚", @"📳", @"📴", @"🅰", @"🅱", @"🆎", @"🅾", @"💠",
        @"➿", @"♻", @"♈", @"♉", @"♊", @"♋", @"♌", @"♍", @"♎", @"♏",
        @"♐", @"♑", @"♒", @"♓", @"⛎", @"🔯", @"🏧", @"💹", @"💲", @"💱",
        @"©", @"®", @"™", @"〽", @"〰", @"🔝", @"🔚", @"🔙", @"🔛", @"🔜",
        @"❌", @"⭕", @"❗", @"❓", @"❕", @"❔", @"🔃", @"🕛", @"🕧", @"🕐",
        @"🕜", @"🕑", @"🕝", @"🕒", @"🕞", @"🕓", @"🕟", @"🕔", @"🕠", @"🕕",
        @"🕖", @"🕗", @"🕘", @"🕙", @"🕚", @"🕡", @"🕢", @"🕣", @"🕤", @"🕥",
        @"🕦", @"✖", @"➕", @"➖", @"➗", @"♠", @"♥", @"♣", @"♦", @"💮",
        @"💯", @"✔", @"☑", @"🔘", @"🔗", @"➰", @"🔱", @"🔲", @"🔳", @"◼",
        @"◻", @"◾", @"◽", @"▪", @"▫", @"🔺", @"⬜", @"⬛", @"⚫", @"⚪",
        @"🔴", @"🔵", @"🔻", @"🔶", @"🔷", @"🔸", @"🔹"];
        [self->_characters addObject:chars_004];
        
    }
    // ##
    // ##
    // ##  iOS 5.1.1 character set supported (iOS6 all characters, removed blank characters)
    // ##
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.1.1") &&
        SYSTEM_VERSION_LESS_THAN(@"6.0")) {
        NSArray *chars_005 = @[
        @"😄", @"😃", @"😊", @"☺", @"😉", @"😍", @"😘", @"😚", @"😜", @"😝",
        @"😳", @"😁", @"😔", @"😌", @"😒", @"😞", @"😣", @"😢", @"😂", @"😭",
        @"😪", @"😥", @"😰", @"😅", @"😓", @"😩", @"😫", @"😨", @"😱", @"😠",
        @"😡", @"😤", @"😖", @"😆", @"😋", @"😷", @"😎", @"😵", @"😲", @"😈",
        @"👿", @"😐", @"😶", @"😇", @"👲", @"👳", @"👮", @"👷", @"💂", @"👶",
        @"👦", @"👧", @"👨", @"👩", @"👴", @"👵", @"👱", @"👼", @"👸", @"😺",
        @"😸", @"😻", @"😽", @"😼", @"🙀", @"😿", @"😹", @"😾", @"👹", @"👺",
        @"🙈", @"🙉", @"🙊", @"💀", @"👽", @"💩", @"🔥", @"✨", @"🌟", @"💫",
        @"💥", @"💢", @"💦", @"💧", @"💤", @"💨", @"👂", @"👀", @"👃", @"👅",
        @"👄", @"👍", @"👎", @"👌", @"👊", @"✊", @"✌", @"👋", @"✋", @"👐",
        @"👆", @"👇", @"👉", @"👈", @"🙌", @"🙏", @"☝", @"👏", @"💪", @"🚶",
        @"🏃", @"💃", @"👫", @"👪", @"👬", @"👭", @"💏", @"💑", @"👯", @"🙆",
        @"🙅", @"💁", @"🙋", @"💆", @"💇", @"💅", @"👰", @"🙎", @"🙍", @"🙇",
        @"🎩", @"👑", @"👒", @"👟", @"👞", @"👡", @"👠", @"👢", @"👕", @"👔",
        @"👚", @"👗", @"🎽", @"👖", @"👘", @"👙", @"💼", @"👜", @"👝", @"👛",
        @"👓", @"🎀", @"🌂", @"💄", @"💛", @"💙", @"💜", @"💚", @"❤", @"💔",
        @"💗", @"💓", @"💕", @"💖", @"💞", @"💘", @"💌", @"💋", @"💍", @"💎",
        @"👤", @"👥", @"💬", @"👣", @"💭"];
        [self->_characters addObject:chars_005];
        
        // ##
        NSArray *chars_006 = @[
        @"🐶", @"🐺", @"🐱", @"🐭", @"🐹", @"🐰", @"🐸", @"🐯", @"🐨", @"🐻",
        @"🐷", @"🐽", @"🐮", @"🐗", @"🐵", @"🐒", @"🐴", @"🐑", @"🐘", @"🐼",
        @"🐧", @"🐦", @"🐤", @"🐥", @"🐣", @"🐔", @"🐍", @"🐢", @"🐛", @"🐝",
        @"🐜", @"🐞", @"🐌", @"🐙", @"🐚", @"🐠", @"🐟", @"🐬", @"🐳", @"🐋",
        @"🐄", @"🐏", @"🐀", @"🐃", @"🐅", @"🐇", @"🐉", @"🐎", @"🐐", @"🐓",
        @"🐕", @"🐖", @"🐁", @"🐂", @"🐲", @"🐡", @"🐊", @"🐫", @"🐪", @"🐆",
        @"🐈", @"🐩", @"🐾", @"💐", @"🌸", @"🌷", @"🍀", @"🌹", @"🌻", @"🌺",
        @"🍁", @"🍃", @"🍂", @"🌿", @"🌾", @"🍄", @"🌵", @"🌴", @"🌲", @"🌳",
        @"🌰", @"🌱", @"🌼", @"🌐", @"🌞", @"🌝", @"🌚", @"🌑", @"🌒", @"🌓",
        @"🌔", @"🌕", @"🌖", @"🌗", @"🌘", @"🌜", @"🌛", @"🌙", @"🌍", @"🌎",
        @"🌏", @"🌋", @"🌌", @"🌠", @"⭐", @"☀", @"⛅", @"☁", @"⚡", @"☔",
        @"❄", @"⛄", @"🌀", @"🌁", @"🌈", @"🌊"];
        [self->_characters addObject:chars_006];
        
        // ##
        NSArray *chars_007 = @[
        @"🎍", @"💝", @"🎎", @"🎒", @"🎓", @"🎏", @"🎆", @"🎇", @"🎐", @"🎑",
        @"🎃", @"👻", @"🎅", @"🎄", @"🎁", @"🎋", @"🎉", @"🎊", @"🎈", @"🎌",
        @"🔮", @"🎥", @"📷", @"📹", @"📼", @"💿", @"📀", @"💽", @"💾", @"💻",
        @"📱", @"☎", @"📞", @"📟", @"📠", @"📡", @"📺", @"📻", @"🔊", @"🔉",
        @"🔈", @"🔇", @"🔔", @"🔕", @"📢", @"📣", @"⏳", @"⌛", @"⏰", @"⌚",
        @"🔓", @"🔒", @"🔏", @"🔐", @"🔑", @"🔎", @"💡", @"🔦", @"🔆", @"🔅",
        @"🔌", @"🔋", @"🔍", @"🛁", @"🛀", @"🚿", @"🚽", @"🔧", @"🔩", @"🔨",
        @"🚪", @"🚬", @"💣", @"🔫", @"🔪", @"💊", @"💉", @"💰", @"💴", @"💵",
        @"💷", @"💶", @"💳", @"💸", @"📲", @"📧", @"📥", @"📤", @"✉", @"📩",
        @"📨", @"📯", @"📫", @"📪", @"📬", @"📭", @"📮", @"📦", @"📝", @"📄",
        @"📃", @"📑", @"📊", @"📈", @"📉", @"📜", @"📋", @"📅", @"📆", @"📇",
        @"📁", @"📂", @"✂", @"📌", @"📎", @"✒", @"✏", @"📏", @"📐", @"📕",
        @"📗", @"📘", @"📙", @"📓", @"📔", @"📒", @"📚", @"📖", @"🔖", @"📛",
        @"🔬", @"🔭", @"📰", @"🎨", @"🎬", @"🎤", @"🎧", @"🎼", @"🎵", @"🎶",
        @"🎹", @"🎻", @"🎺", @"🎷", @"🎸", @"👾", @"🎮", @"🃏", @"🎴", @"🀄",
        @"🎲", @"🎯", @"🏈", @"🏀", @"⚽", @"⚾", @"🎾", @"🎱", @"🏉", @"🎳",
        @"⛳", @"🚵", @"🚴", @"🏁", @"🏇", @"🏆", @"🎿", @"🏂", @"🏊", @"🏄",
        @"🎣", @"☕", @"🍵", @"🍶", @"🍼", @"🍺", @"🍻", @"🍸", @"🍹", @"🍷",
        @"🍴", @"🍕", @"🍔", @"🍟", @"🍗", @"🍖", @"🍝", @"🍛", @"🍤", @"🍱",
        @"🍣", @"🍥", @"🍙", @"🍘", @"🍚", @"🍜", @"🍲", @"🍢", @"🍡", @"🍳",
        @"🍞", @"🍩", @"🍮", @"🍦", @"🍨", @"🍧", @"🎂", @"🍰", @"🍪", @"🍫",
        @"🍬", @"🍭", @"🍯", @"🍎", @"🍏", @"🍊", @"🍋", @"🍒", @"🍇", @"🍉",
        @"🍓", @"🍑", @"🍈", @"🍌", @"🍐", @"🍍", @"🍠", @"🍆", @"🍅", @"🌽"
        ];
        [self->_characters addObject:chars_007];
        
        // ##
        NSArray *chars_008 = @[
        @"🏠", @"🏡", @"🏫", @"🏢", @"🏣", @"🏥", @"🏦", @"🏪", @"🏩", @"🏨",
        @"💒", @"⛪", @"🏬", @"🏤", @"🌇", @"🌆", @"🏯", @"🏰", @"⛺", @"🏭",
        @"🗼", @"🗾", @"🗻", @"🌄", @"🌅", @"🌃", @"🗽", @"🌉", @"🎠", @"🎡",
        @"⛲", @"🎢", @"🚢", @"⛵", @"🚤", @"🚣", @"⚓", @"🚀", @"✈", @"💺",
        @"🚁", @"🚂", @"🚊", @"🚉", @"🚞", @"🚆", @"🚄", @"🚅", @"🚈", @"🚇",
        @"🚝", @"🚋", @"🚃", @"🚎", @"🚌", @"🚍", @"🚙", @"🚘", @"🚗", @"🚕",
        @"🚖", @"🚛", @"🚚", @"🚨", @"🚓", @"🚔", @"🚒", @"🚑", @"🚐", @"🚲",
        @"🚡", @"🚟", @"🚠", @"🚜", @"💈", @"🚏", @"🎫", @"🚦", @"🚥", @"⚠",
        @"🚧", @"🔰", @"⛽", @"🏮", @"🎰", @"♨", @"🗿", @"🎪", @"🎭", @"📍",
        @"🚩", @"🇯🇵", @"🇰🇷", @"🇩🇪", @"🇨🇳", @"🇺🇸", @"🇫🇷", @"🇪🇸", @"🇮🇹", @"🇷🇺",
        @"🇬🇧"];
        [self->_characters addObject:chars_008];
        
        // ##
        NSArray *chars_009 = @[
        @"1⃣", @"2⃣", @"3⃣", @"4⃣", @"5⃣", @"6⃣", @"7⃣", @"8⃣", @"9⃣", @"0⃣",
        @"🔟", @"🔢", @"#⃣", @"🔣", @"⬆", @"⬇", @"⬅", @"➡", @"🔠", @"🔡",
        @"🔤", @"↗", @"↖", @"↘", @"↙", @"↔", @"↕", @"🔄", @"◀", @"▶",
        @"🔼", @"🔽", @"↩", @"↪", @"ℹ", @"⏪", @"⏩", @"⏫", @"⏬", @"⤵",
        @"⤴", @"🆗", @"🔀", @"🔁", @"🔂", @"🆕", @"🆙", @"🆒", @"🆓", @"🆖",
        @"📶", @"🎦", @"🈁", @"🈯", @"🈳", @"🈵", @"🈴", @"🈲", @"🉐", @"🈹",
        @"🈺", @"🈶", @"🈚", @"🚻", @"🚹", @"🚺", @"🚼", @"🚾", @"🚰", @"🚮",
        @"🅿", @"♿", @"🚭", @"🈷", @"🈸", @"🈂", @"Ⓜ", @"🛂", @"🛄", @"🛅",
        @"🛃", @"🉑", @"㊙", @"㊗", @"🆑", @"🆘", @"🆔", @"🚫", @"🔞", @"📵",
        @"🚯", @"🚱", @"🚳", @"🚷", @"🚸", @"⛔", @"✳", @"❇", @"❎", @"✅",
        @"✴", @"💟", @"🆚", @"📳", @"📴", @"🅰", @"🅱", @"🆎", @"🅾", @"💠",
        @"➿", @"♻", @"♈", @"♉", @"♊", @"♋", @"♌", @"♍", @"♎", @"♏",
        @"♐", @"♑", @"♒", @"♓", @"⛎", @"🔯", @"🏧", @"💹", @"💲", @"💱",
        @"©", @"®", @"™", @"〽", @"〰", @"🔝", @"🔚", @"🔙", @"🔛", @"🔜",
        @"❌", @"⭕", @"❗", @"❓", @"❕", @"❔", @"🔃", @"🕛", @"🕧", @"🕐",
        @"🕜", @"🕑", @"🕝", @"🕒", @"🕞", @"🕓", @"🕟", @"🕔", @"🕠", @"🕕",
        @"🕖", @"🕗", @"🕘", @"🕙", @"🕚", @"🕡", @"🕢", @"🕣", @"🕤", @"🕥",
        @"🕦", @"✖", @"➕", @"➖", @"➗", @"♠", @"♥", @"♣", @"♦", @"💮",
        @"💯", @"✔", @"☑", @"🔘", @"🔗", @"➰", @"🔱", @"🔲", @"🔳", @"◼",
        @"◻", @"◾", @"◽", @"▪", @"▫", @"🔺", @"⬜", @"⬛", @"⚫", @"⚪",
        @"🔴", @"🔵", @"🔻", @"🔶", @"🔷", @"🔸", @"🔹"];
        [self->_characters addObject:chars_009];
        
    }
    // ##
    // ##
    // ##  iOS 5.1.1 character set from Emoji keyboard
    // ##
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0") &&
        SYSTEM_VERSION_LESS_THAN(@"5.1.1")) {
        NSArray *chars_010 = @[
        @"😄", @"😊", @"😃", @"☺", @"😉", @"😍", @"😘", @"😚", @"😳", @"😌",
        @"😁", @"😜", @"😝", @"😒", @"😏", @"😓", @"😔", @"😞", @"😖", @"😥",
        @"😰", @"😨", @"😣", @"😢", @"😭", @"😂", @"😲", @"😱", @"😠", @"😡",
        @"😪", @"😷", @"👿", @"👽", @"💛", @"💙", @"💜", @"💗", @"💚", @"❤",
        @"💔", @"💓", @"💘", @"✨", @"🌟", @"💢", @"❕", @"❔", @"💤", @"💨",
        @"💦", @"🎶", @"🎵", @"🔥", @"💩", @"👍", @"👎", @"👌", @"👊", @"✊",
        @"✌", @"👋", @"✋", @"👐", @"👆", @"👇", @"👉", @"👈", @"🙌", @"🙏",
        @"☝", @"👏", @"💪", @"🚶", @"🏃", @"👫", @"💃", @"👯", @"🙆", @"🙅",
        @"💁", @"🙇", @"💏", @"💑", @"💆", @"💇", @"💅", @"👦", @"👧", @"👩",
        @"👨", @"👶", @"👵", @"👴", @"👱", @"👲", @"👳", @"👷", @"👮", @"👼",
        @"👸", @"💂", @"💀", @"👣", @"💋", @"👄", @"👂", @"👀", @"👃"];
        [self->_characters addObject:chars_010];
        
        // ##
        NSArray *chars_011 = @[
        @"☀", @"☔", @"☁", @"⛄", @"🌙", @"⚡", @"🌀", @"🌊", @"🐱", @"🐶",
        @"🐭", @"🐹", @"🐰", @"🐺", @"🐸", @"🐯", @"🐨", @"🐻", @"🐷", @"🐮",
        @"🐗", @"🐵", @"🐒", @"🐴", @"🐎", @"🐫", @"🐑", @"🐘", @"🐍", @"🐦",
        @"🐤", @"🐔", @"🐧", @"🐛", @"🐙", @"🐠", @"🐟", @"🐳", @"🐬", @"💐",
        @"🌸", @"🌷", @"🍀", @"🌹", @"🌻", @"🌺", @"🍁", @"🍃", @"🍂", @"🌴",
        @"🌵", @"🌾", @"🐚", @""];
        [self->_characters addObject:chars_011];
        
        // ##
        NSArray *chars_012 = @[
        @"🎍", @"💝", @"🎎", @"🎒", @"🎓", @"🎏", @"🎆", @"🎇", @"🎐", @"🎑",
        @"🎃", @"👻", @"🎅", @"🎄", @"🎁", @"🔔", @"🎉", @"🎈", @"💿", @"📀",
        @"📷", @"🎥", @"💻", @"📺", @"📱", @"📠", @"☎", @"💽", @"📼", @"🔊",
        @"📢", @"📣", @"📻", @"📡", @"➿", @"🔍", @"🔓", @"🔒", @"🔑", @"✂",
        @"🔨", @"💡", @"📲", @"📩", @"📫", @"📮", @"🛀", @"🚽", @"💺", @"💰",
        @"🔱", @"🚬", @"💣", @"🔫", @"💊", @"💉", @"🏈", @"🏀", @"⚽", @"⚾",
        @"🎾", @"⛳", @"🎱", @"🏊", @"🏄", @"🎿", @"♠", @"♥", @"♣", @"♦",
        @"🏆", @"👾", @"🎯", @"🀄", @"🎬", @"📝", @"📖", @"🎨", @"🎤", @"🎧",
        @"🎺", @"🎷", @"🎸", @"〽", @"👟", @"👡", @"👠", @"👢", @"👕", @"👔",
        @"👗", @"👘", @"👙", @"🎀", @"🎩", @"👑", @"👒", @"🌂", @"💼", @"👜",
        @"💄", @"💍", @"💎", @"☕", @"🍵", @"🍺", @"🍻", @"🍸", @"🍶", @"🍴",
        @"🍔", @"🍟", @"🍝", @"🍛", @"🍱", @"🍣", @"🍙", @"🍘", @"🍚", @"🍜",
        @"🍲", @"🍞", @"🍳", @"🍢", @"🍡", @"🍦", @"🍧", @"🎂", @"🍰", @"🍎",
        @"🍊", @"🍉", @"🍓", @"🍆", @"🍅"];
        [self->_characters addObject:chars_012];
        
        // ##
        NSArray *chars_013 = @[
        @"🏠", @"🏫", @"🏢", @"🏣", @"🏥", @"🏦", @"🏪", @"🏩", @"🏨", @"💒",
        @"⛪", @"🏬", @"🌇", @"🌆", @"🏧", @"🏯", @"🏰", @"⛺", @"🏭", @"🗼",
        @"🗻", @"🌄", @"🌅", @"🌃", @"🗽", @"🌈", @"🎡", @"⛲", @"🎢", @"🚢",
        @"🚤", @"⛵", @"✈", @"🚀", @"🚲", @"🚙", @"🚗", @"🚕", @"🚌", @"🚓",
        @"🚒", @"🚑", @"🚚", @"🚃", @"🚉", @"🚄", @"🚅", @"🎫", @"⛽", @"🚥",
        @"⚠", @"🚧", @"🔰", @"🎰", @"🚏", @"💈", @"♨", @"🏁", @"🎌", @"🇯🇵",
        @"🇰🇷", @"🇨🇳", @"🇺🇸", @"🇫🇷", @"🇪🇸", @"🇮🇹", @"🇷🇺", @"🇬🇧", @"🇩🇪"];
        [self->_characters addObject:chars_013];
        
        // ##
        NSArray *chars_014 = @[
        @"1⃣", @"2⃣", @"3⃣", @"4⃣", @"5⃣", @"6⃣", @"7⃣", @"8⃣", @"9⃣", @"0⃣",
        @"#⃣", @"⬆", @"⬇", @"⬅", @"➡", @"↗", @"↖", @"↘", @"↙", @"◀",
        @"▶", @"⏪", @"⏩", @"🆗", @"🆕", @"🔝", @"🆙", @"🆒", @"🎦", @"🈁",
        @"📶", @"🈵", @"🈳", @"🉐", @"🈹", @"🈯", @"🈺", @"🈶", @"🈚", @"🈷",
        @"🈸", @"🈂", @"🚻", @"🚹", @"🚺", @"🚼", @"🚭", @"🅿", @"♿", @"🚇",
        @"🚾", @"㊙", @"㊗", @"🔞", @"🆔", @"✳", @"✴", @"💟", @"🆚", @"📳",
        @"📴", @"💹", @"💱", @"♈", @"♉", @"♊", @"♋", @"♌", @"♍", @"♎",
        @"♏", @"♐", @"♑", @"♒", @"♓", @"⛎", @"🔯", @"🅰", @"🅱", @"🆎",
        @"🅾", @"🔲", @"🔴", @"🔳", @"🕛", @"🕐", @"🕑", @"🕒", @"🕓", @"🕔",
        @"🕕", @"🕖", @"🕗", @"🕘", @"🕙", @"🕚", @"⭕", @"❌", @"©", @"®",
        @"™"];
        [self->_characters addObject:chars_014];
        
    }
}
@end