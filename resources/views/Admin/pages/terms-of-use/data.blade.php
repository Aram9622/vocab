@foreach($model as $news)
    <tr>
        <td>{{ $news->id }}</td>
        <td>{{ $news->question }}</td>
        <td>{{ $news->created_at }}</td>
        <td>{{ $news->updated_at }}</td>
        <td>
            <a class="btn btn-primary" href="{{ route('admin.terms-of-use.update', $news->id) }}">Update</a>
            <a class="btn btn-danger" href="{{ route('admin.terms-of-use.remove', $news->id) }}">remove</a>
        </td>
    </tr>
@endforeach
