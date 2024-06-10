#[starknet::interface]
trait ISimpleStorage<TContractState> {
    fn set(ref self: TContractState, x: u32);
    fn get(self: @TContractState) -> u32;
}

#[starknet::contract]
mod SimpleStorage {

    #[storage]
    struct Storage {
       data: u32, 
    }
    
    #[constructor]
    fn constructor(ref self: ContractState,c:u32)
    {
        self.data.write(c)
    }
    #[abi(embed_v0)]
    impl SimpleStorage of super::ISimpleStorage<ContractState> {
        fn set(ref self: ContractState, x:u32) {
            self.data.write(x);
        }

        fn get(self: @ContractState) -> u32 {
            self.data.read()
        }
    }
}