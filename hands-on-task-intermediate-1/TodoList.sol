// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList {

    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external { // calldata is for saving gas
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }

    function updateText(uint _index, string calldata _text) external { // calldata is for saving gas
        // expensive if you update more than one field
        // in here, we update one field
        todos[_index].text = _text;

        // cheaper if you update more than one field
        // Todo storage todo = todos[_index];
        // todo.text = _text;
    }

    function get(uint _index) external view returns(string memory, bool) {
        // storage - 29397
        // memory - 29480
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }

}