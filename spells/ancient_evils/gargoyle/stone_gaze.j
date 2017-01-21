scope StoneGaze

    globals
        private constant integer SPELL_ID = 'A613'
        private constant integer BUFF_ID = 'D613'
        private constant string MODEL = "Abilities\\Spells\\Undead\\DeathCoil\\DeathCoilMissile.mdl"
        private constant string SFX = ""
        private constant attacktype ATTACK_TYPE = ATTACK_TYPE_NORMAL
        private constant damagetype DAMAGE_TYPE = DAMAGE_TYPE_MAGIC
    endglobals
    
    private function DamageDealt takes integer level returns real
        if level == 11 then
            return 1200.0
        endif
        return 60.0*level
    endfunction

    private function BonusArmor takes integer level returns real
        return 100.0 + 0.0*level
    endfunction
    
    private function Speed takes integer level returns real
        return 1500.0 + 0.0*level
    endfunction

    private function Duration takes integer level returns real
        if level == 11 then
            return 8.0
        endif
        return 0.4*level
    endfunction
    
    private function TargetFilter takes unit u, player p returns boolean
        return UnitAlive(u) and IsUnitEnemy(u, p) and not IsUnitType(u, UNIT_TYPE_STRUCTURE) and not IsUnitType(u, UNIT_TYPE_MAGIC_IMMUNE)
    endfunction

    private struct SpellBuff extends Buff
     
        readonly Armor a 
        private SpellImmune si
        private Stun s
        private effect sfx
        
        
        method rawcode takes nothing returns integer
            return BUFF_ID
        endmethod
        
        method dispelType takes nothing returns integer
            return BUFF_NEGATIVE
        endmethod
        
        method stackType takes nothing returns integer
            return BUFF_STACK_PARTIAL
        endmethod
        
        method onRemove takes nothing returns nothing
            call this.a.destroy()
            call this.si.destroy()
            call this.s.destroy()
            call DestroyEffect(this.sfx)
            call SetUnitVertexColor(this.target, 255, 255, 255, 255)
            set this.sfx = null
        endmethod
        
        method onApply takes nothing returns nothing
            set this.a = Armor.create(this.target, 0)
            set this.si = SpellImmune.create(this.target)
            set this.s = Stun.create(this.target, 0, false)
            set this.sfx = AddSpecialEffectTarget(SFX, this.target, "origin")
            call SetUnitVertexColor(this.target, 50, 50, 50, 255)
        endmethod
        
        implement BuffApply
    endstruct
    
    struct StoneGaze extends array
        
        private unit caster
        private unit target
        private integer lvl
        private player owner
        private Missile m
        
        private method destroy takes nothing returns nothing
            call this.m.destroy()
            set this.caster = null
            set this.target = null
            set owner = null
        endmethod
        
        private static method onHit takes nothing returns nothing
            local thistype this = Missile.getHit()
            local SpellBuff b
            if not SpellBlock.has(this.target) and TargetFilter(this.target, this.owner) then
                set b = SpellBuff.add(this.caster, this.target)
                call b.a.change(BonusArmor(this.lvl))
                call Damage.element.apply(this.caster, this.target, DamageDealt(this.lvl), ATTACK_TYPE, DAMAGE_TYPE, DAMAGE_ELEMENT_EARTH)
            endif
            call this.destroy()
        endmethod
        
        private static method onCast takes nothing returns nothing
            local thistype this = thistype(Missile.create())
            set this.caster = GetTriggerUnit()
            set this.owner = GetTriggerPlayer()
            set this.target = GetSpellTargetUnit()
            set this.lvl = GetUnitAbilityLevel(this.caster, SPELL_ID)
            set this.m = Missile(this)
            set this.m.sourceUnit = this.caster
            set this.m.targetUnit = this.target
            set this.m.model = MODEL
            set this.m.speed = Speed(this.lvl)
            call this.m.registerOnHit(function thistype.onHit)
            call this.m.launch()
            call SystemMsg.create(GetUnitName(GetTriggerUnit()) + " cast thistype")
        endmethod
        
        static method init takes nothing returns nothing
            call SystemTest.start("Initializing thistype: ")
            call RegisterSpellEffectEvent(SPELL_ID, function thistype.onCast)
            call SystemTest.end()
        endmethod
        
    endstruct
endscope