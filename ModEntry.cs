using System.Diagnostics;
using JumpKing.Mods;

namespace JumpKingModTemplate
{
    [JumpKingMod("McOuille.JumpKingModTemplate")]
    public static class ModEntry
    {
        [BeforeLevelLoad]
        public static void BeforeLevelLoad()
        {
            Debugger.Launch();
        }
        
        [OnLevelStart]
        public static void OnLevelStart()
        {
            
        }
        
        [OnLevelUnload]
        public static void OnLevelUnload()
        {
            
        }
        
        [OnLevelEnd]
        public static void OnLevelEnd()
        {
            
        }
        
        [MainMenuItemSetting]
        public static BehaviorTree.IBTSimpleMenuItem MainMenuItemSetting()
        {
            return null;
        }
        
        [PauseMenuItemSetting]
        public static BehaviorTree.IBTSimpleMenuItem PauseMenuItemSetting()
        {
            return null;
        }
    }
}