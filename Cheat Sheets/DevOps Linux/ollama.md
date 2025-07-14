## CLI

    ollama list
    ollama pull <model>
    ollama run <model>

## Simple usage with curl

For a local installation you can use curl like this

    curl http://localhost:11434/api/generate -d '{
      "model": "qwen2.5-coder:1.5b",
      "prompt": "Why is the sky blue? Give the shortest answer possible in under 20 words",
      "stream": false
    }'

and will receive a response like this

    {
      "model": "qwen2.5-coder:1.5b",
      "created_at": "2025-07-14T09:36:10.352299625Z",
      "response": "Because of the Earth's atmosphere.",
      "done": true,
      "done_reason": "stop",
      "context": [
        151644,
        8948,
      [...]
        594,
        16566,
        13
      ],
      "total_duration": 1251770025,
      "load_duration": 77477704,
      "prompt_eval_count": 46,
      "prompt_eval_duration": 721473474,
      "eval_count": 8,
      "eval_duration": 451629068
    }
