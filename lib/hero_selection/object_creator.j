//! textmacro CREATE_SPELL_SELECT_OBJECT takes OBJ_ID, NUM
    //! externalblock extension=lua ObjectMerger $FILENAME$
        //! i setobjecttype("abilities")
        //! i if not objectexists("C$OBJ_ID$") then
        //! i   createobject("ANeg","C$OBJ_ID$")
        //! i   makechange(current,"Neg3","1","A$OBJ_ID$,Abl$NUM$")
        //! i   makechange(current,"Neg4","1","")
        //! i   makechange(current,"Neg5","1","")
        //! i   makechange(current,"Neg6","1","")
        //! i   makechange(current,"Neg2","1","0.0")
        //! i   makechange(current,"Neg1","1","0.0")
        //! i   makechange(current,"alev","1")
        //! i   makechange(current,"anam","Change to A$OBJ_ID$")
        //! i end
    //! endexternalblock
//! endtextmacro

/*
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("111", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("112", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("113", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("114", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("121", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("122", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("123", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("124", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("131", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("132", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("133", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("141", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("142", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("143", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("144", "4")

//! runtextmacro CREATE_SPELL_SELECT_OBJECT("211", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("212", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("213", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("214", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("221", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("222", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("223", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("224", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("231", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("232", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("233", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("241", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("242", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("243", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("244", "4")

//! runtextmacro CREATE_SPELL_SELECT_OBJECT("311", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("312", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("313", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("314", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("321", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("322", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("323", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("324", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("331", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("332", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("333", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("341", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("342", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("343", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("344", "4")

//! runtextmacro CREATE_SPELL_SELECT_OBJECT("411", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("412", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("413", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("414", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("421", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("422", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("423", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("424", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("431", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("432", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("433", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("441", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("442", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("443", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("444", "4")

//! runtextmacro CREATE_SPELL_SELECT_OBJECT("511", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("512", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("513", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("514", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("521", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("522", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("523", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("524", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("531", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("532", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("533", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("541", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("542", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("543", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("544", "4")

//! runtextmacro CREATE_SPELL_SELECT_OBJECT("611", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("612", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("613", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("614", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("621", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("622", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("623", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("624", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("631", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("632", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("633", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("641", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("642", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("643", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("644", "4")

//! runtextmacro CREATE_SPELL_SELECT_OBJECT("711", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("712", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("713", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("714", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("721", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("722", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("723", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("724", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("731", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("732", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("733", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("741", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("742", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("743", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("744", "4")

//! runtextmacro CREATE_SPELL_SELECT_OBJECT("811", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("812", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("813", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("814", "1")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("821", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("822", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("823", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("824", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("831", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("832", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("833", "3")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("841", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("842", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("843", "4")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("844", "4")


//! runtextmacro CREATE_SPELL_SELECT_OBJECT("H12", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("H22", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("H32", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("H42", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("H52", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("H62", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("H72", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("H82", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("H92", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("HA2", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("HB2", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("HC2", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("HD2", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("HE2", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("HF2", "2")
//! runtextmacro CREATE_SPELL_SELECT_OBJECT("HG2", "2")*/


