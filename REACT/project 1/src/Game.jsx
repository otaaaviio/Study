import { useState } from 'react';
import './styles.css'

const winningSquare = Array(9);

function Square({ value, onSquareClick, i }) {
    return (
        <button className={`${winningSquare[i] ? 'winning' : 'square'}`} onClick={onSquareClick}>{value}</button>
    );
}

export default function Game() {
    const [squares, setSquares] = useState(Array(9).fill(null));
    const [xIsNext, setXIsNext] = useState(true);
    const [filledSquaresCount, setFilledSquaresCount] = useState(0);

    function handleClick(i) {
        const nextSquares = squares.slice();
        if (squares[i] || calculateWinner(squares)) {
            return;
        }
        if (xIsNext) {
            nextSquares[i] = "X";
        } else {
            nextSquares[i] = "O";
        }
        setSquares(nextSquares);
        setFilledSquaresCount(prevCount => prevCount + 1);
        setXIsNext(!xIsNext);
    }

    function handleReset() {
        setSquares(Array(9).fill(null));
        for (let i = 0; i < 9; i++)
            winningSquare[i] = false;
        setFilledSquaresCount(0);
        setXIsNext(true);
    }

    const winner = calculateWinner(squares);
    let status;
    if (winner) {
        status = "Winner: " + winner;
    } else if (filledSquaresCount === 0) {
        status = "Empate";
    } else
        status = "Next player: " + (xIsNext ? "X" : "O");

    const renderSquare = (i) => (
        <Square value={squares[i]} onSquareClick={() => handleClick(i)} i={i} />
    );

    const renderBoard = () => {
        const board = [];
        for (let row = 0; row < 3; row++) {
            const squaresRow = [];
            for (let col = 0; col < 3; col++) {
                squaresRow.push(renderSquare(row * 3 + col));
            }
            board.push(<div className='border-row'>{squaresRow}</div>);
        }
        return board;
    };

    return (
        <>
            <div className='header'>
                <button className='reset' onClick={handleReset}>Reset Board</button>
                <div className="status">{status}</div>
            </div>
            <div className='board'>
                {renderBoard()}
            </div>
        </>
    )
}

function calculateWinner(squares) {
    const lines = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ];
    for (let i = 0; i < lines.length; i++) {
        const [a, b, c] = lines[i];
        if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
            winningSquare[a] = true;
            winningSquare[b] = true;
            winningSquare[c] = true;
            return squares[a];
        }
    }
    return null;
}