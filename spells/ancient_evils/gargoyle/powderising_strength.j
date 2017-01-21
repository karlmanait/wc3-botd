scope PowderisingStrength

    globals
        private constant integer SPELL_ID = 'A641'
    endglobals

    private function LifeSteal takes integer level returns real
        if level == 11 then
            return 1.10
        endif
        return 0.04*level + 0.15
    endfunction
    
    private function TargetFilter takes unit u, player p returns boolean
        return UnitAlive(u) and IsUnitEnemy(u, p) and IsUnitType(u, UNIT_TYPE_STRUCTURE)
    endfunction
    
    struct PowderisingStrength extends array
        
        private static method onDamage takes nothing returns nothing
            local integer level = GetUnitAbilityLevel(Damage.source, SPELL_ID)
            if level > 0 and Damage.type == DAMAGE_TYPE_PHYSICAL and not Damage.element.coded and TargetFilter(Damage.target, GetOwningPlayer(Damage.source))  then
                call Heal.unit(Damage.source, LifeSteal(level)*Damage.amount, 1.0)
            endif
        endmethod
        
        static method init takes nothing returns nothing
            call SystemTest.start("Initializing thistype: ")
            call Damage.register(function thistype.onDamage)
            call SystemTest.end()
        endmethod
        
    endstruct
    
endscope