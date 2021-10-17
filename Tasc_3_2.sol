pragma ton-solidity >= 0.35.0;

contract Tasc_3_2 {
    struct list {
        string name;
        uint32 time;
        bool flag;    
    }

    mapping (int8 => list) data;
    int8 key = 0;

    //добавить задачу
    function add_data(string _name, bool _flag) public {
        key += 1;
        data[key] = list(_name, now, _flag);
    }

    //получить количество открытых задач
    function open_tasc() public returns (int) {
        int count = 0;
        for (int8 i = 1; i <= key; i++) {
            if (data[i].flag) {
                count += 1;
            }
        }
        return count;
    }

    //получить список задач
    function get_tascs() public returns (string[]) {
        string[] temp;
        for (int8 i = 1; i <= key; i++) {
            temp.push(data[i].name);
        }
        return temp;
    }

    //получить описание задачи по ключу
    function key_tasc(int8 _key) public view returns (string) {
        return data[_key].name;
    }

    //удалить задачу по ключу
    function del_tasc(int8 _key) public {
        delete data[_key];
    }

    //отметить задачу как выполненную по ключу
    function ready_tasc(int8 _key) public {
        data[_key].flag = true;
    }
}

