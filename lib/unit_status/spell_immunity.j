library SpellImmunity uses Table, TimerUtilsEx

/*
    SpellImmunity.create(unit)
        - Make a unit spell immune.

    this.duration = <time duration>
        - Add an expiration timer to a SpellImmunity instance.

    this.destroy()
        - Destroy the SpellImmunity instance.
*/

    struct SpellImmunity extends array
        implement Alloc

        private unit u
        private static Table tb
        private static constant integer ABILITY_ID = 'ASIS'

        method destroy takes nothing returns nothing
            local integer id = GetHandleId(this.u)
            set thistype.tb[id] = thistype.tb[id] - 1
            if thistype.tb[id] == 0 then
                call UnitRemoveAbility(u, thistype.ABILITY_ID)
                call thistype.tb.remove(id)
            endif
            set this.u = null
            call this.deallocate()
        endmethod

        static method create takes unit u returns thistype
            local thistype this = thistype.allocate()
            local integer id = GetHandleId(u)
            set this.u = u
            if thistype.tb.has(id) then
                set thistype.tb[id] = thistype.tb[id] + 1
            else
                set thistype.tb[id] = 1
                call UnitAddAbility(u, thistype.ABILITY_ID)
                call UnitMakeAbilityPermanent(u, true, thistype.ABILITY_ID)
            endif
            return this
        endmethod

        private static method expires takes nothing returns nothing
            call thistype(ReleaseTimer(GetExpiredTimer())).destroy()
        endmethod

        method operator duration= takes real time returns nothing
            call TimerStart(NewTimerEx(this), time, false, function thistype.expires)
        endmethod

        private static method onInit takes nothing returns nothing
            set thistype.tb = Table.create()
        endmethod

    endstruct


endlibrary
