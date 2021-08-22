open Uints

module Make (Mmu : Word_addressable_intf.S) : sig

  val f : Mmu.t -> pc:uint16 -> uint16 * (int * int) * Instruction.t

end
