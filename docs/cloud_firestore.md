# CloudFirestore schema
## root
```json
{
  users: [
    $userId: {
      // field
      username: String,
      // collection
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
