# CloudFirestore schema
## root
```json
{
  users: [
    $userId: {
      tasks: [
        $taskId: {
          name: String,
          createdAt: date?,
          isDone: boolean,
        },
        ...
      ]
    },
    ...
  ]
}
```
